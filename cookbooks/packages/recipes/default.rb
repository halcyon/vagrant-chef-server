#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{libgecode-dev}.each do |pkg|
  package pkg do
    action :install
  end
end
