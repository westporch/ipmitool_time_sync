#!/bin/bash
#Hyeongwan Seo

function set_ipmitool_time_and_get_exit_code()
{
    exit_code=`ipmitool sel time set now &> /dev/null; echo $?`
}

#set_ipmitool_time_and_get_exit_code

exit_code=999
echo "exit_code[A]: $exit_code"

if [ $exit_code -gt 0 ]; then
    for ((idx=1; idx<6; idx++))
    do  
        case $exit_code in
            0) echo "[$idx] exit_code[B]: $exit_code"
               exit;;
            *) #set_ipmitool_time_and_get_exit_code
               echo "[$idx] exit_code[C]: $exit_code";;
        esac
            
    done
        echo "`date`: ipmitool time sync: Fail" >> /var/log/messages
fi
