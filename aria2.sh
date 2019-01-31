start() {
        nohup aria2c --enable-rpc=true --save-session-interval=30 --dir=/storage/emulated/O/Download --rpc-secret=aria2 --rpc-listen-port=6801 --rpc-allow-origin-all=true --input-file=../ariang/session --daemon=false --rpc-listen-all=true --enable-color=false --save-session=../ariang/session --check-certificate=false >/dev/null 2>&1 & >/dev/null 2>&1;
        sudo nginx -s stop >/dev/null 2>&1;
        sudo nginx >/dev/null 2>&1;
}
stop() {
        sudo nginx -s stop >/dev/null 2>&1;
        ps -ef |grep aria2c |grep rpc |awk '{print $1}' | xargs -I {} kill {} >/dev/null 2>&1;
}

if ps -ef |grep aria2c |grep rpc >/dev/null 2>&1;then
        stop;
        echo 'close aria2';
else
        start;
        echo 'open aria2';
fi
