package cluster

import "github.com/abc-dp/kue"

if kubernetes.apiResources != _|_ {
	command: kue.#Command & {
		#var: {
			apiResources: kubernetes.apiResources
			package:      "cluster"
		}
	}
}
