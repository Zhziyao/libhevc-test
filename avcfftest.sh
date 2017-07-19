#!/bin/bash


if [ -f avcres.txt ]; then
	echo ' former test res files exist and will be removed'
	rm avcres.txt
fi

#LIBaEVC TEST
echo "avcttest: -arc ssse3 core 1"
printf "./libavctest.py -lib a -loop 5 -core 1" >>avcres.txt
./libavctest.py -lib a -loop 5 -core 1 >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc ssse3 core 2"
printf "./libavctest.py -lib a -loop 5 -core 2" >>avcres.txt
./libavctest.py -lib a -loop 5 -core 2 >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc ssse3 core 4"
printf "./libavctest.py -lib a -loop 5 -core 4" >>avcres.txt
./libavctest.py -lib a -loop 5 -core 4 >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc sse42 core 1"
printf "./libavctest.py -lib a -loop 5 -core 1 -arc SSE42" >>avcres.txt
./libavctest.py -lib a -loop 5 -core 1 -arc SSE42 >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc sse42 core 2"
printf "./libavctest.py -lib a -loop 5 -core 2 -arc SSE42" >>avcres.txt
./libavctest.py -lib a -loop 5 -core 2 -arc SSE42 >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc sse42 core 4"
printf "./libavctest.py -lib a -loop 5 -core 4 -arc SSE42" >>avcres.txt
./libavctest.py -lib a -loop 5 -core 4 -arc SSE42 >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc GENERIC core 1"
printf "./libavctest.py -lib a -loop 5 -core 1 -arc GENERIC" >>avcres.txt
./libavctest.py -lib a -loop 5 -core 1 -arc GENERIC >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc GENERIC core 2"
printf "./libavctest.py -lib a -loop 5 -core 2 -arc GENERIC" >>avcres.txt
./libavctest.py -lib a -loop 5 -core 2 -arc GENERIC >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc GENERIC core 4"
printf "./libavctest.py -lib a -loop 5 -core 4 -arc GENERIC" >>avcres.txt
./libavctest.py -lib a -loop 5 -core 4 -arc GENERIC >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

#FFMPEG TEST
echo "FFMPEG TEST"
printf "./libavctest.py -lib f -loop 5 " >>avcres.txt
./libavctest.py -lib f -loop 5  >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

#mediasdk
echo "mediasdk TEST"
printf "./libhevctest.py -lib sw4 -loop 5 " >>avcres.txt
./libhevctest.py -lib sw4 -loop 5  >>avcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi