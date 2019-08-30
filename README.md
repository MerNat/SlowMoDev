# My SlowMo :)

## Analysis

Script have been tested on my localhost and here are the points that i've noticed.

* Script is serving/opening only to localhost, meaning that i couldn't expose it to the outside world when trying to run it from the alpine image. But, it can work if there is a way i can have a compiled/binary script with serving a global ip address. (i.e. 0.0.0.0 instead of 127.0.0.1).
* Also, I have noticed that the script is more of like a stateful protocol meaning that it’s like a web-socket. And from my perspective, I think there are factors that we need to adapt to such an environment. Some of them are, making service with a resourceful virtual machine (i.e. Better RAM, CPU, etc.), making a replica of service in the cloud for scalability and or for high availability purpose. On top of that, it should be behind a proxy, thus I've added a proxy-based on an excellent Go Service, i.e Traefik. Regarding DDOS protection, it must be implemented before/with the proxy, for example, there is Fail2ban service or better to depend on an organization like Cloudflare.

### How to's

Note: Before dockerizing, script should be changed to host a global ip address.

Building the image.
`docker build -t mernat/slowmo .`

Running using docker run:
`docker run --rm -p 9090:9090 mernat/slowmo`

Running using docker-compose:

`docker-compose up`

Scalling:

`docker-compose up --scale slowmo=5`
