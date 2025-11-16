FROM ubuntu:24.04

# Copying in the target program source code
RUN mkdir /target
COPY js.c /target


# TODO: Complete this Dockerfile.
# Carry out all necessary steps to apply and demonstrate
# the efficacy of your patch.
COPY js.patch /target
COPY crash_000000 /target


RUN apt-get update && apt-get install -y build-essential \
    git patch && rm -rf /var/lib/apt/lists/*

WORKDIR /target


# test if you get a crash with the original js.c file
RUN gcc js.c -o js_original 

# apply the patch to js.c
RUN patch js.c js.patch

# compile the fixed version
RUN gcc js.c -o js_fixed 

CMD [ "/bin/bash" ]