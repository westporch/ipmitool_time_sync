#!/bin/bash
#Hyeongwan Seo

LOG_FILE=/var/log/messages

: '
   ipmitool sel time set now 명령어를 정상적으로 실행하면 반환값은 0임.
   명령어 실행시 오류가 발생하면 반환값은 0보다 큰 양의정수임.
'
function set_ipmitool_time_and_get_exit_code()
{
    exit_code=`ipmitool sel time set now &> /dev/null; echo $?`
}


: '
    1. 로그 메시지를 출력함.
    2. logger 명령어로는 /var/log/messages에 로그가 남지않아서 리다이렉션으로 로그를 남기도록 함.
'
echo "`date`: ipmitool time sync: Start" >> $LOG_FILE   #로그 메시지 출력

set_ipmitool_time_and_get_exit_code

: '
    프로그램 작동 테스트용 주석
'
#exit_code=999
#echo "exit_code[A]: $exit_code"

if [ $exit_code -gt 0 ]; then
    for ((idx=1; idx<6; idx++))
    do  
        case $exit_code in
            0) echo "[$idx] exit_code[B]: $exit_code" >> $LOG_FILE #로그를 출력해서 작동 테스트 
               exit;;
            *) set_ipmitool_time_and_get_exit_code
               echo "[$idx] exit_code[C]: $exit_code" >> $LOG_FILE;; #로그를 출력해서 작동 테스트
        esac

    done
        echo "`date`: ipmitool time sync: Fail" >> $LOG_FILE    #로그 메시지 출력
fi
