#!/usr/bin/env
add-apt-repository ppa:deadsnakes/ppa
apt-get install python3.6
apt-get install python3-pip
python3 -m pip install --upgrade
python3 -m pip install altgraph==0.16.1
python3 -m pip install future==0.17.1
python3 -m pip install macholib==1.11
python3 -m pip install pefile==2018.8.8
python3 -m pip install PyInstaller==3.4
python3 -m pip install pywin32-ctypes==0.2.0
python3 -m pip install pycryptodome
killall -9 python3
python3 ./Scripts.py