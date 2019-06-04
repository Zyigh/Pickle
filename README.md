# Pickle

The app work with an api you can find ont [this github repo](https://github.com/Mykapo/Hermes) !

Go in the repo folder and setup the api url by running bin/setup-url.sh

```bash
git clone https://github.com/Zyigh/Pickle
cd Pickle
bash bin/setup-url.sh
```

In case this won't work, make sure you adapt baseUrl in PicklePOC/network/APIConnexion.swift (on line 14) so it matches url where docker is deployed.
you can find it by running `ipconfig getifaddr en0`
