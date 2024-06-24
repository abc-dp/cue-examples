package cluster

import (
	corev1 "k8s.io/api/core/v1"
	admissionregistrationv1 "k8s.io/api/admissionregistration/v1"
	appsv1 "k8s.io/api/apps/v1"
	authenticationv1 "k8s.io/api/authentication/v1"
	authorizationv1 "k8s.io/api/authorization/v1"
	autoscalingv2 "k8s.io/api/autoscaling/v2"
	batchv1 "k8s.io/api/batch/v1"
	certificatesv1 "k8s.io/api/certificates/v1"
	coordinationv1 "k8s.io/api/coordination/v1"
	discoveryv1 "k8s.io/api/discovery/v1"
	eventsv1 "k8s.io/api/events/v1"
	flowcontrolv1 "k8s.io/api/flowcontrol/v1"
	networkingv1 "k8s.io/api/networking/v1"
	nodev1 "k8s.io/api/node/v1"
	policyv1 "k8s.io/api/policy/v1"
	rbacauthorizationv1 "k8s.io/api/rbac/v1"
	schedulingv1 "k8s.io/api/scheduling/v1"
	storagev1 "k8s.io/api/storage/v1"

	"github.com/abc-dp/kue"
)

#kue: kue.#KUE & {
	#apiResources: kubernetes.apiResources
	#resources: {
		bindings?: [_]:                          corev1.#Binding
		componentstatuses?: [_]:                 corev1.#ComponentStatus
		configmaps?: [_]:                        corev1.#ConfigMap
		endpoints?: [_]:                         corev1.#Endpoints
		events?: [_]:                            corev1.#Event
		limitranges?: [_]:                       corev1.#LimitRange
		namespaces?: [_]:                        corev1.#Namespace
		nodes?: [_]:                             corev1.#Node
		persistentvolumeclaims?: [_]:            corev1.#PersistentVolumeClaim
		persistentvolumes?: [_]:                 corev1.#PersistentVolume
		pods?: [_]:                              corev1.#Pod
		podtemplates?: [_]:                      corev1.#PodTemplate
		replicationcontrollers?: [_]:            corev1.#ReplicationController
		resourcequotas?: [_]:                    corev1.#ResourceQuota
		secrets?: [_]:                           corev1.#Secret
		serviceaccounts?: [_]:                   corev1.#ServiceAccount
		services?: [_]:                          corev1.#Service
		mutatingwebhookconfigurations?: [_]:     admissionregistrationv1.#MutatingWebhookConfiguration
		validatingadmissionpolicies?: [_]:       admissionregistrationv1.#ValidatingAdmissionPolicy
		validatingadmissionpolicybindings?: [_]: admissionregistrationv1.#ValidatingAdmissionPolicyBinding
		validatingwebhookconfigurations?: [_]:   admissionregistrationv1.#ValidatingWebhookConfiguration
		controllerrevisions?: [_]:               appsv1.#ControllerRevision
		daemonsets?: [_]:                        appsv1.#DaemonSet
		deployments?: [_]:                       appsv1.#Deployment
		replicasets?: [_]:                       appsv1.#ReplicaSet
		statefulsets?: [_]:                      appsv1.#StatefulSet
		selfsubjectreviews?: [_]:                authenticationv1.#SelfSubjectReview
		tokenreviews?: [_]:                      authenticationv1.#TokenReview
		localsubjectaccessreviews?: [_]:         authorizationv1.#LocalSubjectAccessReview
		selfsubjectaccessreviews?: [_]:          authorizationv1.#SelfSubjectAccessReview
		selfsubjectrulesreviews?: [_]:           authorizationv1.#SelfSubjectRulesReview
		subjectaccessreviews?: [_]:              authorizationv1.#SubjectAccessReview
		horizontalpodautoscalers?: [_]:          autoscalingv2.#HorizontalPodAutoscaler
		cronjobs?: [_]:                          batchv1.#CronJob
		jobs?: [_]:                              batchv1.#Job
		certificatesigningrequests?: [_]:        certificatesv1.#CertificateSigningRequest
		leases?: [_]:                            coordinationv1.#Lease
		endpointslices?: [_]:                    discoveryv1.#EndpointSlice
		events?: [_]:                            eventsv1.#Event
		flowschemas?: [_]:                       flowcontrolv1.#FlowSchema
		prioritylevelconfigurations?: [_]:       flowcontrolv1.#PriorityLevelConfiguration
		ingressclasses?: [_]:                    networkingv1.#IngressClass
		ingresses?: [_]:                         networkingv1.#Ingress
		networkpolicies?: [_]:                   networkingv1.#NetworkPolicy
		runtimeclasses?: [_]:                    nodev1.#RuntimeClass
		poddisruptionbudgets?: [_]:              policyv1.#PodDisruptionBudget
		clusterrolebindings?: [_]:               rbacauthorizationv1.#ClusterRoleBinding
		clusterroles?: [_]:                      rbacauthorizationv1.#ClusterRole
		rolebindings?: [_]:                      rbacauthorizationv1.#RoleBinding
		roles?: [_]:                             rbacauthorizationv1.#Role
		priorityclasses?: [_]:                   schedulingv1.#PriorityClass
		csidrivers?: [_]:                        storagev1.#CSIDriver
		csinodes?: [_]:                          storagev1.#CSINode
		csistoragecapacities?: [_]:              storagev1.#CSIStorageCapacity
		storageclasses?: [_]:                    storagev1.#StorageClass
		volumeattachments?: [_]:                 storagev1.#VolumeAttachment
	}
}
