curl -sfL https://get.k3s.io | sh -s - server --node-ip=192.168.56.110 --bind-address=0.0.0.0 --write-kubeconfig-mode 644

sleep 10

kubectl apply -f /vagrant/app1.yaml