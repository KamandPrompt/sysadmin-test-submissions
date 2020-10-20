# Docker

## 1. Docker image for baat-cheet

I have used the following resources - 

* [Docker concepts](https://www.youtube.com/watch?v=YFl2mCHdv24)
* [Dockerize a Node.js app](https://www.youtube.com/watch?v=B7HNhe-dcFk)

I did the following - 
1. Install docker and clone into baat-cheet repo.
2. Create a `Dockerfile` with the same contents as given in the `Docker` file in this repo.
3. Navigate to the baat-cheet repo on your computer and run `docker build -t baatcheet-sysadmin .`.
4. Run the image to see if it works using `docker run -p 3000:3000 baatcheet-sysadmin`.
5. Run `docker images` and note the image id of baatcheet-sysadmin.
6. Go to Docker Hub and click on Create Repository and name it baatcheet-sysadmin.
7. Finally, push the image to Docker Hub using the commands - 
    * `docker tag <image_id> <your_username>/baatcheet-sysadmin:latest`
    * `docker push <your_username>/baatcheet-sysadmin`

## 2. Docker for your friend

Since the friend is indecisive and would waste my time, I would go with Option 1. These would be the steps I would follow to create a new user on the server and give him/her access to docker - 

1. Login to your server as root either - 
    * Physically using `sudo su -` 
    * Or remotely using `ssh <root_username>@<server_ip>`
2. Create a new user with  
`sudo useradd <friend_username>`  
and enter all the details.
3. Docker can't be used by non-root users unless they are given access by a root user. So, we have to follow this procedure - 
* `sudo groupadd docker` - Usually the docker group is created, so this step can be skipped if the group exists. If you don't know if the group exists or not, you can go ahead and run the command!
* `sudo gpasswd -a <friend_username> docker` - Add your friend's username to the docker group.
* Run `newgrp docker` or `reboot` for the changes to take into effect.

Now, your friend has a non-root user access to the server and access to docker. He/she can use the server to host the docker container. Since the friend requires the application only for an evaluation, you can remove their user access to the server once the evaluation is done to be safe! 

## 3. Docker Volumes

Suppose we're developing a web application. Each time we make a change and we want to see if the app works in the container, we have to rebuild the image and run it. Docker volumes solve the problem of having to rebuild the image each time. Instead, we can use the v flag while running the container as `-v <local_machine_file_location> <container_file_location>` to direct docker to look into our local machine in the `<local_machine_file_location>` directory instead of looking inside the container at the default `<container_file_location>`. Thus, changes are reflected if we refresh the browser without rebuilding the image! Its like we are configuring a hot reload like we have inbuilt in React/Flutter for docker!

For the question asked, we can run the command  
`docker run httpd -v <local_machine_file_location> /usr/local/apache2/htdocs/`  
to make sure docker serves the website files from the desired location. 

An important thing to note is that `<local_machine_file_location>` must be the absolute path and not a relative path.