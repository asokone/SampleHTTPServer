
# Deploying hhpd server using Dockerfile

Deploying Python SimpleHTTPServer (HTTPD server) on a Docker container using Dockerfile

## Authors

- [asokone@thecloudedu.com](https://www.github.com/asokone)


## What is in this image?

Python Httpd is a lightweight HyperText Transfer Protocol (HTTP) server program. It is designed to be run as a standalone daemon process. I am using it the create my first Webpage.

## Dockerfile

::::::::::::::::::::::
Dockerfile
::::::::::::::::::::::

FROM python:2.7-alpine

RUN mkdir /app
WORKDIR /app
# To say $PWD

COPY index.html index.html
COPY AndialySokone.jpg AndialySokone.jpg
COPY application.py application.py

CMD curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
CMD yum install -y python
CMD yum update -y python

CMD yum install -y pip

COPY . .
LABEL maintainer="Andialy Sokone<asokone@thecloudedu.com>" \
version="1.0"

## Build

$ cd /home/asokone/docker/myweb

$ ls

AndialySokone.jpg  application.py  counter.pl  counter.txt  Dockerfile  Dockerfile.Alpine  Dockerfile.oraclelunix8.2  index.html

$ docker image build -t myweb .


[+] Building 27.0s (13/13) FINISHED
 => [internal] load build definition from Dockerfile                                                                      
 => => transferring dockerfile: 578B                                                                                      
 => [internal] load .dockerignore                                                                                         
 => => transferring context: 2B                                                                                           
 => [internal] load metadata for docker.io/library/python:2.7-alpine                                                      
 => [auth] library/python:pull token for registry-1.docker.io                                                             
 => [internal] load build context                                                                                         
 => => transferring context: 207.76kB                                                                                     
 => [1/7] FROM docker.io/library/python:2.7-alpine@sha256:724d0540eb56ffaa6dd770aa13c3bc7dfc829dec561d87cb36b2f5b9ff8a760a
 => CACHED [2/7] RUN mkdir /app                                                                                           
 => CACHED [3/7] WORKDIR /app                                                                                             
 => [4/7] COPY index.html index.html                                                                                      
 => [5/7] COPY AndialySokone.jpg AndialySokone.jpg                                                                        
 => [6/7] COPY application.py application.py                                                                              
 => [7/7] COPY . .                                                                                                        
 => exporting to image                                                                                                    
 => => exporting layers                                                                                                   
 => => writing image sha256:68b37e3ce0a470a742c54c6116497e0ee7b83b9d7976cbe90af7e906ce5ab481                              
 => => naming to docker.io/library/myweb                                                                                  
## Deployment

$ docker images | egrep "REPOSITORY|myweb"

REPOSITORY              TAG         IMAGE ID        CREATED             SIZE

myweb                   latest      68b37e3ce0a4    43 seconds ago      71.3MB

Let us check if the port 8080 is in use in this localhost

$ curl localhost:8080/

curl: (7) Failed to connect to localhost port 8080: Connection refused


The port 8080 is not in use let us proceed and create our container name myfristweb using the image we just create myweb
 
$ docker run --name myfirstweb -dit -p 8080:5000 myweb

fbfa6491c341a2b08f212249ea3d65ca21cdc4b69635ca52ab9a8e84268736e7

$ docker container ps -a | grep myweb

fbfa6491c341   myweb                    "/bin/sh -c 'python …"   3 minutes ago   Up 2 minutes              0.0.0.0:8080->5000/tcp, :::8080->5000/tcp   myfirstweb


## Docker Hub Login

We supposed that you have created already an account at https://hub.docker.com/

$ docker login

Authenticating with existing credentials...

WARNING! Your password will be stored unencrypted in /root/.docker/config.json.

Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

## Accessing the deployment

$ curl http://localhost:8080/

<html>

        <head>

                <title>This is Andialy's First Webpage</title>

        </head>

        <body>

                <center>

<hr>

               <img src="/AndialySokone.jpg" width="200" height="256">

                        <pre>
                

                        <tt>

<hr>

Hello!

I am <b> Andialy Sokone </b>

This is my first Web Site built on docker container using perl as CGI counter
See how easy docker is !!

<hr>
                        </tt>

                        </pre>

                </center>

        </body>

</html>


## Cleaning up

$ docker container stop  myfirstweb

myfirstweb

$ docker container rm  myfirstweb

myfirstweb

## Verifying if things are cleaned

$ docker container ps -a | grep myfirstweb
