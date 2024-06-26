package kue

import (
	"encoding/json"
	"encoding/yaml"
	"path"
	"regexp"
	"strings"
	"tool/cli"
	"tool/exec"
	"tool/file"
)

#KUE: {
	#apiResources: _
	_ar: {
		for v, vv in #apiResources for k, kv in vv {
			R=(kv.name): {
				kind: k
				// k._ar.events.apiVersion: conflicting values "events.k8s.io/v1" and "v1":
				apiVersion: *v | _
				...
			}
			(strings.ToLower(k)): R
			if (kv.shortnames != _|_) {
				for sn in kv.shortnames {(sn): R}
			}
		}
	}

	// resources definition in tree form to be provided by user
	// "RESOURCE NAME": "SPECIFIC NAME": _
	// Resource names are case-insensitive, shortname supported.
	// e.g. `#resources: deploy: dp: _`
	#resources: [R=_]: [N=_]: _ar[strings.ToLower(R)] & {metadata: name: N}

	// desired manifests as `kubectl get -o yaml` in yaml stream form
	manifests: yaml.MarshalStream([for _, k in #resources for _, n in k {n}])
}

#Command: {
	#var: {
		apiResources: _
		package:      *"kue" | _
		path: *["kubernetes", "apiResources"] | _
		modDir:  *"../.." | _
		relPath: *"cluster/kind" | _
	}
	_local: {
		dir: ".kue"
		pathArgs: strings.Join([for p in #var.path {"--path \"\(p)\""}], " ")
		expression: strings.Join(#var.path, ".")
		pkgId: {for p in [for v, vv in #var.apiResources for k, kv in vv {kv.package}] {
			(p): strings.Replace(regexp.ReplaceAll("[/.]", strings.TrimPrefix(p, "k8s.io/api/"), ""), "apiserver", "", -1)
		}}
	}
	"kue-crds": {
		mkdir: file.Mkdir & {
			path: _local.dir
		}
		get: exec.Run & {
			cmd:    "kubectl get crds --output=yaml"
			stdout: string
		}
		save: file.Create & {
			$after: mkdir
			filename: path.Join([mkdir.path, "crds.yaml"])
			contents: get.stdout
		}
		vendor: exec.Run & {
			let F = path.Join([#var.relPath, save.filename])
			$after: save
			dir:    #var.modDir
			cmd:    "timoni mod vendor crds --file \(F)"
		}
	}
	"kue-init": {
		ar: exec.Run & {
			cmd: "cue cmd kue-api-resources"
		}
		import: exec.Run & {
			after: ar
			let G = "kue_api_resources_gen.cue"
			cmd: #"cue import --force --package \#(#var.package) \#(_local.pathArgs) \#(AR.json.filename) --outfile \#(G)"#
		}
		generate: exec.Run & {
			after: import
			cmd:   "cue cmd kue-generate"
		}
	}
	"kue-generate": {
		let FN = "kue_gen.cue"
		imports: cli.Print & {
			_exclude: {
				apiextensionsv1:   _
				apiregistrationv1: _
			}
			text: strings.Join([for p, i in _local.pkgId if _exclude[i] == _|_ let P = regexp.ReplaceAll("\\.[^/]*(/[^/]+)$", p, "$1") {
				#"\#t\#(i) "\#(P)""#
			}], "\n")
		}
		defs: cli.Print & {
			$after: imports
			_exclude: {
				customresourcedefinitions: _
				apiservices:               _
			}
			text: strings.Join([for v, vv in #var.apiResources for k, kv in vv if _exclude[kv.name] == _|_ {
				"\t\(kv.name)?: [_]: \(_local.pkgId[kv.package]).#\(k)"
			}], "\n")
		}
		create: file.Create & {
			filename: FN
			contents: """
				package \(#var.package)

				import (
					\(imports.text)

					"github.com/abc-dp/kue"
				)
				#kue: kue.#KUE & {
					#apiResources: \(_local.expression)
					#resources: {
						\(defs.text)
					}
				}
				"""
		}
		fmt: exec.Run & {
			$after: create
			cmd:    "cue fmt \(FN)"
		}
	}
	AR="kue-api-resources": {
		run: exec.Run & {
			cmd:    "kubectl api-resources"
			stdout: string
		}
		mkdir: file.Mkdir & {
			path: _local.dir
		}
		txt: file.Create & {
			filename: path.Join([mkdir.path, "api-resources.txt"])
			contents: run.stdout
		}
		txtPrint: cli.Print & {
			text: strings.Join([run.cmd, txt.contents], "\n\n")
		}
		J="json": file.Create & {
			_locals: {
				lines:   strings.Split(run.stdout, "\n")
				headers: strings.Fields(lines[0])
				records: [for ln in lines[1:] if ln != "" {
					let FLDS = strings.Fields(ln)
					if len(FLDS) < len(headers) {
						let HDRS = [for h in headers if h != "SHORTNAMES" {h}]
						for i, _ in FLDS {(HDRS[i]): FLDS[i]}
					}
					if len(FLDS) == len(headers) {
						for i, _ in FLDS {(headers[i]): FLDS[i]}
					}
				}]
				gvk: {for r in _locals.records {
					(r.APIVERSION): (r.KIND): {
						name:       r.NAME
						namespaced: r.NAMESPACED
						if r.SHORTNAMES != _|_ {
							shortnames: strings.Split(r.SHORTNAMES, ",")
						}
						let AV = r.APIVERSION

						// if or([regexp.Match(".*\\.k8s\\.io(/[^/]*)?", AV), !strings.Contains(".", AV)])
						let P = strings.Replace(AV, ".k8s.io", "", -1)
						package: *"k8s.io/api/\(P)" | _
						if AV == "v1" {
							package: "k8s.io/api/core/v1"
						}
					}
				}}
			}
			filename: path.Join([mkdir.path, "api-resources.json"])
			contents: json.Indent(json.Marshal(_locals.gvk), "", "  ")
		}
		jsonPrint: cli.Print & {
			$after: txtPrint
			text: strings.Join(["Convert to JSON", J.contents], "\n\n")
		}
	}
	"kue-examples": cli.Print & {
		_exclude: events: _
		text: strings.Join([for v, vv in #var.apiResources for k, kv in vv if _exclude[kv.name] == _|_ {"\(kv.name): ex: _"}], "\n")
	}
}
