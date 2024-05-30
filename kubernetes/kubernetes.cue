package kubernetes

import "github.com/abc-dp/cue-examples/kubernetes/cluster"

k: cluster.#Cluster & {
	#resources: {
		bindings: exp:          _
		componentstatuses: exp: _
		configmaps: exp:        _
		endpoints: exp:         _
		// events: exp:                            _
		limitranges: exp:                       _
		namespaces: exp:                        _
		nodes: exp:                             _
		persistentvolumeclaims: exp:            _
		persistentvolumes: exp:                 _
		pods: exp:                              _
		podtemplates: exp:                      _
		replicationcontrollers: exp:            _
		resourcequotas: exp:                    _
		secrets: exp:                           _
		serviceaccounts: exp:                   _
		services: exp:                          _
		mutatingwebhookconfigurations: exp:     _
		validatingadmissionpolicies: exp:       _
		validatingadmissionpolicybindings: exp: _
		validatingwebhookconfigurations: exp:   _
		customresourcedefinitions: exp:         _
		apiservices: exp:                       _
		controllerrevisions: exp:               _
		daemonsets: exp:                        _
		deployments: exp:                       _
		replicasets: exp:                       _
		statefulsets: exp:                      _
		selfsubjectreviews: exp:                _
		tokenreviews: exp:                      _
		localsubjectaccessreviews: exp:         _
		selfsubjectaccessreviews: exp:          _
		selfsubjectrulesreviews: exp:           _
		subjectaccessreviews: exp:              _
		horizontalpodautoscalers: exp:          _
		cronjobs: exp:                          _
		jobs: exp:                              _
		certificatesigningrequests: exp:        _
		leases: exp:                            _
		endpointslices: exp:                    _
		// events: exp:                            _
		flowschemas: exp:                 _
		prioritylevelconfigurations: exp: _
		ingressclasses: exp:              _
		ingresses: exp:                   _
		networkpolicies: exp:             _
		runtimeclasses: exp:              _
		poddisruptionbudgets: exp:        _
		clusterrolebindings: exp:         _
		clusterroles: exp:                _
		rolebindings: exp:                _
		roles: exp:                       _
		priorityclasses: exp:             _
		csidrivers: exp:                  _
		csinodes: exp:                    _
		csistoragecapacities: exp:        _
		storageclasses: exp:              _
		volumeattachments: exp:           _
	}
}
