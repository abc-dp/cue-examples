import (
	"encoding/yaml"
	"strings"
)

cluster: _

#Cluster: {
	let AR = {
		for v, vv in cluster.apiResources {for k, kv in vv {
			R=(kv.name): {
				kind: k
				// k._ar.events.apiVersion: conflicting values "events.k8s.io/v1" and "v1":
				apiVersion: *v | _
				if kv.spec != _|_ {
					spec: kv.spec
				}
			}
			(strings.ToLower(k)): R
			if (kv.shortnames != _|_) {
				for sn in kv.shortnames {(sn): R}
			}
		}}
	}

	// resources definition in tree form to be provided by user
	// "RESOURCE NAME": "SPECIFIC NAME": _
	// Resource names are case-insensitive, shortname supported.
	// e.g. `#resources: deploy: dp: _`
	#resources: [R=_]: [N=_]: AR[strings.ToLower(R)] & {metadata: name: N}

	// desired manifests as `kubectl get -o yaml` in yaml stream form
	manifests: yaml.MarshalStream([for _, k in #resources for _, n in k {n}])
}
