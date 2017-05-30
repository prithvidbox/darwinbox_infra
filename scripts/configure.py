#!/usr/bin/env python

# Configuration script to be executed on container start
# This script retrieves the environment variables prefixed with 'MNO_' and pass them to Ansible

import json
import os

# Extra variables to be passed to Ansible
extra_vars = {}

# Map the environment variables starting with MNO_VARIABLE_NAME=123 to a hash {'variable_name' : 123}
for key in os.environ.keys():
  if key.startswith('MNO_'):
    name = key.replace("MNO_", "").lower()
    value = os.environ[key]
    extra_vars[name] = value

# Call Ansible to configure the environment
command = "cd /etc/ansible && ansible-playbook -vvv -i hosts site.yml --tags 'configuration' --extra-vars='" + json.dumps(extra_vars) + "'"
os.system(command)
