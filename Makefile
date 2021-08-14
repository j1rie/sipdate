
CC              = g++

CFLAGS          = -O2

LIBS            = -lnetfilter_queue

all: sipdate

.c.o:
	$(CC) $(CFLAGS) -c $<

sipdate: sipdate.o pktbuff.o udp.o checksum.o ipv4.o ipv6.o
	$(CC) sipdate.o pktbuff.o udp.o checksum.o ipv4.o ipv6.o $(LIBS) -o sipdate


clean:
	rm -f sipdate.o pktbuff.o udp.o checksum.o ipv4.o ipv6.o
	rm -f sipdate
