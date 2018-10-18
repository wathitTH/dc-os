#!/bin/bash
docker run -dt \
--name=dc-os \
--hostname dc-os \
--privileged \
--network traceoncloud --ip=177.10.10.8 \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /root/dcos-storage/hosts:/etc/hosts \
-v /root/dcos-storage/forward.traceoncloud:/var/named/forward.traceoncloud \
-v /root/dcos-storage/reverse.traceoncloud:/var/named/reverse.traceoncloud \
-v /root/dcos-storage/resolv.conf:/etc/resolv.conf \
-v /root/dcos-storage/named.conf:/etc/named.conf \
-v /root/dcos-storage/kerberos:/root/var/kerberos \
-v /root/dcos-storage/krb5.conf:/etc/krb5.conf \
wathit/dc-os:v1
docker ps | grep dc-os
docker exec -it dc-os /bin/bash
