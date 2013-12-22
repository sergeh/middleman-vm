include_recipe "apt"
include_recipe "build-essential"
include_recipe "ruby"
include_recipe "git"
include_recipe "oh-my-zsh"
include_recipe "middleman"
include_recipe "project"

# Install packages
%w{ debconf vim screen tmux mc subversion curl make g++ libsqlite3-dev graphviz libxml2-utils lynx links}.each do |a_package|
  package a_package
end

# Install ruby gems
%w{ rdoc rake }.each do |a_gem|
  gem_package a_gem
end

# Generate selfsigned ssl
execute "make-ssl-cert" do
  command "make-ssl-cert generate-default-snakeoil --force-overwrite"
  ignore_failure true
  action :nothing
end
