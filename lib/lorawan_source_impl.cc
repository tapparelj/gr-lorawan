/* -*- c++ -*- */
/*
 * Copyright 2024 Tapparel Joachim & Laorden Poveda Rubén @TCL, EPFL.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

#include "lorawan_source_impl.h"
#include <gnuradio/io_signature.h>

namespace gr {
namespace lorawan {

#pragma message("set the following appropriately and remove this warning")
lorawan_source::sptr lorawan_source::make(int tcp_port)
{
    return gnuradio::make_block_sptr<lorawan_source_impl>(tcp_port);
}


/*
 * The private constructor
 */
lorawan_source_impl::lorawan_source_impl(int tcp_port)
    : gr::sync_block("lorawan_source",
                     gr::io_signature::make(0, 0, 0),
                     gr::io_signature::make(
                         0 /* min outputs */, 0 /*max outputs */, 0))
{
    m_tcp_port = tcp_port;
    m_running = true;
    m_thread = std::thread(&lorawan_source_impl::tcp_server_thread, this);

    m_cr = 0;
    m_sf = 12;
    m_bw = 125000;
    m_center_freq = 868300000;
    m_tx_power = 0;

    message_port_register_out(pmt::mp("out0"));
    message_port_register_out(pmt::mp("dict"));
    message_port_register_out(pmt::mp("command"));
}

/*
 * Our virtual destructor.
 */
lorawan_source_impl::~lorawan_source_impl() {}

int lorawan_source_impl::work(int noutput_items,
                              gr_vector_const_void_star& input_items,
                              gr_vector_void_star& output_items)
{
    // Tell runtime system how many output items we produced.
    return noutput_items;
}

void lorawan_source_impl::tcp_server_thread()
{
    int server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket == -1) {
        std::cerr << "Error creating socket\n";
        return;
    }

    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_addr.s_addr = INADDR_ANY;
    server_address.sin_port = htons(m_tcp_port);

    if (bind(server_socket, (struct sockaddr *)&server_address, sizeof(server_address)) == -1) {
        std::cerr << "Socket binding error\n";
        close(server_socket);
        return;
    }

    if (listen(server_socket, 5) == -1) {
        std::cerr << "Error listening for incoming connections\n";
        close(server_socket);
        return;
    }

    std::cout << "Waiting for incoming connections on TCP port " << m_tcp_port << " ...\n";

    while (m_running) {
        int client_socket = accept(server_socket, NULL, NULL);
        if (client_socket == -1) {
            std::cerr << "Error accepting connection\n";
            close(server_socket);
            return;
        }

        std::cout << "Client connected. Receiving data...\n";

        uint8_t buffer[1024];
        ssize_t bytes_received = recv(client_socket, buffer, sizeof(buffer), 0);

        std::ostringstream convert;
        for (ssize_t i = 0; i < bytes_received; i++) {
            convert << std::uppercase << std::hex << std::setfill('0') << std::setw(2) << (int)buffer[i];
        }
        std::cout << "Payload received: " << convert.str() << std::endl;
        std::string payload_hex = convert.str();

        if (bytes_received == -1) {
            std::cerr << "Error receiving data\n";
            close(client_socket);
            continue; // Continue with next cycle
        }

        uint8_t byte_variable = buffer[0];

        // Remove the extra byte
        
        if (bytes_received > 0 && byte_variable != BYTE_PAYLOAD) {
            update_parameters(buffer, bytes_received); // Update configuration

        } else if (bytes_received > 0 && byte_variable == BYTE_PAYLOAD) {

            std::copy(buffer + 1, buffer + bytes_received, buffer);
            bytes_received = bytes_received - 1;

            pmt::pmt_t dict = create_dictionary();
            pmt::pmt_t command = create_dictionary_command();

            handle_payload(buffer, bytes_received, dict, command); // Handle payload
        }

        close(client_socket);
    }

    close(server_socket);
}
void lorawan_source_impl::handle_payload(uint8_t* payload, ssize_t payload_len, pmt::pmt_t dict, pmt::pmt_t command)
{

    // Convert the payload to a sequence of bits and represent them as uppercase hexadecimal numbers
    std::ostringstream convert;
    for (ssize_t i = 0; i < payload_len; i++) {
        convert << std::uppercase << std::hex << std::setfill('0') << std::setw(2) << (int)payload[i];
    }
    std::cout << "Payload received: " << convert.str() << std::endl;
    std::string payload_hex = convert.str();

    // Create a complex symbol to represent the payload in hexadecimal format
    pmt::pmt_t payload_hex_symbol = pmt::string_to_symbol(payload_hex);

    // Publish the payload in hexadecimal format and the dictionary to the respective output ports
    message_port_pub(pmt::mp("out0"), payload_hex_symbol);
    message_port_pub(pmt::mp("dict"), dict);  // Sending the dictionary as an additional output
    message_port_pub(pmt::mp("command"), command);

}

void lorawan_source_impl::update_parameters(uint8_t *buffer, ssize_t bytes_received)
{
    int byte_index = 0;
    for (int i = 0; i < bytes_received; i += 2) {
        uint8_t variable = buffer[i];
        uint8_t value = buffer[i + 1];

        switch (variable) {
            case 0x01:
                if(value != 10){
                    //std::cout << "CR\n";
                    m_cr = static_cast<int>(value);
                }
                break;
            case 0x02:
                if(value != 0){
                    //std::cout << "SF\n";
                    m_sf = static_cast<int>(value);
                }              
                break;
            case 0x03:
               
                if(value != 0){
                    //std::cout << "BW\n";
                    if(value == 12){
                        m_bw = 120000;
                    }
                    if(value == 25){
                        m_bw = 250000;
                    }
                    if(value == 50){
                        m_bw = 500000;
                    }
                }          
                break;
            case 0x04:
                
                if(value != 0){
                    //std::cout << "Center_freq\n";
                    m_center_freq = 860000000 + static_cast<int>(value)* 100000;
                }             
                break;
            case 0x05:
                
                if(value != 255){
                    //std::cout << "Tx_power\n";
                    m_tx_power = static_cast<int>(value);
                }            
                break;
            default:
                std::cerr << "Unknown purpose for the extra byte: " << (int)variable << std::endl;
                break;
        }
    }
}

pmt::pmt_t lorawan_source_impl::create_dictionary()
{
    pmt::pmt_t dict = pmt::make_dict();
    dict = pmt::dict_add(dict, pmt::intern("cr"), pmt::from_long(m_cr));
    dict = pmt::dict_add(dict, pmt::intern("sf"), pmt::from_long(m_sf));
    dict = pmt::dict_add(dict, pmt::intern("bw"), pmt::from_long(m_bw));
    dict = pmt::dict_add(dict, pmt::intern("center_freq"), pmt::from_long(m_center_freq));
    dict = pmt::dict_add(dict, pmt::intern("tx_power"), pmt::from_long(m_tx_power));
    
    return dict;
}

pmt::pmt_t lorawan_source_impl::create_dictionary_command()
{
    pmt::pmt_t command = pmt::make_dict();
    command = pmt::dict_add(command, pmt::mp("freq"), pmt::mp(m_center_freq)); // Specify frequency
    command = pmt::dict_add(command, pmt::mp("gain"), pmt::mp(m_tx_power)); 
    command = pmt::dict_add(command, pmt::mp("bandwidth"), pmt::mp(m_bw)); 
    command = pmt::dict_add(command, pmt::mp("rate"), pmt::mp(4*m_bw)); 
    
    return command;
}


} /* namespace lorawan */
} /* namespace gr */
