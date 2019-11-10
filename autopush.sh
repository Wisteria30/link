#!/bin/sh
echo "監視対象 README.md"
echo "実行コマンド 'git commit -am update & git push'"
INTERVAL=1 #監視間隔, 秒で指定
last=`ls -l -T README.md | awk '{print $8}'`
while true; do
        sleep $INTERVAL
        current=`ls -l -T README.md | awk '{print $8}'`
        if [ $last != $current ] ; then
                echo ""
                echo "updated: $current"
                last=$current
                eval git commit -am "update" & git push
        fi
done
