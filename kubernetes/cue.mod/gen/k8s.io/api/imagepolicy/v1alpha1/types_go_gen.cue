// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go k8s.io/api/imagepolicy/v1alpha1

package v1alpha1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// ImageReview checks if the set of images in a pod are allowed.
#ImageReview: {
	metav1.#TypeMeta

	// Standard object's metadata.
	// More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
	// +optional
	metadata?: metav1.#ObjectMeta @go(ObjectMeta) @protobuf(1,bytes,opt)

	// Spec holds information about the pod being evaluated
	spec: #ImageReviewSpec @go(Spec) @protobuf(2,bytes,opt)

	// Status is filled in by the backend and indicates whether the pod should be allowed.
	// +optional
	status?: #ImageReviewStatus @go(Status) @protobuf(3,bytes,opt)
}

// ImageReviewSpec is a description of the pod creation request.
#ImageReviewSpec: {
	// Containers is a list of a subset of the information in each container of the Pod being created.
	// +optional
	// +listType=atomic
	containers?: [...#ImageReviewContainerSpec] @go(Containers,[]ImageReviewContainerSpec) @protobuf(1,bytes,rep)

	// Annotations is a list of key-value pairs extracted from the Pod's annotations.
	// It only includes keys which match the pattern `*.image-policy.k8s.io/*`.
	// It is up to each webhook backend to determine how to interpret these annotations, if at all.
	// +optional
	annotations?: {[string]: string} @go(Annotations,map[string]string) @protobuf(2,bytes,rep)

	// Namespace is the namespace the pod is being created in.
	// +optional
	namespace?: string @go(Namespace) @protobuf(3,bytes,opt)
}

// ImageReviewContainerSpec is a description of a container within the pod creation request.
#ImageReviewContainerSpec: {
	// This can be in the form image:tag or image@SHA:012345679abcdef.
	// +optional
	image?: string @go(Image) @protobuf(1,bytes,opt)
}

// ImageReviewStatus is the result of the review for the pod creation request.
#ImageReviewStatus: {
	// Allowed indicates that all images were allowed to be run.
	allowed: bool @go(Allowed) @protobuf(1,varint,opt)

	// Reason should be empty unless Allowed is false in which case it
	// may contain a short description of what is wrong.  Kubernetes
	// may truncate excessively long errors when displaying to the user.
	// +optional
	reason?: string @go(Reason) @protobuf(2,bytes,opt)

	// AuditAnnotations will be added to the attributes object of the
	// admission controller request using 'AddAnnotation'.  The keys should
	// be prefix-less (i.e., the admission controller will add an
	// appropriate prefix).
	// +optional
	auditAnnotations?: {[string]: string} @go(AuditAnnotations,map[string]string) @protobuf(3,bytes,rep)
}
