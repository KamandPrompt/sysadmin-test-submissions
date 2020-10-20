
Q1 : Run proof
This can be done using Docker compose. It's a better way to do if you have multiple containers and single host. Docker swarm is a way to maintain containers if you have multiple hosts.

Before making docker-compose please check you docker-eingine version. then select your syntax version.

```
Step 8/8 : ENTRYPOINT ["npm", "start"]
 ---> Running in 1639e5b38aa3
Removing intermediate container 1639e5b38aa3
 ---> 92a7a7bea1e8
Successfully built 92a7a7bea1e8
shubham@DarkMatter ~/M/P/d/baat-cheet (master)> docker run 92a7a7bea1e8

> baat-cheet@0.0.0 start /home/baat-cheet
> node app.js

Listening 3000

```

It is a better way to write a dockerfile for each container you use and write a compose file to manage it neatly. see [this](https://stackoverflow.com/questions/47903079/how-to-install-packages-from-docker-compose) post 

Resources : https://docs.docker.com/compose/gettingstarted/, https://stackoverflow.com/questions/47903079/how-to-install-packages-from-docker-compose

Q2 : 
```
sudo adduser my-dost
sudo usermod -aG docker my-dost
```

There is other way to start a container inside a container and you can build any thing you want
Container insise a container should be avoided. See [this](https://stackoverflow.com/questions/27879713/is-it-ok-to-run-docker-from-inside-docker) post.

Q3 :
I will add volume to the docker-compose

volumes:
    - /usr/local/apache2/htdocs/:./

