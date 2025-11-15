FROM ubuntu:24.04

# TODO: Modify me if needed
ENV AFL_SKIP_CPUFREQ=0

# Copying in the target program source code
RUN mkdir /target
COPY js.c /target

# TODO: Complete this Dockerfile.
# Carry out all necessary steps to clone, build, and install AFL++,
# and compile the target js.c for fuzzing with AFL++

# Install dependencies
RUN apt-get update && apt-get -y install --no-install-recommends \
 build-essential git lld llvm llvm-dev clang ca-certificates \
 && rm -rf /var/lib/apt/lists/*


## Build and install AFL++
RUN git clone https://github.com/AFLplusplus/AFLplusplus /AFLplusplus
WORKDIR /AFLplusplus
RUN make source-only && make install 

WORKDIR /target
#copy seed folders
COPY in/ ./in/ 

# Comple js.c file 
RUN afl-clang-fast -g -o js js.c 



# Fix crash-handling issue 
ENV AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1

# CMD ["afl-fuzz", "-i", "in", "-o", "out", "--", "./js", "@@"]
# afl-fuzz -i in -o out -- ./js @@