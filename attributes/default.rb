node.default['java']['jdk_version'] = '8'
node.default["zookeeper"]["myid"] = '-1'
node.default["zookeeper"]["service_style"] = 'runit'
node.default["zookeeper"]["version"] = '3.4.6'
node.default["zookeeper"]["checksum"] = '01b3938547cd620dc4c93efe07c0360411f4a66962a70500b163b59014046994'
node.default["zookeeper"]["user_home"] = '/srv/zookeeper'
node.default["zookeeper"]["mirror"] = 'http://apache.mirrors.tds.net/zookeeper/'
default[:ao_zookeeper][:cleanup_keep_count] = 3
default[:ao_zookeeper][:cron_cleanup_hour] = 0
default[:ao_zookeeper][:cron_cleanup_minute] = 0

