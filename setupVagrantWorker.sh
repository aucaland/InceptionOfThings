export TOKEN=$(cat /vagrant/token)
export INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token $TOKEN --node-ip=192.168.56.111"
if ! command curl &> /dev/null ;then
  echo "Updating packages.."
  sudo apt-get update
  sudo apt upgrade
  echo "Installing Curl.."
  sudo apt-get install -y curl
  echo "Curl installed on worker"
fi
  echo "Installing Worker Node.."
  sudo curl -sfL https://get.k3s.io | sh -s -
  echo "Worker node installed"