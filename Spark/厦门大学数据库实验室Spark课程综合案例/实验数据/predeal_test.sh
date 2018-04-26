#!/bin/bash
#下面设置输入文件，把用户执行predeal_test.sh命令时提供的第一个参数作为输入文件名称
infile=$1
#下面设置输出文件，把用户执行predeal_test.sh命令时提供的第二个参数作为输出文件名称
outfile=$2
#注意！！最后的$infile > $outfile必须跟在}’这两个字符的后面
awk -F "," 'BEGIN{
      id=0;
    }
    {
        if($1 && $2 && $3 && $4 && !$5){
            id=id+1;
            print $1","$2","$3","$4","1
            if(id==10000){
                exit
            }
        }
    }' $infile > $outfile
