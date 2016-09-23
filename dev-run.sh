#!/bin/bash
set -e
mkdir -p tmp
replicas=3
i=0
function cleanup {
	set +e
	corectl kill --all
	set -e
}
discovery=$(curl https://discovery.etcd.io/new?size=$replicas)
cleanup
while [ $i -lt $replicas ]; do
	[ -e var_lib_swarm0${i}.img.qcow2 ] || qcow-tool create --size=10GiB var_lib_swarm0${i}.img.qcow2
	cp modules/swarm/templates/cloud-config.yaml tmp/user_data_0${i}
	sed -i '' "s|\${name}|swarm-0${i}|g" ./tmp/user_data_0${i}
	sed -i '' "s|\${discovery_token}|${discovery}|g" ./tmp/user_data_0${i}
	corectl run -c beta -L ./tmp/user_data_0${i} \
		--name swarm0${i} \
		--volume var_lib_swarm0${i}.img.qcow2
	i=$(($i+1))
	sleep 2
done
trap cleanup ERR
