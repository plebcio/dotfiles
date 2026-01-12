function remdirs

ssh root@ams-k8s-2006.ams.creativecdn.net ' rm -rf  /iw-test/etcd/*';
ssh root@ams-k8s-2007.ams.creativecdn.net ' rm -rf  /iw-test/etcd/*';
ssh root@ams-k8s-2008.ams.creativecdn.net ' rm -rf  /iw-test/etcd/*';
ssh root@ams-k8s-2009.ams.creativecdn.net ' rm -rf  /iw-test/etcd/*';
end
