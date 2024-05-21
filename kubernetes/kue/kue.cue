package kue

import (
	"encoding/yaml"
	corev1 "k8s.io/api/core/v1"
)

#KUE: {
	// resources definition in tree form to be provided by user
	// "RESOURCE NAME": "SPECIFIC NAME": _
	// Resource names are case-insensitive, shortname supported.
	// e.g. `#resources: deploy: dp: _`
	#resources: {
		[K=_]: [N=_]: {
			metadata: name: N
			kind: K
		}
		bindings: [_]: corev1.#Binding
	}

	// desired manifests as `kubectl get -o yaml` in yaml stream form
	manifests: yaml.MarshalStream([for _, k in #resources for _, n in k {n}])
}
