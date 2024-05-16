package sops

import (
	"strings"
	"tool/exec"
	"tool/file"
)

command: sops: {
	#vars: {
		enc: filename: *"sops.enc.yaml" | _
		package: *"sops" | _
	}
	#locals: dec: {
		filename: strings.Replace(#vars.enc.filename, ".enc.", ".dec.", 1)
		imported: strings.Join([filename, "cue"], ".")
	}
	decrypt: exec.Run & {
		cmd:    "sops --decrypt \(#vars.enc.filename)"
		stdout: string
	}
	output: file.Create & {
		filename: #locals.dec.filename
		contents: decrypt.stdout
	}
	import: exec.Run & {
		$after: decrypt
		cmd:    "cue import \(#locals.dec.filename) --package sops --force --outfile \(#locals.dec.imported)"
	}
	export: exec.Run & {
		$after: import
		cmd:    "cue export --package \(#vars.package)"
	}
	for p in #locals.dec {
		"remove_\(p)": file.RemoveAll & {
			$after: export
			path:   p
		}
	}
}
