#!/usr/bin/python

from sys import argv
import paramiko
from scp import SCPClient

import warnings
warnings.filterwarnings(action='ignore',module='.*paramiko.*')


user = argv[1]
passwd = argv[2]
host = argv [3]
site = argv[4] + '.cfg'

ssh = paramiko.client.SSHClient()
ssh.set_missing_host_key_policy(paramiko.client.AutoAddPolicy())
ssh.connect(host, username=user, password=passwd)
with SCPClient(ssh.get_transport()) as scp:
     config = 'sys_config'
     scp.get(config,site)

