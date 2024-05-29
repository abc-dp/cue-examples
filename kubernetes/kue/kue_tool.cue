package kue

import (
	"encoding/json"
	"regexp"
	"strings"
	"tool/cli"
	"tool/exec"
	"tool/file"
)

command: {
	_pkgId: {for p in [for v, vv in cluster.apiResources {for k, kv in vv {kv.package}}] {
		(p): regexp.ReplaceAll("[/.]", strings.TrimPrefix(p, "k8s.io/api/"), "")
	}}
	"kue-imports": cli.Print & {
		text: strings.Join([for p, i in _pkgId {#"\#(i) "\#(p)""#}], "\n")
	}
	// "kue-defs": cli.Print & {
	// 	text: strings.Join([for v, vv in cluster.apiResources {for k, kv in vv {"foo"
	// 		// let I = _pkgId[kv.import]
	// 		// "\(kv.name): [_]: \(I).#\(k)"
	// 	}}], "\n")
	// }
	"kue-api-resources": {
		run: exec.Run & {
			cmd:    "kubectl api-resources"
			stdout: string
		}
		mkdir: file.Mkdir & {
			path: ".kue"
		}
		txt: file.Create & {
			filename: "\(mkdir.path)/api-resources.txt"
			contents: run.stdout
		}
		"json": file.Create & {
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
						let P = strings.Replace(r.APIVERSION, ".k8s.io", "", -1)
						package: *"k8s.io/api/\(P)" | _
						if r.APIVERSION == "v1" {
							package: "k8s.io/api/core/v1"
						}
					}
				}}
			}
			filename: "\(mkdir.path)/api-resources.json"
			contents: json.Indent(json.Marshal(_locals.gvk), "", "  ")
		}
	}
}
