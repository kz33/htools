#!/usr/bin/env bash

if test -z "$1";then
    echo "Error arguments:"
    echo "   $0 IP [PASSWORD]"
    exit 1
fi

cd $(dirname $0)

list_file() {
    find .  -maxdepth 1 -size -1000k -type f
    echo .git
    echo .gitignore
}

rm -rf /tmp/htools/
mkdir /tmp/htools
cp -a `list_file |grep -v '^#'|xargs` /tmp/htools/

./hss u "$1" /tmp/htools/ /root/ &&
    ./hss "$1"
