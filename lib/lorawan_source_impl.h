/* -*- c++ -*- */
/*
 * Copyright 2024 Tapparel Joachim & Laorden Poveda Rubén @TCL, EPFL.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

#ifndef INCLUDED_LORAWAN_LORAWAN_SOURCE_IMPL_H
#define INCLUDED_LORAWAN_LORAWAN_SOURCE_IMPL_H

#include <gnuradio/lorawan/lorawan_source.h>
#include <thread>
#include <iomanip>
#include <map>
#include <iostream>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>

namespace gr {
namespace lorawan {

#define BYTE_PAYLOAD 0x00

class lorawan_source_impl : public lorawan_source
{
private:
    int m_tcp_port;
    bool m_running;
    std::thread m_thread;
    int m_server_socket;

    int m_cr;
    int m_sf;
    int m_bw;
    int m_center_freq;
    int m_tx_power;

    // Function TCP server thread
    void tcp_server_thread();

    // Function to handle the payload based on the value of the extra byte
    void handle_payload(uint8_t* payload, ssize_t payload_len, pmt::pmt_t dict, pmt::pmt_t command);

    // Function to update parameters based on received bytes
    void update_parameters(uint8_t *buffer, ssize_t bytes_received);

    // Function to create the dictionary
    pmt::pmt_t create_dictionary();
    
    // Function to update the dictionary
    pmt::pmt_t update_dictionary(uint8_t byte_variable, uint8_t byte_value);

    // Function to create the dictionary command
    pmt::pmt_t create_dictionary_command();

public:
    lorawan_source_impl(int tcp_port=12345);
    ~lorawan_source_impl();

    // Where all the action really happens
    int work(int noutput_items,
             gr_vector_const_void_star& input_items,
             gr_vector_void_star& output_items);
};

} // namespace lorawan
} // namespace gr

#endif /* INCLUDED_LORAWAN_LORAWAN_SOURCE_IMPL_H */
