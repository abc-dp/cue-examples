package sops

import "github.com/abc-dp/sue"

command: sue.#Command & {
	#var: path: ["config"]
}
