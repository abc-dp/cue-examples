# CUE Examples

## sops

Decrypt secret values from sops encrypted file

```sh
cd sops
cue cmd sops
{
    "secretKey": "secret value"
}
```

## kubernetes

Create kubernetes manifests with schema validation

```sh
cd kubernetes
cue eval
```
