#/bin/bash

# swap
swapsize=1024

grep -q "swapfile" /etc/fstab

if [ $? -ne 0 ]; then
  echo 'swapfile not found. Adding swapfile.'
  fallocate -l ${swapsize}M /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo '/swapfile none swap defaults 0 0' >> /etc/fstab
else
  echo 'swapfile found. No changes made.'
fi

# configure locale
sudo locale-gen pt_BR pt_BR.UTF-8
sudo echo America/Sao_Paulo > /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata
sudo dpkg-reconfigure -f noninteractive locales

# add repositories
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' >> /etc/apt/sources.list.d/docker.list"
sudo apt-get update

# install prerequisites
sudo apt-get install apparmor linux-image-extra-$(uname -r) -y

# install docker
sudo apt-get install docker-engine -y

# build container
cd /vagrant/jenkins
sudo docker build -t myjenkins .
sudo docker run -p 8080:8080 --name=jenkins-master -d myjenkins

# configure upstart service
sudo cp /vagrant/jenkins.conf /etc/init/