sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl
curl -sfL https://get.k3s.io | sh -s - server --node-ip=192.168.56.110 --bind-address=0.0.0.0 --write-kubeconfig-mode 644

sleep 20

kubectl apply -f /vagrant/app1-service.yaml
kubectl apply -f /vagrant/app1-deployment.yaml
kubectl apply -f /vagrant/app2-service.yaml
kubectl apply -f /vagrant/app2-deployment.yaml
kubectl apply -f /vagrant/app3-service.yaml
kubectl apply -f /vagrant/app3-deployment.yaml
kubectl apply -f /vagrant/ingress.yaml