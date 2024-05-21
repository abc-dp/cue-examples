## KUE

(Kubernetes in CUE)

```sh
kind create cluster
cue cmd kue-api-resoures
cue import --force --package kue --path '"cluster"' --path '"apiResources"' .kue/api-resources.json --outfile api_resources_gen.cue
```
