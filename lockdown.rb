require 'linux_admin'
require 'yaml'

scap_config = YAML.load_file('/var/www/miq/vmdb/productization/appliance_console/config/scap_rules.yml')
# Change to RHEL8 for CF 5.x
LinuxAdmin::Scap.new("rhel7").lockdown(*scap_config['rules'], scap_config['values'])
