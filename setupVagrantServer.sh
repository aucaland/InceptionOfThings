sudo apt update
sudo apt install -y curl
export DEBIAN_FRONTEND=noninteractive
curl -sfL https://get.k3s.io | sh -s - server --node-ip=192.168.56.110 --bind-address=0.0.0.0 --write-kubeconfig-mode 644
while [ ! -f /var/lib/rancher/k3s/server/node-token ]
do
  sleep 2
done
cp /var/lib/rancher/k3s/server/node-token /vagrant/token