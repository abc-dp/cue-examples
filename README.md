# CUE Examples

## sops

Decrypt secret values from sops encrypted file

```sh
cd sops
cue cmd sue
{
    "key": "value",
    "secretKey": "secret value"
}
```

Use module

```sh
git subrepo clone git@github.com:abc-dp/sue.git sops/cue.mod/pkg/github.com/abc-dp/sue
git subrepo pull sops/cue.mod/pkg/github.com/abc-dp/sue
git subrepo push sops/cue.mod/pkg/github.com/abc-dp/sue
```

## kubernetes

Create kubernetes manifests with schema validation

```sh
cd kubernetes
cue eval
```

Use module

```sh
git subrepo clone git@github.com:abc-dp/kue.git kubernetes/cue.mod/pkg/github.com/abc-dp/kue
git subrepo pull kubernetes/cue.mod/pkg/github.com/abc-dp/kue
git subrepo push kubernetes/cue.mod/pkg/github.com/abc-dp/kue
```
