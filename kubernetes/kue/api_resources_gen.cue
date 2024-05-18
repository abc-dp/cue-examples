package kue

cluster: gvk: {
	v1: {
		Binding: {
			name:       "bindings"
			namespaced: "true"
		}
		ComponentStatus: {
			name:       "componentstatuses"
			namespaced: "false"
		}
		ConfigMap: {
			name:       "configmaps"
			namespaced: "true"
		}
		Endpoints: {
			name:       "endpoints"
			namespaced: "true"
		}
		Event: {
			name:       "events"
			namespaced: "true"
		}
		LimitRange: {
			name:       "limitranges"
			namespaced: "true"
		}
		Namespace: {
			name:       "namespaces"
			namespaced: "false"
		}
		Node: {
			name:       "nodes"
			namespaced: "false"
		}
		PersistentVolumeClaim: {
			name:       "persistentvolumeclaims"
			namespaced: "true"
		}
		PersistentVolume: {
			name:       "persistentvolumes"
			namespaced: "false"
		}
		Pod: {
			name:       "pods"
			namespaced: "true"
		}
		PodTemplate: {
			name:       "podtemplates"
			namespaced: "true"
		}
		ReplicationController: {
			name:       "replicationcontrollers"
			namespaced: "true"
		}
		ResourceQuota: {
			name:       "resourcequotas"
			namespaced: "true"
		}
		Secret: {
			name:       "secrets"
			namespaced: "true"
		}
		ServiceAccount: {
			name:       "serviceaccounts"
			namespaced: "true"
		}
		Service: {
			name:       "services"
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
		name:       "customresourcedefinitions"
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
			name:       "daemonsets"
			namespaced: "true"
		}
		Deployment: {
			name:       "deployments"
			namespaced: "true"
		}
		ReplicaSet: {
			name:       "replicasets"
			namespaced: "true"
		}
		StatefulSet: {
			name:       "statefulsets"
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
		name:       "horizontalpodautoscalers"
		namespaced: "true"
	}
	"batch/v1": {
		CronJob: {
			name:       "cronjobs"
			namespaced: "true"
		}
		Job: {
			name:       "jobs"
			namespaced: "true"
		}
	}
	"certificates.k8s.io/v1": CertificateSigningRequest: {
		name:       "certificatesigningrequests"
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
		name:       "events"
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
			name:       "ingresses"
			namespaced: "true"
		}
		NetworkPolicy: {
			name:       "networkpolicies"
			namespaced: "true"
		}
	}
	"node.k8s.io/v1": RuntimeClass: {
		name:       "runtimeclasses"
		namespaced: "false"
	}
	"policy/v1": PodDisruptionBudget: {
		name:       "poddisruptionbudgets"
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
		name:       "priorityclasses"
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
			name:       "storageclasses"
			namespaced: "false"
		}
		VolumeAttachment: {
			name:       "volumeattachments"
			namespaced: "false"
		}
	}
}
