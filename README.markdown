# ipmitool_time_sync
ipmitool로 조회한 로그의 시간을 시스템 시간과 동기화합니다.

## 1. 사용 방법

소스 복사

```sh
root@localhost:/home/westporch/Git# git clone https://github.com/westporch/ipmitool_time_sync.git
```

pmitool_time_sync 디렉토리로 이동하여 install.py의 허가권을 설정합니다.

{% highlight sh %}
root@localhost:/home/westporch/Git/ipmitool_time_sync# chmod 655 install.py
{% endhighlight %}

install.py를 실행합니다.

{% highlight sh %}
root@localhost:/home/westporch/Git/ipmitool_time_sync# ./install.py
{% endhighlight %}

이후 ipmitool_time_sync.sh 파일을 /etc/rc.d/rc.local에 등록하여 부팅 시 자동으로 ipmitool_time_sync.sh 파일을 실행하도록 합니다.
