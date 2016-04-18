# docker-service example

This project shows how to install docker in a ubuntu 14.04 and configure a container as a service to start on boot, I'm using a jenkins image to demonstrate it.

The Vagrant helps to automatize the things, but, it's not necessary any way. 

The steps to configure the docker container are in [setup.sh](setup.sh) and to setup a upstart service copy [jenkins.conf](jenkins.conf) to /etc/init/.

Take care about the container identification, use the same as you used when created the instance with the param --name=.

Ex. docker run -p 8080:8080 --name=**jenkins-master** -d myjenkins

### setup
```sh
vagrant up
```

### access jenkins on web
http://10.10.10.17:8080

### restart vm
```sh
vagrant halt
vagrant up
```
