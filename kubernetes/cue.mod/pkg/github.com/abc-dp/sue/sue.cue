package sue

import (
	"strings"
	"tool/exec"
	"tool/file"
)

// Decrypt secret value from sops encrypted file
#Command: sue: {
	#vars: {
		enc: filename: *"sops.enc.yaml" | _
		package: *"sops" | _
		path: ["sops", "dec"]
		expression: *strings.Join(path, ".") | _
	}
	#locals: {
		dec: {
			filename: strings.Replace(#vars.enc.filename, ".enc.", ".dec.", 1)
			imported: strings.Join([filename, "cue"], ".")
		}
		path: strings.Join([for p in #vars.path {#"--path "\#(p)""#}], " ")
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
		cmd:    "cue import \(#locals.dec.filename) \(#locals.path) --package \(#vars.package) --force --outfile \(#locals.dec.imported)"
	}
	export: exec.Run & {
		$after: import
		cmd:    "cue export --package \(#vars.package) --expression \(#vars.expression)"
	}
	for p in #locals.dec {
		"remove_\(p)": file.RemoveAll & {
			$after: export
			path:   p
		}
	}
}
