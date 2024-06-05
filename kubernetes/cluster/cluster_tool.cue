package cluster

import "github.com/abc-dp/kue"

if apiResources != _|_ {
	command: kue.#Command & {
		#apiResources: apiResources
	}
}
