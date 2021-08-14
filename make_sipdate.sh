git clone git://git.netfilter.org/libnetfilter_queue
mkdir sipdate
cp ./libnetfilter_queue/src/extra/checksum.c ./sipdate/checksum.c
cp ./libnetfilter_queue/src/extra/ipv4.c ./sipdate/ipv4.c
cp ./libnetfilter_queue/src/extra/ipv6.c ./sipdate/ipv6.c
cp ./libnetfilter_queue/src/extra/pktbuff.c ./sipdate/pktbuff.c
cp ./libnetfilter_queue/src/extra/udp.c ./sipdate/udp.c
cp ./libnetfilter_queue/src/internal.h ./sipdate/internal.h
cp ./libnetfilter_queue/utils/nfqnl_test.c ./sipdate/sipdate.c
sed -i.bak 's|include "config.h"|//include "config.h"|' ./sipdate/internal.h
patch ./sipdate/sipdate.c < sipdate.patch
patch ./sipdate/pktbuff.c < pktbuff.patch
cp ./Makefile ./sipdate/Makefile
cd ./sipdate
make
cp ./sipdate /usr/local/sbin/sipdate
cd ..
cp ./sipdate.service /etc/systemd/system/sipdate.service
systemctl daemon-reload
systemctl enable sipdate.service
systemctl start sipdate.service
