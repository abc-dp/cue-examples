# Cluster

```sh
kind create cluster
cue cmd api-resources
cue import --force --package cluster --path '"cluster"' --path '"apiResources"' .cluster/api-resources.json --outfile api_resources_gen.cue
```
