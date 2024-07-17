// #include "loramac_tcp.h"
// #include <sys/socket.h>
// #include <netinet/in.h>
// #include <arpa/inet.h>
// #include <unistd.h>
// #include <stdio.h>
// #include <string.h>

// #define PORT 12345
// #define SERVER_IP "127.0.0.1"


// // Function to set LoRaMAC variable and value
// void set_loramac_variable(const char *variable, uint8_t value) {
//     // Convert variable to corresponding hexadecimal value
//     if (strcmp(variable, "cr") == 0) {
//         settings.variable = 0x01; // cr
//     } 
//     else if (strcmp(variable, "sf") == 0) {
//         settings.variable = 0x02; // sf
//         printf("VARIABLE TO CHANGE SF\n");
//     } 
//     else if (strcmp(variable, "bw") == 0) {
//         settings.variable = 0x03; // bw
//     } 
//     else if (strcmp(variable, "center_freq") == 0) {
//         settings.variable = 0x04; // center_freq
//     } 
//     else if (strcmp(variable, "tx_power") == 0) {
//         settings.variable = 0x05; // tx_power
//     } 
//     else {
//         // Handle invalid variable
//         return;
//     }

//     // Save the value
//     settings.value = value;
//     printf("LoRaMAC value: 0x%02X\n", settings.value);
//     printf("LoRaMAC variable: 0x%02X\n", settings.variable);
// }

// void variables_print(){
//     printf("pointer : 0x%04X",&settings);
//     printf("LoRaMAC value: 0x%02X\n", settings.value);
//     printf("LoRaMAC variable: 0x%02X\n", settings.variable);
// }

// // uint8_t loramac_variable_settings(){
// //     uint8_t new_var = settings.variable; 
// //     return new_var;
// // }


// // Function to send payload over TCP
// void send_payload_over_tcp(const uint8_t *payload, char payload_len) {
//     printf("LoRaMAC value: 0x%02X\n", settings.value);
//     printf("LoRaMAC variable: 0x%02X\n", settings.variable);
//     variables_print();
//     uint8_t new_payload[payload_len + 2];
//     new_payload[0] = settings.variable;
//     new_payload[1] = settings.value;
//     memcpy(&new_payload[2], payload, payload_len);

//     struct sockaddr_in server_address;
//     memset(&server_address, 0, sizeof(server_address));
//     server_address.sin_family = AF_INET;
//     server_address.sin_port = htons(PORT);
//     server_address.sin_addr.s_addr = inet_addr(SERVER_IP);

//     int client_socket = socket(AF_INET, SOCK_STREAM, 0);
//     if (client_socket < 0) {
//         perror("Error al crear el socket");
//         return;
//     }

//     if (connect(client_socket, (struct sockaddr *)&server_address, sizeof(server_address)) < 0) {
//         perror("Error al conectar al servidor");
//         close(client_socket);
//         return;
//     }

//     send(client_socket, new_payload, payload_len + 2, 0);
//     close(client_socket);
// }

#include "loramac_tcp.h"
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#define PORT 12345
#define SERVER_IP "127.0.0.1"

static int client_socket = -1; // Socket global para mantenerlo abierto

// Define la matriz de variables con sus valores predefinidos
static uint8_t variables_values[][2] = {
    // cr, sf, bw, center_freq, tx_power
    {0x01, 0x0A}, // cr
    {0x02, 0x00}, // sf
    {0x03, 0x00}, // bw
    {0x04, 0x00}, // center_freq
    {0x05, 255}  // tx_power
};

// Function to set LoRaMAC variable and value
void set_loramac_variable(const char *variable, uint8_t value) {
    if (strcmp(variable, "cr") == 0) {
        variables_values[0][1] = value;
        printf("Coding rate set to %u", value);
        printf("\n");
    } 
    else if (strcmp(variable, "sf") == 0) {
        variables_values[1][1] = value;
        printf("Spreading factor set to %u", value);
        printf("\n");
    } 
    else if (strcmp(variable, "bw") == 0) {
        variables_values[2][1] = value;
        printf("Bandwidth set to %u", value);
        printf("\n");
    } 
    else if (strcmp(variable, "center_freq") == 0) {
        variables_values[3][1] = value;
        printf("Center frequency set to 86%u", value);
        printf("00000 Hz \n");
    } 
    else if (strcmp(variable, "tx_power") == 0) {
        variables_values[4][1] = value;
        printf("Transmission power set to %u", value);
        printf("\n");
    } 
    else {
        // Handle invalid variable
        return;
    }
    send_payload_over_tcp(0,0,0);
}

// Function to open socket
int open_socket() {
    int socket_fd = socket(AF_INET, SOCK_STREAM, 0);
    //printf("socket_fd: 0x%02X\n", socket_fd);
    if (socket_fd < 0) {
        perror("Failed to create socket");
    }
    return socket_fd;
}

// Function to connect to server
int connect_to_server(int socket_fd) {
    struct sockaddr_in server_address;
    memset(&server_address, 0, sizeof(server_address));
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(PORT);
    server_address.sin_addr.s_addr = inet_addr(SERVER_IP);
    //printf("socket_fd: 0x%02X\n", socket_fd);
    if (connect(socket_fd, (struct sockaddr *)&server_address, sizeof(server_address)) < 0) {
        perror("Failed to connect to server");
        close(socket_fd);
        return -1;
    }
    return 0;
}

// Function to send payload or settings over TCP
void send_payload_over_tcp(const uint8_t *payload, char payload_len, bool send_payload) {
    if (client_socket < 0) {
        client_socket = open_socket();
        if (client_socket < 0) {
            return;
        }
        if (connect_to_server(client_socket) < 0) {
            return;
        }
    }

    // Convert matrix information to array of bytes if send_payload is false
    if (!send_payload) {
        uint8_t settings_payload[sizeof(variables_values)];
        int index = 0;
        for (int i = 0; i < sizeof(variables_values) / sizeof(variables_values[0]); ++i) {
            settings_payload[index++] = variables_values[i][0];
            settings_payload[index++] = variables_values[i][1];
        }
        //printf("LoRaMAC value: 0x%02X\n", settings_payload);
        // Send settings through TCP
        send(client_socket, settings_payload, sizeof(settings_payload), 0);
    } else {
        uint8_t new_payload[payload_len + 1];
        new_payload[0] = 0x00;
        memcpy(&new_payload[1], payload, payload_len);
        //printf("Frame: 0x%02X\n", new_payload);
        send(client_socket, new_payload, payload_len + 1, 0);
        printf("LoRaWAN Frame succesfully sent \n");
    }
    client_socket = -1;
}

// Function to close socket
void close_socket() {
    if (client_socket >= 0) {
        close(client_socket);
        client_socket = -1; // Reset socket to indicate closed state
    }
}
