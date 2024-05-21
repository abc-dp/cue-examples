package kubernetes

import "github.com/abc-dp/cue-examples/kubernetes/kue"

k: kue.#KUE & {
	#resources: bindings: b: _
}
