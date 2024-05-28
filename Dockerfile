FROM nvidia/cuda:12.2.2-devel-ubuntu22.04

COPY requirements.txt /requirements.txt
# aptがおっそいからmirror使用
RUN sed -i.bak -r 's@http://(jp\.)?archive\.ubuntu\.com/ubuntu/?@https://ftp.udx.icscoe.jp/Linux/ubuntu/@g' /etc/apt/sources.list
RUN apt-get update &&\
    apt-get install -y python3-pip &&\
    pip install cuquantum cuquantum-python qiskit qiskit-aer-gpu
    # pip install -r requirements.txt