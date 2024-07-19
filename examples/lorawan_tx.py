#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#
# SPDX-License-Identifier: GPL-3.0
#
# GNU Radio Python Flow Graph
# Title: Lorawan Tx
# Author: Tapparel Joachim@EPFL,TCL
# GNU Radio version: v3.11.0.0git-604-gd7f88722

from gnuradio import gr
from gnuradio.filter import firdes
from gnuradio.fft import window
import sys
import signal
from argparse import ArgumentParser
from gnuradio.eng_arg import eng_float, intx
from gnuradio import eng_notation
from gnuradio import lorawan
from gnuradio import uhd
import time
import gnuradio.lora_sdr as lora_sdr




class lorawan_tx(gr.top_block):

    def __init__(self):
        gr.top_block.__init__(self, "Lorawan Tx", catch_exceptions=True)

        ##################################################
        # Variables
        ##################################################
        self.impl_head = impl_head = False
        self.has_crc = has_crc = True
        self.cr = cr = 1

        ##################################################
        # Blocks
        ##################################################

        self.uhd_usrp_sink_0 = uhd.usrp_sink(
            ",".join(("", '')),
            uhd.stream_args(
                cpu_format="fc32",
                args='',
                channels=list(range(0,1)),
            ),
            'frame_len',
        )
        self.uhd_usrp_sink_0.set_samp_rate(500000)
        # No synchronization enforced.

        self.uhd_usrp_sink_0.set_center_freq(868.1e6, 0)
        self.uhd_usrp_sink_0.set_antenna('TX/RX', 0)
        self.uhd_usrp_sink_0.set_bandwidth(125000, 0)
        self.uhd_usrp_sink_0.set_gain(20, 0)
        self.lorawan_lorawan_source_0 = lorawan.lorawan_source(12345)
        self.lora_sdr_whitening_0 = lora_sdr.whitening(True,False,',','packet_len')
        self.lora_sdr_modulate_0 = lora_sdr.modulate(7, 500000, 125000, [0x34], (int(80*2**7)),8)
        self.lora_sdr_modulate_0.set_min_output_buffer(10000000)
        self.lora_sdr_interleaver_0 = lora_sdr.interleaver(cr, 7, 2, 125000)
        self.lora_sdr_header_0 = lora_sdr.header(impl_head, has_crc, cr)
        self.lora_sdr_hamming_enc_0 = lora_sdr.hamming_enc(cr, 7)
        self.lora_sdr_gray_demap_0 = lora_sdr.gray_demap(7)
        self.lora_sdr_add_crc_0 = lora_sdr.add_crc(has_crc)


        ##################################################
        # Connections
        ##################################################
        self.msg_connect((self.lorawan_lorawan_source_0, 'dict'), (self.lora_sdr_whitening_0, 'dict'))
        self.msg_connect((self.lorawan_lorawan_source_0, 'out0'), (self.lora_sdr_whitening_0, 'msg'))
        self.msg_connect((self.lorawan_lorawan_source_0, 'command'), (self.uhd_usrp_sink_0, 'command'))
        self.connect((self.lora_sdr_add_crc_0, 0), (self.lora_sdr_hamming_enc_0, 0))
        self.connect((self.lora_sdr_gray_demap_0, 0), (self.lora_sdr_modulate_0, 0))
        self.connect((self.lora_sdr_hamming_enc_0, 0), (self.lora_sdr_interleaver_0, 0))
        self.connect((self.lora_sdr_header_0, 0), (self.lora_sdr_add_crc_0, 0))
        self.connect((self.lora_sdr_interleaver_0, 0), (self.lora_sdr_gray_demap_0, 0))
        self.connect((self.lora_sdr_modulate_0, 0), (self.uhd_usrp_sink_0, 0))
        self.connect((self.lora_sdr_whitening_0, 0), (self.lora_sdr_header_0, 0))


    def get_impl_head(self):
        return self.impl_head

    def set_impl_head(self, impl_head):
        self.impl_head = impl_head

    def get_has_crc(self):
        return self.has_crc

    def set_has_crc(self, has_crc):
        self.has_crc = has_crc

    def get_cr(self):
        return self.cr

    def set_cr(self, cr):
        self.cr = cr
        self.lora_sdr_hamming_enc_0.set_cr(self.cr)
        self.lora_sdr_header_0.set_cr(self.cr)
        self.lora_sdr_interleaver_0.set_cr(self.cr)




def main(top_block_cls=lorawan_tx, options=None):
    tb = top_block_cls()

    def sig_handler(sig=None, frame=None):
        tb.stop()
        tb.wait()

        sys.exit(0)

    signal.signal(signal.SIGINT, sig_handler)
    signal.signal(signal.SIGTERM, sig_handler)

    tb.start()

    try:
        input('Press Enter to quit: ')
    except EOFError:
        pass
    tb.stop()
    tb.wait()


if __name__ == '__main__':
    main()
