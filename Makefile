CC = gcc
CFLAGS = -Wall -Wextra -g -Iinclude
LDFLAGS = -pthread

BIN = bin

SHELL_SRC = src/main.c src/input.c src/parser.c src/process.c \
            src/builtin.c src/signals.c src/pipes.c src/redirect.c \
            src/thread.c

all: $(BIN)/shellforge $(BIN)/server $(BIN)/client

$(BIN):
	mkdir -p $(BIN)

$(BIN)/shellforge: $(SHELL_SRC) src/server.c src/client.c | $(BIN)
	$(CC) $(CFLAGS) $(SHELL_SRC) src/server.c src/client.c $(LDFLAGS) -o $@

$(BIN)/server: src/server.c src/server_main.c | $(BIN)
	$(CC) $(CFLAGS) src/server.c src/server_main.c $(LDFLAGS) -o $@

$(BIN)/client: src/client.c src/client_main.c | $(BIN)
	$(CC) $(CFLAGS) src/client.c src/client_main.c $(LDFLAGS) -o $@

run: $(BIN)/shellforge
	./$(BIN)/shellforge

clean:
	rm -rf $(BIN)/*









