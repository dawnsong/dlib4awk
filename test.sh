#! /bin/bash
#
# Version:  2014-07-09 19:04
# Copyright (C) 2014 Xiaowei Song <dawnwei.song@gmail.com>
#
# Distributed under terms of the MIT license.
#
source $(dawnbin)/dawn_bashFuncLib.sh
usage(){ printf "
Usage: (%s)
    ${0} [options]
" "$(grep -m1 '# Version' `readlink -f ${BASH_SOURCE[0]}`)" 1>&2;exit 0;}
#if [ $# -eq 0 ]; then usage; exit 0; fi 
verbose=0; 
while [ $# -gt 0 ]; do 
    case "$1" in
        '-v') verbose=1 ; shift ;;
        '--t1dir')  T1DIR=${2} ; shift 2 ;;
        '-*') elog 'Unknown parameters'; usage; exit 0 ;;
        *) break ;;
    esac
done
#
export AWKPATH=$(dawnbin)/dlib4awk

#test for etime, this way not work in magneto
#awk -f times.awk '{print etime2seconds($0)}' 
#echo 1-1:1:1 |./test.sh  # -> 90061
awk '@include "times"; {print etime2seconds($0)}' 
