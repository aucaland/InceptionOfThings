  sudo apt update
  sudo apt install -y curl
  curl -sfL https://get.k3s.io | sh -s - server
  while [ ! -f /var/lib/rancher/k3s/server/node-token ]
  do
	  sleep 2
  done
  cp /var/lib/rancher/k3s/server/node-token /vagrant/token

