# Google usd from gltf image

An easy way to use Google usd_from_gltf (This docker image is based on Ubuntu version 20.04)

#### [Google Repository](https://github.com/google/usd_from_gltf)

> ## Include test data (3d models for testing):
> ##### Models path: `/usr/local/UFG/src/testdata/`

1. Comment the following line (line 44):
  ```
  RUN cd /home && git clone https://github.com/google/usd_from_gltf.git && python usd_from_gltf/tools/ufginstall/ufginstall.py /usr/local/UFG /usr/local/USD
  ```

2. Uncomment the following line (line 46):
  ```
  # RUN cd /home && git clone https://github.com/google/usd_from_gltf.git && python usd_from_gltf/tools/ufginstall/ufginstall.py /usr/local/UFG /usr/local/USD --testdata
  ```

> ## How to run:

 ```sh 
cd /usr/local/UFG/bin/
./usd_from_gltf  <TheSourceModelPath> <TheDestinationPathOfTheConvertedModel>
 ``` 



