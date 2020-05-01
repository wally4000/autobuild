export PSPDEV=$(pwd)/pspdev
export PATH=$PATH:$PSPDEV/bin
export PING_SLEEP=30s
## If specific steps were requested...
if [ $1 ]; then
  ## Run the requested build scripts.
  ./toolchain.sh $@
else
  bash -c "while true; do echo \$(date) - building ...; sleep $PING_SLEEP; done" &
  PING_LOOP_PID=$!
  ## Run the all build scripts.
  num_cpus=15 ./toolchain.sh $(seq 1 11) >> buildoutput.txt 2>&1
fi
