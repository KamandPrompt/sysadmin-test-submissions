# Docker

## problem statement 1
Being a complete beginner in the field of docker or what most people call, NOOB, initially it was pretty tough for me to do problems related to docker but a co-community(telegram communtiy dedicted for pentesting related stuffs) member suugested me [Kode-Kloud](https://kodekloud.com/courses/296044/lectures/11353782) which helped me a lot with this topic. This particular topic took a relly huge portion of the total time dedicated to this whole task/competition.
Other sources used by me: [Official node-js website](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/), [edureka](https://www.edureka.co/blog/what-is-docker-container) and [official docker documentation](https://docs.docker.com/)
What I learnt?
A pretty straight forward answer to this question is that now I am confident with docker. Majority of basic topics are covvered by the sources mentioned above.
Image link : [dhhruv12/baat-cheet](https://hub.docker.com/repository/docker/dhhruv12/baat-cheet)

## problem statement 2
My choice: Option 1. 
I would create a new user for him and grant him mininum privileges using which he can run his project via docker.
#### Execution
For this situation, there are two solutions available or possible. First is to create a agroup and adding users to it. In this case, when docker daemon starts, it creates a unix socket which is accessible by members of the group. The problem with this solution is that the group ccreated have privileges equivalent to the root user which can be very lethal for our server as it exposes a huge attack surface and no one wants their system to be hacked. So this solution is not possible. You can read more about [sol. 1](https://docs.docker.com/engine/install/linux-postinstall/) and the [attack surface](https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface).
The second and more reliable solution for this situation is [running docker daemon as a non-root user (rootless mode)](https://docs.docker.com/engine/security/rootless/).
I request you to go through the mentioned [url](https://docs.docker.com/engine/security/rootless/) and follow the process mentioned based on linux distro you are using on your system/server.
Note: Rootless mode is an experimental feature but is much more safe then the 1st solution.
Instead of writing the whole procedure, I am asking you to go through the official document as even one small mistake can be very dangerous. The mentioned link has a  verywell explained procedure to use this feature.

## problem statement 3
Command : `docker run -v /var/www/my-website:/usr/local/apache2/htdocs httpd`
In the above command, var/www/my-website is the location of the directory that contains all the files related to the website. You can replace it with the location where all the website related files are saved on the host.
What i understood from docker volume is that docker container is just an instance of doocker image which means that all the data stored in a container is not permament and gets deleted once the container is exited. Docker volumes helpps us in this situation. It creates a volume simultaneously while the container is active so that even after the container is exited, it's data is not lost.
