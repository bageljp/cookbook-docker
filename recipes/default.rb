#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

package "wget"

bash "install docker" do
  user "root"
  group "root"
  code <<-EOC
    wget -qO- https://get.docker.io/ | sh
  EOC
  creates "/usr/bin/docker"
end

case node['platform']
when "amazon"
  package "docker-devel"
end

service "docker" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

bash "install nsenter and docker-enter" do
  user "root"
  group "root"
  code <<-EOC
    docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter
  EOC
  creates "/usr/local/bin/docker-enter"
end

