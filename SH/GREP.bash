#!/bin/bash

if [ -z $1 ];then
	exit
fi
grep -oE 'http[s]{0,1}://[a-z0-9\-]+\.[a-z0-9\.\-]{2,}' $1 |sort |uniq|grep -oE '[a-z0-9\-]+\.[a-z0-9\.\-]{2,}'|grep -v 'www\.'
grep -oE 'http[s]{0,1}://[a-z0-9\-]+\.[a-z0-9\.\-]{2,}' $1 |sort |uniq|grep -oP '(?<=www\.)[a-z0-9\-]+\.[a-z0-9\.\-]{2,}'
