package cluster

kubernetes: apiResources: {
	v1: {
		Binding: {
			name:       "bindings"
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		ComponentStatus: {
			name: "componentstatuses"
			shortnames: [
				"cs",
			]
			namespaced: "false"
			package:    "k8s.io/api/core/v1"
		}
		ConfigMap: {
			name: "configmaps"
			shortnames: [
				"cm",
			]
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		Endpoints: {
			name: "endpoints"
			shortnames: [
				"ep",
			]
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		Event: {
			name: "events"
			shortnames: [
				"ev",
			]
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		LimitRange: {
			name: "limitranges"
			shortnames: [
				"limits",
			]
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		Namespace: {
			name: "namespaces"
			shortnames: [
				"ns",
			]
			namespaced: "false"
			package:    "k8s.io/api/core/v1"
		}
		Node: {
			name: "nodes"
			shortnames: [
				"no",
			]
			namespaced: "false"
			package:    "k8s.io/api/core/v1"
		}
		PersistentVolumeClaim: {
			name: "persistentvolumeclaims"
			shortnames: [
				"pvc",
			]
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		PersistentVolume: {
			name: "persistentvolumes"
			shortnames: [
				"pv",
			]
			namespaced: "false"
			package:    "k8s.io/api/core/v1"
		}
		Pod: {
			name: "pods"
			shortnames: [
				"po",
			]
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		PodTemplate: {
			name:       "podtemplates"
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		ReplicationController: {
			name: "replicationcontrollers"
			shortnames: [
				"rc",
			]
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		ResourceQuota: {
			name: "resourcequotas"
			shortnames: [
				"quota",
			]
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		Secret: {
			name:       "secrets"
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		ServiceAccount: {
			name: "serviceaccounts"
			shortnames: [
				"sa",
			]
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
		Service: {
			name: "services"
			shortnames: [
				"svc",
			]
			namespaced: "true"
			package:    "k8s.io/api/core/v1"
		}
	}
	"admissionregistration.k8s.io/v1": {
		MutatingWebhookConfiguration: {
			name:       "mutatingwebhookconfigurations"
			namespaced: "false"
			package:    "k8s.io/api/admissionregistration/v1"
		}
		ValidatingAdmissionPolicy: {
			name:       "validatingadmissionpolicies"
			namespaced: "false"
			package:    "k8s.io/api/admissionregistration/v1"
		}
		ValidatingAdmissionPolicyBinding: {
			name:       "validatingadmissionpolicybindings"
			namespaced: "false"
			package:    "k8s.io/api/admissionregistration/v1"
		}
		ValidatingWebhookConfiguration: {
			name:       "validatingwebhookconfigurations"
			namespaced: "false"
			package:    "k8s.io/api/admissionregistration/v1"
		}
	}
	"apps/v1": {
		ControllerRevision: {
			name:       "controllerrevisions"
			namespaced: "true"
			package:    "k8s.io/api/apps/v1"
		}
		DaemonSet: {
			name: "daemonsets"
			shortnames: [
				"ds",
			]
			namespaced: "true"
			package:    "k8s.io/api/apps/v1"
		}
		Deployment: {
			name: "deployments"
			shortnames: [
				"deploy",
			]
			namespaced: "true"
			package:    "k8s.io/api/apps/v1"
		}
		ReplicaSet: {
			name: "replicasets"
			shortnames: [
				"rs",
			]
			namespaced: "true"
			package:    "k8s.io/api/apps/v1"
		}
		StatefulSet: {
			name: "statefulsets"
			shortnames: [
				"sts",
			]
			namespaced: "true"
			package:    "k8s.io/api/apps/v1"
		}
	}
	"authentication.k8s.io/v1": {
		SelfSubjectReview: {
			name:       "selfsubjectreviews"
			namespaced: "false"
			package:    "k8s.io/api/authentication/v1"
		}
		TokenReview: {
			name:       "tokenreviews"
			namespaced: "false"
			package:    "k8s.io/api/authentication/v1"
		}
	}
	"authorization.k8s.io/v1": {
		LocalSubjectAccessReview: {
			name:       "localsubjectaccessreviews"
			namespaced: "true"
			package:    "k8s.io/api/authorization/v1"
		}
		SelfSubjectAccessReview: {
			name:       "selfsubjectaccessreviews"
			namespaced: "false"
			package:    "k8s.io/api/authorization/v1"
		}
		SelfSubjectRulesReview: {
			name:       "selfsubjectrulesreviews"
			namespaced: "false"
			package:    "k8s.io/api/authorization/v1"
		}
		SubjectAccessReview: {
			name:       "subjectaccessreviews"
			namespaced: "false"
			package:    "k8s.io/api/authorization/v1"
		}
	}
	"autoscaling/v2": HorizontalPodAutoscaler: {
		name: "horizontalpodautoscalers"
		shortnames: [
			"hpa",
		]
		namespaced: "true"
		package:    "k8s.io/api/autoscaling/v2"
	}
	"batch/v1": {
		CronJob: {
			name: "cronjobs"
			shortnames: [
				"cj",
			]
			namespaced: "true"
			package:    "k8s.io/api/batch/v1"
		}
		Job: {
			name:       "jobs"
			namespaced: "true"
			package:    "k8s.io/api/batch/v1"
		}
	}
	"certificates.k8s.io/v1": CertificateSigningRequest: {
		name: "certificatesigningrequests"
		shortnames: [
			"csr",
		]
		namespaced: "false"
		package:    "k8s.io/api/certificates/v1"
	}
	"coordination.k8s.io/v1": Lease: {
		name:       "leases"
		namespaced: "true"
		package:    "k8s.io/api/coordination/v1"
	}
	"discovery.k8s.io/v1": EndpointSlice: {
		name:       "endpointslices"
		namespaced: "true"
		package:    "k8s.io/api/discovery/v1"
	}
	"events.k8s.io/v1": Event: {
		name: "events"
		shortnames: [
			"ev",
		]
		namespaced: "true"
		package:    "k8s.io/api/events/v1"
	}
	"flowcontrol.apiserver.k8s.io/v1": {
		FlowSchema: {
			name:       "flowschemas"
			namespaced: "false"
			package:    "k8s.io/api/flowcontrol/v1"
		}
		PriorityLevelConfiguration: {
			name:       "prioritylevelconfigurations"
			namespaced: "false"
			package:    "k8s.io/api/flowcontrol/v1"
		}
	}
	"networking.k8s.io/v1": {
		IngressClass: {
			name:       "ingressclasses"
			namespaced: "false"
			package:    "k8s.io/api/networking/v1"
		}
		Ingress: {
			name: "ingresses"
			shortnames: [
				"ing",
			]
			namespaced: "true"
			package:    "k8s.io/api/networking/v1"
		}
		NetworkPolicy: {
			name: "networkpolicies"
			shortnames: [
				"netpol",
			]
			namespaced: "true"
			package:    "k8s.io/api/networking/v1"
		}
	}
	"node.k8s.io/v1": RuntimeClass: {
		name:       "runtimeclasses"
		namespaced: "false"
		package:    "k8s.io/api/node/v1"
	}
	"policy/v1": PodDisruptionBudget: {
		name: "poddisruptionbudgets"
		shortnames: [
			"pdb",
		]
		namespaced: "true"
		package:    "k8s.io/api/policy/v1"
	}
	"rbac.authorization.k8s.io/v1": {
		ClusterRoleBinding: {
			name:       "clusterrolebindings"
			namespaced: "false"
			package:    "k8s.io/api/rbac/v1"
		}
		ClusterRole: {
			name:       "clusterroles"
			namespaced: "false"
			package:    "k8s.io/api/rbac/v1"
		}
		RoleBinding: {
			name:       "rolebindings"
			namespaced: "true"
			package:    "k8s.io/api/rbac/v1"
		}
		Role: {
			name:       "roles"
			namespaced: "true"
			package:    "k8s.io/api/rbac/v1"
		}
	}
	"scheduling.k8s.io/v1": PriorityClass: {
		name: "priorityclasses"
		shortnames: [
			"pc",
		]
		namespaced: "false"
		package:    "k8s.io/api/scheduling/v1"
	}
	"storage.k8s.io/v1": {
		CSIDriver: {
			name:       "csidrivers"
			namespaced: "false"
			package:    "k8s.io/api/storage/v1"
		}
		CSINode: {
			name:       "csinodes"
			namespaced: "false"
			package:    "k8s.io/api/storage/v1"
		}
		CSIStorageCapacity: {
			name:       "csistoragecapacities"
			namespaced: "true"
			package:    "k8s.io/api/storage/v1"
		}
		StorageClass: {
			name: "storageclasses"
			shortnames: [
				"sc",
			]
			namespaced: "false"
			package:    "k8s.io/api/storage/v1"
		}
		VolumeAttachment: {
			name:       "volumeattachments"
			namespaced: "false"
			package:    "k8s.io/api/storage/v1"
		}
	}
}
