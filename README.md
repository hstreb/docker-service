# docker-service example

This project shows how to configure a docker container as a service, using a jenkins image.

Vagrant helps to automatize the things, it's not necessary. The steps to configure the docker container and setup a upstart service are in [setup.sh](setup.sh).

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