# docker-nettools
Docker container with some net tools for debugging

```bash
kubectl run -it --image=ghcr.io/ermakov-oleg/docker-nettools nettools --restart=Never --namespace=default
```


Pod template example:

```
apiVersion: v1
kind: Pod
metadata:
  name: nettools
  namespace: default
spec:
  hostNetwork: true
  containers:
  - name: nettools
    image: ghcr.io/ermakov-oleg/docker-nettools
    command:
      - sleep
      - "36000"
    imagePullPolicy: IfNotPresent
  restartPolicy: Never
  ```
