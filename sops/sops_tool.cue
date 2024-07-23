package sops

import "github.com/abcue/sue"

command: sue.#Command & {
	#var: path: ["config"]
}
