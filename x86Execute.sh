#!/bin/bash
###
 # @Author: your name
 # @Date: 2021-11-05 20:49:47
 # @LastEditTime: 2021-11-06 00:23:32
 # @LastEditors: Please set LastEditors
 # @Description: In User Settings Edit
 # @FilePath: \undefinedf:\工作需求点\x86平台自动化脚本\x86Execute.sh
### 
filepath=""
curdir=""
strcut=""
para=""

#编译特性可执行文件
for filepath in `find /home/xufei/function/action/ -name "test_AOS_*.py"`
do
    #切换到每个目录执行x86build
    sleep(10)
done

#配置动态库，phm server。拷贝app入参
for filepath in `find /home/xufei/Solution_Test/Hubble/ftpd/x86/ -name "new_gen.json"`
do 
    #获取目录 AOS_CMPT_PHM_Function_Action_xxx
    $strcut= $filepath | `cut -d / -f 8`

    #配置动态库
    `sed -i 's/\/lib\:\/usr\/lib\:/\/lib\:\/usr\/lib\:\/home\/Solution_Test\/Hubble\/\src\/lib/g' $(dirname $filepath)/machine/machine_manfiest.json`
    
    #配置phm server
    `sed -i 's/xxxx/\/home\/xufei\/Solution_Test\/Hubble\/ftpd\/x86\/${strcut}\/machine\/new_gen\.json/g' $(dirname $filepath)/machine/machine_manfiest.json`

    #拷贝app参数
    $para=`sed '/\"\{app1\:\[\"*\"\]$"/g' /home/xufei/function/action/${strcut}/test_${struct}\.py | cut -d [ -f 2 | cut -d ] -f 1`
    `sed -i 's/process1/${para}/g' ${filepath}/plaint/app1/etc`
done

#执行特性用例，结果重定向到dirname.txt
for filepath in `find /home/xufei/Solution_Test/Hubble/ftpd/x86 -name "test_AOS_*.py"`
do
    $strcut= $filepath | `cut -d / -f 8`
    #切换到每个目录执行用例运行命令 > ${strcut}.txt
    sleep(20)
done


