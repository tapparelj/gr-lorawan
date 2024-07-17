# LoRaWAN for Software-defined Radios
This repository contains the source code to transmit LoRaWAN compatible messages using GNU Radio.
The LoRaWAN MAC layer is based on a modified version of [arduino-lmic](https://github.com/mcci-catena/arduino-lmic) that can be compiled and executed on any computer. A corresponding GNU Radio block create an interface with the Physical layer of LoRa for GNU Radio [gr-lora_sdr](https://github.com/tapparelj/gr-lora_sdr).

Note that currently, only uplink messages is supported. The transmission have been verified using a Ubuntu workstation connected to a NI-USRP 2920 and LoRa messages where received by [The Things Network](https://www.thethingsnetwork.org/). 

This work has be conducted in the Telecommunications Circuits Laboratory, EPFL in the context of a student semester project.


## Installation

To install `gr-lorawan`, follow these steps:
1. Install the implementation of the physical layer [gr-lora_sdr](https://github.com/tapparelj/gr-lora_sdr)
1. Clone this repository
1. In a terminal move into the clones repository
1. Create a build folder and move inside ```mkdir build; cd build``` 
1. Build the OOT module
    1. ```cmake ..``` if you want to install in a specific prefix use ```cmake .. -DCMAKE_INSTALL_PREFIX=/path/to/prefix```
    1. ```make ```
    1. ```(sudo) make install```


## Usage
1. Setting up the PHY layer
    1. Open the file ```gr-lorawan/examples/lorawan_tx.grc``` in gnuradio-companion
    1. Change the _UHD: USRP SINK_ according to your setup or replace by the block that supports your SDR
    1. You can run the PHY layer flowgraph. This flowgraph will listen for frames from the MAC layer and send them.
1. Configuring the node in the LoRaWAN Network
    1. In this example we will explain how to configure the node for The Things Network, but any similar LoRaWAN network provider you have similar options
    1. Connect to TTN and create a new application
    1. In the new application, select register end device
    1. Choose Enter end device specifics manually
    1. Select the following options (! It is important to choose ABP as there will only be uplink transmissions)
    1. You can press _Generate_ for all other fields

    TODO add picture here

    1. Register this end device

1. Setting up the MAC layer
    1. Open the file ```gr-lorawan/lmic_sdr/main.cpp``` that contains the main code to control the transmission of messages
    1. Copy both the _network session key_, _application session key_ and _device address_ of the node given in the end-device view. (You can press the button <> to get a suitable format to copy and paste)

    TODO add fig

    1. In the main() function, you can configure the transit gain, spreading factor and code rate
    1. The message is scheduled by the _do_send()_ function
    1. You can now build the code 
        1. Move into the folder ``` gr-lorawan/lmic_sdr/``` 
        1. Create and move into the build folder ```mkdir build; cd build```
        1. ```cmake ..```
        1. ```make```
1. Running the code
    1. Launch the GNU Radio flowgraph
    1. Execute the MAC layer code inside ```gr-lorawan/lmic_sdr/build``` using ```./lorawan```
    1. You should now see your messages in The Things Network console if a gateway is close enough to your transmitter!




