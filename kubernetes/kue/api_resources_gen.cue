package kue

cluster: gvk: {
	v1: {
		Binding: {
			name:       "bindings"
			namespaced: "true"
		}
		ComponentStatus: {
			name: "componentstatuses"
			shortnames: [
				"cs",
			]
			namespaced: "false"
		}
		ConfigMap: {
			name: "configmaps"
			shortnames: [
				"cm",
			]
			namespaced: "true"
		}
		Endpoints: {
			name: "endpoints"
			shortnames: [
				"ep",
			]
			namespaced: "true"
		}
		Event: {
			name: "events"
			shortnames: [
				"ev",
			]
			namespaced: "true"
		}
		LimitRange: {
			name: "limitranges"
			shortnames: [
				"limits",
			]
			namespaced: "true"
		}
		Namespace: {
			name: "namespaces"
			shortnames: [
				"ns",
			]
			namespaced: "false"
		}
		Node: {
			name: "nodes"
			shortnames: [
				"no",
			]
			namespaced: "false"
		}
		PersistentVolumeClaim: {
			name: "persistentvolumeclaims"
			shortnames: [
				"pvc",
			]
			namespaced: "true"
		}
		PersistentVolume: {
			name: "persistentvolumes"
			shortnames: [
				"pv",
			]
			namespaced: "false"
		}
		Pod: {
			name: "pods"
			shortnames: [
				"po",
			]
			namespaced: "true"
		}
		PodTemplate: {
			name:       "podtemplates"
			namespaced: "true"
		}
		ReplicationController: {
			name: "replicationcontrollers"
			shortnames: [
				"rc",
			]
			namespaced: "true"
		}
		ResourceQuota: {
			name: "resourcequotas"
			shortnames: [
				"quota",
			]
			namespaced: "true"
		}
		Secret: {
			name:       "secrets"
			namespaced: "true"
		}
		ServiceAccount: {
			name: "serviceaccounts"
			shortnames: [
				"sa",
			]
			namespaced: "true"
		}
		Service: {
			name: "services"
			shortnames: [
				"svc",
			]
			namespaced: "true"
		}
	}
	"admissionregistration.k8s.io/v1": {
		MutatingWebhookConfiguration: {
			name:       "mutatingwebhookconfigurations"
			namespaced: "false"
		}
		ValidatingWebhookConfiguration: {
			name:       "validatingwebhookconfigurations"
			namespaced: "false"
		}
	}
	"apiextensions.k8s.io/v1": CustomResourceDefinition: {
		name: "customresourcedefinitions"
		shortnames: [
			"crd",
			"crds",
		]
		namespaced: "false"
	}
	"apiregistration.k8s.io/v1": APIService: {
		name:       "apiservices"
		namespaced: "false"
	}
	"apps/v1": {
		ControllerRevision: {
			name:       "controllerrevisions"
			namespaced: "true"
		}
		DaemonSet: {
			name: "daemonsets"
			shortnames: [
				"ds",
			]
			namespaced: "true"
		}
		Deployment: {
			name: "deployments"
			shortnames: [
				"deploy",
			]
			namespaced: "true"
		}
		ReplicaSet: {
			name: "replicasets"
			shortnames: [
				"rs",
			]
			namespaced: "true"
		}
		StatefulSet: {
			name: "statefulsets"
			shortnames: [
				"sts",
			]
			namespaced: "true"
		}
	}
	"authentication.k8s.io/v1": {
		SelfSubjectReview: {
			name:       "selfsubjectreviews"
			namespaced: "false"
		}
		TokenReview: {
			name:       "tokenreviews"
			namespaced: "false"
		}
	}
	"authorization.k8s.io/v1": {
		LocalSubjectAccessReview: {
			name:       "localsubjectaccessreviews"
			namespaced: "true"
		}
		SelfSubjectAccessReview: {
			name:       "selfsubjectaccessreviews"
			namespaced: "false"
		}
		SelfSubjectRulesReview: {
			name:       "selfsubjectrulesreviews"
			namespaced: "false"
		}
		SubjectAccessReview: {
			name:       "subjectaccessreviews"
			namespaced: "false"
		}
	}
	"autoscaling/v2": HorizontalPodAutoscaler: {
		name: "horizontalpodautoscalers"
		shortnames: [
			"hpa",
		]
		namespaced: "true"
	}
	"batch/v1": {
		CronJob: {
			name: "cronjobs"
			shortnames: [
				"cj",
			]
			namespaced: "true"
		}
		Job: {
			name:       "jobs"
			namespaced: "true"
		}
	}
	"certificates.k8s.io/v1": CertificateSigningRequest: {
		name: "certificatesigningrequests"
		shortnames: [
			"csr",
		]
		namespaced: "false"
	}
	"coordination.k8s.io/v1": Lease: {
		name:       "leases"
		namespaced: "true"
	}
	"discovery.k8s.io/v1": EndpointSlice: {
		name:       "endpointslices"
		namespaced: "true"
	}
	"events.k8s.io/v1": Event: {
		name: "events"
		shortnames: [
			"ev",
		]
		namespaced: "true"
	}
	"flowcontrol.apiserver.k8s.io/v1": {
		FlowSchema: {
			name:       "flowschemas"
			namespaced: "false"
		}
		PriorityLevelConfiguration: {
			name:       "prioritylevelconfigurations"
			namespaced: "false"
		}
	}
	"networking.k8s.io/v1": {
		IngressClass: {
			name:       "ingressclasses"
			namespaced: "false"
		}
		Ingress: {
			name: "ingresses"
			shortnames: [
				"ing",
			]
			namespaced: "true"
		}
		NetworkPolicy: {
			name: "networkpolicies"
			shortnames: [
				"netpol",
			]
			namespaced: "true"
		}
	}
	"node.k8s.io/v1": RuntimeClass: {
		name:       "runtimeclasses"
		namespaced: "false"
	}
	"policy/v1": PodDisruptionBudget: {
		name: "poddisruptionbudgets"
		shortnames: [
			"pdb",
		]
		namespaced: "true"
	}
	"rbac.authorization.k8s.io/v1": {
		ClusterRoleBinding: {
			name:       "clusterrolebindings"
			namespaced: "false"
		}
		ClusterRole: {
			name:       "clusterroles"
			namespaced: "false"
		}
		RoleBinding: {
			name:       "rolebindings"
			namespaced: "true"
		}
		Role: {
			name:       "roles"
			namespaced: "true"
		}
	}
	"scheduling.k8s.io/v1": PriorityClass: {
		name: "priorityclasses"
		shortnames: [
			"pc",
		]
		namespaced: "false"
	}
	"storage.k8s.io/v1": {
		CSIDriver: {
			name:       "csidrivers"
			namespaced: "false"
		}
		CSINode: {
			name:       "csinodes"
			namespaced: "false"
		}
		CSIStorageCapacity: {
			name:       "csistoragecapacities"
			namespaced: "true"
		}
		StorageClass: {
			name: "storageclasses"
			shortnames: [
				"sc",
			]
			namespaced: "false"
		}
		VolumeAttachment: {
			name:       "volumeattachments"
			namespaced: "false"
		}
	}
}
