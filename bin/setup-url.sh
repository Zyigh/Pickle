#!/bin/bash

personalip=`ipconfig getifaddr en0`
cat PicklePoc/network/APIConnexion.swift | sed -e "s/10.93.182.93/$personalip/g" > PicklePoc/network/APIConnexion.swift
