# Dockerfile for postfix on apline

## Build image

modify etc/main.cf on demand for customize default configurations

## Use image

```bash
docker run                                     \
       --name mail-server                      \
       --hostname mail-server.demo.org         \
       --volume ./main.cf:/etc/postfix/main.cf \
       --restart always                        \
       --detach                                \
       jack6liu/postfix:latest
```

**NOTE** modify main.cf and mount as volume