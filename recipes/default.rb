#
# Cookbook Name:: zip_zookeeper
# Recipe:: default
#
# Copyright (C) 2015 Justin Alan Ryan (ZipRealty / Realogy)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'zookeeper'

node_id = node["zip_zookeeper"]["myid"]

zk_data_home = node[:zookeeper][:config][:dataDir]
zk_install_dir = node[:zookeeper][:install_dir]
zk_version = node[:zookeeper][:version]
zk_cleanup_keep_count = node[:zip_zookeeper][:cleanup_keep_count]

file "#{zk_data_home}/myid" do
  content "#{node_id}"
end

include_recipe 'zookeeper::service'

cron 'zkCleanup.sh' do
  hour node[:zip_zookeeper][:cron_cleanup_hour]
  minute node[:zip_zookeeper][:cron_cleanup_minute]
  command "#{zk_install_dir}/zookeeper/zookeeper-#{zk_version}/bin/zkCleanup.sh #{zk_data_home} -n #{zk_cleanup_keep_count}"
end

