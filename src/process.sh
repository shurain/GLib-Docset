#!/bin/bash

API='/Users/shurain/doc/glib/api-index-full.html'
MODULE='/Users/shurain/doc/glib/index.html'

API_FILE=tmp.api
MODULE_FILE=tmp.module

echo "Preprocessing APIs"
grep "<a class=\"link\" href" $API | sed "s/<a class=\"link\" href=\"//g" | sed "s/\" title=.*>\(.*\)<\/a>,/ \1/g" | sed "s/ in.*$//g" | sed "s/enum$/clconst/g" | sed "s/user_function/function/g" | sed "s/function$/func/g" | sed "s/struct$/cl/g" | sed "s/typedef$/tdef/g" | sed "s/union$/cl/g" | sed "s/variable$/clconst/g" > $API_FILE

echo "Preprocessing Modules"
grep "href" $MODULE | sed "s/.*<link.*//g" | sed "s/.*<dt>.*//g" | sed "s/.*class=\"ulink\".*//g" | sed "s/^\n$//g" | sed "/^$/d" | sed "s/.*<a href=\"//g" | sed "s/\">\(.*\)<\/a><\/span>.*/ \1/g" | sed -n '/glib-Version-Information.html/,$p' | sed "/glib-Automatic-String-Completion.html/q" > $MODULE_FILE

echo "python process.py"
python process.py

echo "Done"
