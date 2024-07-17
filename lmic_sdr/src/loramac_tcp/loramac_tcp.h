#ifndef LORAMAC_TCP_H
#define LORAMAC_TCP_H

#include <stdint.h>
#include <stdbool.h> // Necesario para el tipo de dato booleano

// Define constants
#define PORT 12345
#define SERVER_IP "127.0.0.1"

// Define LoRaMAC settings struct
typedef struct {
    uint8_t variable;
    uint8_t value;
} LoRaMAC_Settings;

// Function declarations
void set_loramac_variable(const char *variable, uint8_t value);
void send_payload_over_tcp(const uint8_t *payload, char payload_len, bool send_payload);
void variables_print();
int open_socket();
int connect_to_server(int socket_fd);
void close_socket();

#endif /* LORAMAC_TCP_H */
