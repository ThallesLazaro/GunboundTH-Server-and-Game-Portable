#!/usr/bin/env
bash sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get install python3.6
sudo apt-get install python3-pip
python3 -m pip install --upgrade
python3 -m pip install -r ./Requisitos.txt
python3 -m pip install pycryptodome
killall -9 python3
python3 ./Scripts.py
