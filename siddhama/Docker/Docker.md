# Task- 1 - Create  a docker image for an application baat-cheet

- Resources Used : 
  - Documentation of docker for becoming familiar with Docker and its applications.
  - To learn about containers and its benefits, [this](https://www.docker.com/resources/what-container) on docker.com .
  - [This](https://buddy.works/guides/how-dockerize-node-application) nice tutorial on dockerizing node applicaton on buddy.works .
  - Brief [video](https://www.youtube.com/watch?v=u-YWtdbpEhQ) on docker by Telusko, Youtube channel.
- Things learnt :
  - I was completely unaware of dockers, so I was introduced to Docker.
  - Learnt differences between container and virtual machines, and what are advantages of docker over vitrtual machines; potential security threats posed by usage of dockers.
  - Besides these things other new concepts like daemon, rootless mode, docker volumes, isolation of dockers, port mapping, namespaces, Cgroups .
- How I did it?<br>
  First, I created an account on docker and and installed it on my OS as given in documentation. Then for creating baat-cheet image I followed the tutorial on [buddy.works](https://buddy.works/guides/how-dockerize-node-application) to dockerize the application. It worked on very first try and I was successful in running docker image on my pc without any problem.
- Link to image on docker : [https://hub.docker.com/repository/docker/siddhama/baat-cheet](https://hub.docker.com/repository/docker/siddhama/baat-cheet)
  

**Note :** Use flag *-p 3000:3000* alongwith docker run, otherwise it may not show-up on browser.
<br><br><br>

# Task - 3 - Mounting volumes 
- The terminal command used -
  ```
  sudo docker run -dit --nameApp -p 8080:80 -v /home/path_to_app/App/:/usr/local/apache2/htdocs/ httpd:2.4  
  ```
- I read about docker volumes on [https://docs.docker.com/storage/volumes/](https://docs.docker.com/storage/volumes/). So I got a brief idea about docker volumes. Docker volumes are used to persist any kind of data or logs generated in docker container. We do not prefer to store these things inside the container as it will result in increase the size of container. So here the docker volumes come into play. Using these we can store the data or logs outside the contianer and hence can be used after the life-cycle of container also.
<br><br><br>

# Task - 2 - Hosting an application on SNTC server.
### Resources used : 
  - Docs on Docker related to [resource constraint](https://docs.docker.com/config/containers/resource_constraints/)
  - Doc on rootless mode [https://docs.docker.com/engine/security/rootless/](https://docs.docker.com/engine/security/rootless/)
  
I personally felt this task was most complex of all, as host security while using dockers is quite complex itself. I will choose **Option-1** and will create new user for him as it is always better to isolate container from root as much as possible, especially in this case when I'm not sure about vulnerability of application to be hosted. I read the docs present on docker and various blogs regarding security, it is very complicated to keep balance between restrictions and priveleges. I'm writing couple of strategies which I'll ask that person to do in this case.
- Use of some flags during runtime :
  - Setting memory quota using *--memory* flag during docker run.
  - Restricting CPU usage using *--cpu* flags during docker run.
  - Constraint GPU using *--gpus* flag
  - Explicitly defining the user using *-u* flag to prevent container from running as root.
- There is new feature (experimetal for now) introduced to run docker daemon as rootless mode, which improves over the inability of earlier versions. It kind of fools the image by behaving like root but actually it is not. It mitigates most of security issues, but still has some limits. You can read more about it [here](https://docs.docker.com/engine/security/rootless/).  