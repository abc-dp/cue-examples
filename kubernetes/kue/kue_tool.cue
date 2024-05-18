package kue

import (
	"encoding/json"
	"strings"
	"tool/exec"
	"tool/file"
)

command: "kue-api-resources": {
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
				}
			}}
		}
		filename: "\(mkdir.path)/api-resources.json"
		contents: json.Indent(json.Marshal(_locals.gvk), "", "  ")
	}
}
