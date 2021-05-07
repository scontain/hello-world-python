#!/bin/bash

docker run -it --rm \
            -v /var/run/docker.sock:/var/run/docker.sock \
            registry.scontain.com:5050/sconecuratedimages/iexec-sconify-image:5.3.3 sconify_iexec \
            --name=helloworldPython \
            --from=registry.scontain.com:5050/sconecuratedimages/iexecsgx:hello-world-python \
            --to=hello-world-python-scone \
            --binary-fs \
            --fs-dir=/app \
            --binary="/usr/bin/python3.7" \
            --heap="128m" \
            --dlopen="2" \
            --no-color \
            --command="python3 /app/helloworld.py"
