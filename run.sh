#!/bin/bash
set -e

source sgx_device.sh

determine_sgx_device &&\
echo "Run sconified image..." && \
docker run -it --rm --network=host $MOUNT_SGXDEVICE \
-eSCONE_VERSION=1 \
-eSCONE_MODE=hw \
-eSCONE_LOG="DEBUG" \
-ePATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
hello-world-python-scone python3 /app/helloworld.py
