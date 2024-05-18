sudo k3d cluster create  iot-aucaland --port 8888:8888
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

sudo kubectl wait --for=condition=Ready -n argocd --all pod
echo "Initial ArgoCD secret:"
sudo kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
echo

sudo kubectl port-forward -n argocd svc/argocd-server 8080:443

