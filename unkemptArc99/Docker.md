# Docker Guide

Docker is a very interesting sofware which allows developers to *develop, deploy and run applications with containers* (verbatim from Docker's documentation.) The software bought about a change in application packaging industry with it's container technology. It would be no harm to devote some time on this very technology which makes Docker quite unique.

## Container Technology
I will use the container definition as stated on the Docker website :
> A container runs natively on Linux and shares the kernel of the host machine with other containers. It runs a discrete process, taking no more memory than any other executable, making it lightweight.

In simple words, it is a type of mini-space which you have made for a particular task. You can perform this task in this space without disturbing anything else. Also, this space is self sustained for the task, that it only houses a set specific of prerequisites, which are only required for the task. For eg, container has its own : processes, memory, devices and network stack, but such is the size of these components, that these components are just enough for the task assigned to the containers and not more than that.

Often, containers are confused with VMs. Though, they sound same (a different space than the running OS, having seperate memory than the running OS, etc.), there is a vast difference between them. I can explain this by a very popular analogy between them. Imagine a VM to be a house (bungalow) and a container to be an apartment. Houses (VMs) are self-contained and offer protection from unwanted guests, while, apartments (containers) also provide protection from unwanted guests, but they are built around a shared infrastructure. In houses, it is a minimum requirement to have a kitchen, a bathroom, a bedroom, etc. Apartments, on the other hand, are offered in all kinds of different sizes - PGs to a normal multi-bedroom penthouse. You're only renting what you want.

I suppose, that should clear the difference between a container and a VM. If you want to know more about Docker and containers, visit
* https://blog.docker.com/2016/05/docker-101-getting-to-know-docker/
* https://blog.docker.com/2016/03/containers-are-not-vms/
and many other websites like above.

## Problem solution
I had actually completed the Docker [Getting Started](https://docs.docker.com/get-started/) Tutorial prior to this assignment. So I had to look nowhere else than the [Docker Documentation](https://docs.docker.com) for any doubts.

I will guide you towards the whole process step-by-step :
1. Make a new directory for your docker app.
```s
$ mkdir Docker
$ cd Docker
```
2. Define a new container with `Dockerfile`. The list of commands that can be used are given [here](https://docs.docker.com/engine/reference/builder/#environment-replacement). Write the below commands in your `Dockerfile`.
```dockerfile
FROM ubuntu:16.04

WORKDIR	/home

ADD . /home

RUN apt-get update | apt-get upgrade

EXPOSE 80

ENV NAME World

CMD ["sh", "testfile.sh"]
```
3. Create the `testfile.sh` that is required for the problem.
4. Build the docker container into an image.
```s
$ docker build -t <any name here. Let's say this name to be imagename>
```
5. Login with your docker cloud credentials. We will then upload this image on the docker cloud so that anyone can run this image.
```s
$ docker login
```
6. Tag the image for uploading the image with a registry `username/repository:tag`. This helps for meaningful naming convention.
```s
$ docker tag imagename username/repository:tag
```
7. Push the tagged image on your cloud
```s
$ docker push username/repository:tag
```
8. Now you can run this image anywhere (Docker must be installed, though) by the following command -
```s
$ docker run username/repository:tag
```

So, there you go a very small solution for a simple assignment.