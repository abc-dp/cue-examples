package cluster

import "github.com/abc-dp/cue-examples/kubernetes/kue"

if apiResources != _|_ {
	command: kue.#Command & {
		#apiResources: apiResources
	}
}
