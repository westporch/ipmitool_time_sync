#!/usr/bin/python
#Hyeongwan Seo

import os; 

os.system("chmod 655 ipmitool_time_sync.sh")

ABS_PATH=os.getcwd() + "/./ipmitool_time_sync.sh"

#부팅 시 스크립트를 자동 실행하도록 /etc/rc.d/rc.local에 쉘 스크립트를 등록함.
f = open("/etc/rc.d/rc.local", "a")
data = ABS_PATH
f.write('\n' + data)
f.close()
