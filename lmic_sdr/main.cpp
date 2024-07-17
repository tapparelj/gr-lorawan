#include <stdio.h>
#include <iostream>
#include "lmic.h"
#include <unistd.h> // Para sleep
#include "loramac_tcp/loramac_tcp.c"

// LoRaWAN NwkSKey, network session key
// This should be msb first
static const u1_t NWKSKEY[16] = {0xAC, 0xDD, 0x06, 0x00, 0xB3, 0x81, 0xB2, 0xF2, 0x84, 0xAF, 0x76, 0xE9, 0x70, 0x2D, 0xB9, 0x6B};
                                  


// LoRaWAN AppSKey, application session key
// This should be msb first
static const u1_t APPSKEY[16] = {0x40, 0xA6, 0xB4, 0x0A, 0xF6, 0x39, 0xDF, 0x97, 0xAE, 0x2C, 0x1D, 0x4D, 0x01, 0x26, 0xA8, 0x3E};

// LoRaWAN end-device address (DevAddr)
// See http://thethingsnetwork.org/wiki/AddressSpace
// The library converts the address to network byte order as needed, so this should be in msb-first too.
static const u4_t DEVADDR = 0x260B1906;

void os_getArtEui (u1_t* buf) { }
void os_getDevEui (u1_t* buf) { }
void os_getDevKey (u1_t* buf) { }


static uint8_t mydata[] = "Hello, world!";
static osjob_t sendjob;



void do_send(osjob_t* j){
    // // Check if there is not a current TX/RX job running
    // if (LMIC.opmode & OP_TXRXPEND) {
    //     printf("OP_TXRXPEND, not sending");
    // } 
    // else {
        // Prepare upstream data transmission at the next possible time.
        LMIC_setTxData2(1, mydata, sizeof(mydata)-1, 0);
        printf("Packet queued\n");
    // }
    // Next TX is scheduled after TX_COMPLETE event.
}

void setup(){
    LMIC_reset();

    // LMIC_setSession (0x13, DEVADDR, NWKSKEY, APPSKEY);

    LMIC_setSession(0x13, DEVADDR, (xref2u1_t)NWKSKEY, (xref2u1_t)APPSKEY);

    #if defined(CFG_eu868)
    // Set up the channels used by the Things Network, which corresponds
    // to the defaults of most gateways. Without this, only three base
    // channels from the LoRaWAN specification are used, which certainly
    // works, so it is good for debugging, but can overload those
    // frequencies, so be sure to configure the full frequency range of
    // your network here (unless your network autoconfigures them).
    // Setting up channels should happen after LMIC_setSession, as that
    // configures the minimal channel set. The LMIC doesn't let you change
    // the three basic settings, but we show them here.
    LMIC_setupChannel(0, 868100000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_CENTI);      // g-band
    LMIC_setupChannel(1, 868300000, DR_RANGE_MAP(DR_SF12, DR_SF7B), BAND_CENTI);      // g-band
    LMIC_setupChannel(2, 868500000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_CENTI);      // g-band
    LMIC_setupChannel(3, 867100000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_CENTI);      // g-band
    LMIC_setupChannel(4, 867300000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_CENTI);      // g-band
    LMIC_setupChannel(5, 867500000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_CENTI);      // g-band
    LMIC_setupChannel(6, 867700000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_CENTI);      // g-band
    LMIC_setupChannel(7, 867900000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_CENTI);      // g-band
    LMIC_setupChannel(8, 868800000, DR_RANGE_MAP(DR_FSK,  DR_FSK),  BAND_MILLI);      // g2-band
    // TTN defines an additional channel at 869.525Mhz using SF9 for class B
    // devices' ping slots. LMIC does not have an easy way to define set this
    // frequency and support for class B is spotty and untested, so this
    // frequency is not configured here.
    #elif defined(CFG_us915) || defined(CFG_au915)
    // NA-US and AU channels 0-71 are configured automatically
    // but only one group of 8 should (a subband) should be active
    // TTN recommends the second sub band, 1 in a zero based count.
    // https://github.com/TheThingsNetwork/gateway-conf/blob/master/US-global_conf.json
    LMIC_selectSubBand(1);
    #elif defined(CFG_as923)
    // Set up the channels used in your country. Only two are defined by default,
    // and they cannot be changed.  Use BAND_CENTI to indicate 1% duty cycle.
    // LMIC_setupChannel(0, 923200000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_CENTI);
    // LMIC_setupChannel(1, 923400000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_CENTI);

    // ... extra definitions for channels 2..n here
    #elif defined(CFG_kr920)
    // Set up the channels used in your country. Three are defined by default,
    // and they cannot be changed. Duty cycle doesn't matter, but is conventionally
    // BAND_MILLI.
    // LMIC_setupChannel(0, 922100000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_MILLI);
    // LMIC_setupChannel(1, 922300000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_MILLI);
    // LMIC_setupChannel(2, 922500000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_MILLI);

    // ... extra definitions for channels 3..n here.
    #elif defined(CFG_in866)
    // Set up the channels used in your country. Three are defined by default,
    // and they cannot be changed. Duty cycle doesn't matter, but is conventionally
    // BAND_MILLI.
    // LMIC_setupChannel(0, 865062500, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_MILLI);
    // LMIC_setupChannel(1, 865402500, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_MILLI);
    // LMIC_setupChannel(2, 865985000, DR_RANGE_MAP(DR_SF12, DR_SF7),  BAND_MILLI);

    // ... extra definitions for channels 3..n here.
    #else
    # error Region not supported
    #endif

    //std::cout<<"setLinkCheckMode\n";
    LMIC_setLinkCheckMode(0);
    LMIC.dn2Dr = DR_SF9;

    //std::cout<<"LMIC_setDrTxpow\n";
    // Set data rate and transmit power for uplink
    LMIC_setDrTxpow(DR_SF7,14);

   
}

// center_freq = 860 000 000 + (0x...)*10e5

int main() {
    setup();
    for(int i=0; i<2; i++ ){

        sleep(2);
        set_loramac_variable("sf", 11);
        set_loramac_variable("cr", 1);
        do_send(&sendjob);

        sleep(1);
        set_loramac_variable("sf", 7);
        set_loramac_variable("cr", 0);
        do_send(&sendjob);
    }

    close_socket();
    return 0;
}
