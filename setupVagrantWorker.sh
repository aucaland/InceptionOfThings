  export TOKEN=$(cat /vagrant/token)
  export INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token $TOKEN"
  if [ ! command -v curl &> /dev/null ]
  then
  	sudo apt update
  	sudo apt install -y curl
  fi
  curl -sfL https://get.k3s.io | sh -
