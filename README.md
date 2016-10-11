## Run docker using user namespace

Edit this file `/etc/subuid` and add the line below:

```sh
diego:1000:1
```

Edit `/etc/docker/daemon.json`:

```json
{
	"userns-remap": "diego"
}
```

### Check if docker is running using the namespace

```sh
$ sudo systemctl restart docker

$ docker-compose up

$ cat /proc/$(docker inspect -f '{{ .State.Pid }}' dockerphp_web_1)/uid_map
```