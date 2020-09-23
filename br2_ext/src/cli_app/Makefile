CC=gcc
RM = rm -f
OBJS = cli_cmd.o cli_netlink.o cli_util.o main.o
TARGET = cli_app

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(OBJS) -pthread -lm

clean:
	$(RM) $(OBJS) $(TARGET)