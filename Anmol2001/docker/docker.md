Q1
Starting from question 1,docker was a new term for me so i started by watching a tutorial on youtube(https://www.youtube.com/watch?v=fqMOX6JJhGo) by Freecodecamp to grasp some basics of docker.

While doing this i solved some basic exercises given in the tutorial and installed docker. Docker is an open source project that makes it easy to create container based apps.

Containers deploy all dependencies and libraries needed to run an app as one package.Multiple containers can run on the same machine and share the OS kernel(which makes it better than virtual machines which offer complete isolation) with other containers.Docker has optimization products such as Docker Swarn and Kubernetes for load balance and management of containers on large scale.

It all starts with a Dockerfile which is a text file that consists of instructions to build a docker image.Dockerfile conatins the requirements,dependencies,os ,locations and defines the working of a conatiner.On building a dockerfile ,a static and portable file called docker image is created which contains details of software components and the overall working.It has a layered structure which means when we modify the layers with same data will not be uploaded again.
The task was to host baat-cheet app on docker. So firstly i created a docker account. Then i tried to run the app locally on my pc with npm install (without docker) to ensure that i have all the files needed to run the app on my pc.
The next step was to create a dockerfile with set of instructions.I made the dockerfile in the dircetory having app data.It will be better if u open my code in anothe tab.

As it is a node.js app so i updated myself with a couple of blogs regarding the same(https://nodejs.org/en/docs/guides/nodejs-docker-webapp/) (https://buddy.works/guides/how-dockerize-node-application)
So i started my dockerfile by importing node:12 image to use it as a source for building this image.The second line creates a directory named 'doc' for the app.Then in third line requirements i.e package.json and package-lock.json file are copied to the 'doc' directory.Then it runs npm install.The next line copies the source code of app present in current directory to doc.

Next i have written EXPOSE 3000 to bind the app to this port as told in question.
Atlast comes the CMD command which takes only one command to execute.But if we have to execute multiple commands.So i listed all my commands in a separate file named start.sh which includes the command to start the app i.e "node app.js".

So the Dockerfile is completed.Now its time to build this dockerfile.I used the command 'docker build -t' along with image name followed by runnung of image on the host itself on same port.Finally it ran successfully on my pc.
Here comes the task of making it public on docker using 'build' again along with docker id and imagename followed by a login and pushing the image into my hub.The link of my image is (https://hub.docker.com/r/prit2001/firstimage)
Now anybody can run it using docker run command follwed by image name.
we can also view logs of container by using "docker logs [container.id]" command once we get the conatiner id from docker ps command by checking from image name of different containers.

Q2:
I will choose the second option as in first the user can do misuse of the user access given to it.
So 2. I will let him Create a modified image and guide him as follows:

He will run an existing image as a container, make the required modifications in it and then create a new image from the modified container.

a. He will create a Docker container from a parent image that is available in repository.
b. Then connect to the container via bash shell

docker exec -it container-name bash

c. From the shell, make the changes in the container as required. This can include installing new packages, modifying configuration files, downloading or removing files, compiling modules, and so on.
d. Once the changes are done, exit the container. Then commit the container as a new image. This will save the modified container state as a new image.

docker commit container-ID image-name

The commit operation will not include any data contained in volumes mounted inside the container.
e. This modified image is then uploaded to a repository, which is then used for creating more such containers for future use.
For more details check this link
(https://bobcares.com/blog/edit-docker-image/)
(https://codeburst.io/direct-connection-to-a-docker-container-with-ssh-56e1d2744ee5/)

Q3:
For this question i have used the bind mount(Command: --mount , with source=<path of website files>,target=/usr/local/apache2/htdocs/) method of docker which mounts the apache directory on the container directory so that it will have an access to the conatiner directory as a full reference.
(docs.docker.com/storage/bind-mounts/)When we use a volume a new directory is created within docker's storage directory on the host machine, and docker manages that directory's contents. If we use -v to bind a directory or file that doesn't exist on host,-v creates it as a directory. on the other hand --mount generates an error in the same case. 






