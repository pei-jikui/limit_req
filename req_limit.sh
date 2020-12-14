#!/bin/bash -e
batch_interval=${1:-0}
uri=${3:-http://10.145.70.103:2048/path1}
n=${2:-100}
request_in_batch () {
    i=0
    for i in $(seq 1 $n)
    do
        agent_name="request$i"
        #curl --user-agent $agent_name $uri >/dev/null  2>&1  &
        curl --user-agent $agent_name $uri >/dev/null  2>&1  &
        usleep 15
    done
}

#for i in $(seq 1 $n)
while [[ 1 ]]
do
    echo "sending in batch"
    request_in_batch
    sleep $batch_interval
done
