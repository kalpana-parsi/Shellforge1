#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<arpa/inet.h>
#define PORT 8080
void start_server()
{
    int server_fd, client_fd;
    struct sockaddr_in server_addr;
    char buffer[1024];

    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(PORT);
    bind(server_fd, (struct sockaddr*)&server_addr, sizeof(server_addr));
    listen(server_fd, 5);
    printf("Server listening on port %d...\n", PORT);
    client_fd = accept(server_fd, NULL, NULL);
    recv(client_fd, buffer, sizeof(buffer), 0);
    printf("Client: %s\n", buffer);
    send(client_fd, "Hello from Server", 17, 0);
    close(client_fd);
    close(server_fd);
}
