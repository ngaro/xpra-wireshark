# xpra-wireshark

This runs Wireshark in Xpra so you can attach to it from different systems.

Xpra allows you to use the speed of X-forwarding (a bit faster even) and the detach/attach possibilities of VNC.

## Tags

* [latest](https://github.com/ngaro/xpra-wireshark/blob/master/Dockerfile) uses Alpine as base
* [ubuntu](https://github.com/ngaro/xpra-wireshark/blob/ubuntu/Dockerfile) uses Ubuntu as base

## XPRA Usage

To run Wireshark on 'wireserver' listening for xpra-connections on tcp/12345 for clients that want to use it:

* Run the container:

`docker run -d -p 12345:10000 --name xprawire --cap-add NET_ADMIN garo/xpra-wireshark`

* Wait a couple of seconds for everything to start...

* You can now use xpra on a client to connect to it with: `xpra attach tcp:wireserver:12345`

* If you detach the xpra connection from the client wireshark will continue to run.

* Closing Wireshark will also stop the container. With `docker start xprawire` it will start again.

The environment variable `XPRA_PORT` is `10000` by default but can be changed to make xpra listen to another port.

## Regular (local) usage

You can also use this to run wireshark locally in a container:

```
docker run -d --net host -e DISPLAY=$DISPLAY --rm --cap-add NET_ADMIN \
-v $HOME/.Xauthority:/root/.Xauthority garo/xpra-wireshark wireshark
```

## Development
Want to improve this (bugfixes, extra features, ...) ?

Fork this repository on GitHub instead of cloning it,
I and other users might be interested in your changes !
