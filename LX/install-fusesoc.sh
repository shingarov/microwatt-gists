#!/bin/bash

if [ ! -x "$(pwd)/LX/build-bitstream.sh" ]; then
  echo "Please run me from the directory that is the common parent of microwatt and mw"
  exit 1
fi


rm -rf /home/boris/.local/share/fusesoc
mkdir  /home/boris/.local/share/fusesoc
mkdir  /home/boris/.local/share/fusesoc/fusesoc-cores
mkdir  /home/boris/.local/share/fusesoc/orpsoc-cores

pip3 install --user fusesoc --break-system-packages

rm -rf mw
mkdir mw
cd mw
fusesoc library add fusesoc-cores https://github.com/fusesoc/fusesoc-cores
fusesoc fetch uart16550

# Sanity check
fusesoc core-info uart16550
status=$?
if [[ $status -ne 0 ]]; then
        echo BAD BAD BAD
        exit 1
fi
echo Good, fusesoc seems ok, now we can try build-bitstream.sh
cd ..

