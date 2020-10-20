Q1.
>How you did this?
- `git clone https://github.com/KamandPrompt/baat-cheet.git`
- `cd baat-cheet.git`
- `vim Dockerfile` created Dockerfile with the help of resources mentioned below
- `echo node_modules > .dockerignore`
- `docker build -t rs300/baat-cheet .`
- `docker run --publish 3000:3000 rs300/baat-cheet`
- visit `localhost:3000` and see the website running.
- `docker login` to login
- `docker push rs300/baat-cheet`

>What all resources you took help from?
- 20 minutes intro video on youtube
- [docker arch-wiki](https://wiki.archlinux.org/index.php/docker) for installation
- docker official documentation for building, running and pushing the container

>What you learnt?
- Docker provides the one command setup for development and production purposes
- Docker is lighter than the virtual machine because it reuses the kernel
- Use `Dockerfile` to provide single service and `docker-compose.yml` for managing more than one services.

>link to your image on `docker store`/`docker hub`

[rs300/baat-cheet](https://hub.docker.com/repository/docker/rs300/baat-cheet)

Q2.
I will create new user `friend` and add it to group `docker`. User `friend` will not be permitted to use `sudo` because `docker` command is all that is needed to configure a docker-container.

Q3.
`docker run -dit --name my-apache-app -p 8080:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd:2.4`
Docker volumes can be shared among multiple running container and can also be saved for later use. If you want to share the a state of container other than its intial state, It can be done using docker volumes. And one more, Volumes are great for developing softwares as you can see the changes live.
