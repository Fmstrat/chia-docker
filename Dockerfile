FROM ubuntu:20.04

RUN apt-get update &&\
    DEBIAN_FRONTEND='noninteractive' apt-get install -y git lsb-core sudo &&\
    git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules &&\
    cd chia-blockchain &&\
    sh install.sh &&\
    apt-get clean &&\
    . ./activate

ENTRYPOINT ["bash", "--init-file", "/chia-blockchain/activate"]
