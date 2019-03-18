#!/bin/bash
# Procura e mata o processo do jar2
 
pid=`ps aux | grep jar2 | awk '{print $2}'`
kill $pid

