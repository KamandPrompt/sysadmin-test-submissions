
  

  

# Question 1

  

  

## How I solved the problem?

  

In this section, I will document the exact steps I took to create the image.

  

NOTE : I solved the problem by doing everything on a digitalocean droplet. So first I created a droplet, and then connected to it, using PuTTY

  

Then I followed these steps :

  

1. Installed and enabled docker on my droplet

  

2. Created an account into DockerHub and logged into the account through the DigitalOcean server.

  

3. Cloned the Baat-Cheet repository and cd baat-cheet

  

4. Created a Dockerfile, and add the necessary configurations to the file.

  

5. Create the image by building the Dockerfile

  

6. Pushed the image to DockerHub

This was not showing logs, because the nodejs app itself was not displaying any logs. So I added these lines in app.js file
`var morgan = require('morgan');`
`app.use(morgan(':method :url :status :res[content-length] - :response-time ms'))`
and installed morgan using npm, and then created the images and pushed to DockerHub with tag 2.0, which then started showing logs.

  

## Resources used

Leaning about Docker and how to use it - [Fireship](https://www.youtube.com/watch?v=gAkwW2tuIqE&t=506s)

  

## What I learnt

  

  

1. What docker is, how and works and how amazing it is.

  

2. How to create docker images and containers, and how to push and pull images to and from DockerHub

  

  

# Question 2
I will choose
**Option 1:** Create a new user on the server itself for your friend so they can set up a docker container themselves.  
 Do make sure they do not affect important things on the server, we do not give them superuser privileges.

  Command to create a new user in linux - `adduser username` and supply additional infromation. This would create the user without superuser priveleges. 

# Question 3

The command to set up docker volume while setting up the container is

`docker run -v /path/to/development:/usr/local/apache2/htdocs/`

  

About Docker Volumes - Docker volumes is a way of using data present in the host file system, inside containers so that the changes made inside the container are reflected to the host file system, and also, the data is not lost when the container is switched off.