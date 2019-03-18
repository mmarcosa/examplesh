#!/bin/bash
# Procura e mata o processo do jar2
 
pid=`ps aux | grep jar1 | awk '{print $2}'`
kill -9 $pid
