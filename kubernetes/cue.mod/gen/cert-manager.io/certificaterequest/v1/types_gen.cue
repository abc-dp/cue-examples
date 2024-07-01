// Code generated by timoni. DO NOT EDIT.

//timoni:generate timoni vendor crd -f cluster/kind/.kue/crds.yaml

package v1

import "strings"

// A CertificateRequest is used to request a signed certificate
// from one of the configured issuers.
// All fields within the CertificateRequest's `spec` are immutable
// after creation. A CertificateRequest will either succeed or
// fail, as denoted by its `status.state` field.
// A CertificateRequest is a one-shot resource, meaning it
// represents a single point in time request for a certificate
// and cannot be re-used.
#CertificateRequest: {
	// APIVersion defines the versioned schema of this representation
	// of an object. Servers should convert recognized schemas to the
	// latest internal value, and may reject unrecognized values.
	// More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
	apiVersion: "cert-manager.io/v1"

	// Kind is a string value representing the REST resource this
	// object represents. Servers may infer this from the endpoint
	// the client submits requests to. Cannot be updated. In
	// CamelCase. More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
	kind: "CertificateRequest"
	metadata!: {
		name!: strings.MaxRunes(253) & strings.MinRunes(1) & {
			string
		}
		namespace!: strings.MaxRunes(63) & strings.MinRunes(1) & {
			string
		}
		labels?: {
			[string]: string
		}
		annotations?: {
			[string]: string
		}
	}

	// Desired state of the CertificateRequest resource.
	spec!: #CertificateRequestSpec
}

// Desired state of the CertificateRequest resource.
#CertificateRequestSpec: {
	// The requested 'duration' (i.e. lifetime) of the Certificate.
	// This option may be ignored/overridden by some issuer types.
	duration?: string

	// Extra contains extra attributes of the user that created the
	// CertificateRequest. Populated by the cert-manager webhook on
	// creation and immutable.
	extra?: {
		[string]: [...string]
	}

	// Groups contains group membership of the user that created the
	// CertificateRequest. Populated by the cert-manager webhook on
	// creation and immutable.
	groups?: [...string]

	// IsCA will request to mark the certificate as valid for
	// certificate signing when submitting to the issuer. This will
	// automatically add the `cert sign` usage to the list of
	// `usages`.
	isCA?: bool

	// IssuerRef is a reference to the issuer for this
	// CertificateRequest. If the `kind` field is not set, or set to
	// `Issuer`, an Issuer resource with the given name in the same
	// namespace as the CertificateRequest will be used. If the
	// `kind` field is set to `ClusterIssuer`, a ClusterIssuer with
	// the provided name will be used. The `name` field in this
	// stanza is required at all times. The group field refers to the
	// API group of the issuer which defaults to `cert-manager.io` if
	// empty.
	issuerRef: {
		// Group of the resource being referred to.
		group?: string

		// Kind of the resource being referred to.
		kind?: string

		// Name of the resource being referred to.
		name: string
	}

	// The PEM-encoded x509 certificate signing request to be
	// submitted to the CA for signing.
	request: string

	// UID contains the uid of the user that created the
	// CertificateRequest. Populated by the cert-manager webhook on
	// creation and immutable.
	uid?: string

	// Usages is the set of x509 usages that are requested for the
	// certificate. If usages are set they SHOULD be encoded inside
	// the CSR spec Defaults to `digital signature` and `key
	// encipherment` if not specified.
	usages?: [..."signing" | "digital signature" | "content commitment" | "key encipherment" | "key agreement" | "data encipherment" | "cert sign" | "crl sign" | "encipher only" | "decipher only" | "any" | "server auth" | "client auth" | "code signing" | "email protection" | "s/mime" | "ipsec end system" | "ipsec tunnel" | "ipsec user" | "timestamping" | "ocsp signing" | "microsoft sgc" | "netscape sgc"]

	// Username contains the name of the user that created the
	// CertificateRequest. Populated by the cert-manager webhook on
	// creation and immutable.
	username?: string
}