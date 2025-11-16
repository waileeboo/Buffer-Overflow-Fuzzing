#!/bin/bash

docker build -t sshs_asg2 -f Dockerfile .
docker run -v .:/workspace -it sshs_asg2 bash -c "
    echo '-----------------------------------------------------' ;
    echo 'testing original binary with crash input before applying patch' ;
    ./js_original crash_000000 || echo 'CRASH';
    echo '------------------------------------------------------' ;
    echo 'testing fixed binary with crash input after applying patch';
    ./js_fixed crash_000000;
    echo '------------------------------------------------------' ;"