# docker-nettools
Docker container with some net tools for debugging

```bash
kubectl run -it --image=ghcr.io/ermakov-oleg/docker-nettools nettools --restart=Never --namespace=default
```


Debug pod:

```
kubectl debug -it --image=ghcr.io/ermakov-oleg/docker-nettools --profile=sysadmin -c debugger <pod-name> -- bash
```

Debug node:

```bash
ubectl debug node/<node-name> -it --image=ghcr.io/ermakov-oleg/docker-nettools -- bash
```

Pod template example:

```
apiVersion: v1
kind: Pod
metadata:
  name: nettools
  namespace: default
spec:
  # hostNetwork: true # if you need test host network
  containers:
  - name: nettools
    image: ghcr.io/ermakov-oleg/docker-nettools
    command:
      - sleep
      - "36000"
    imagePullPolicy: IfNotPresent
  restartPolicy: Never
  ```
