#!/bin/bash


if [ -f aevcres.txt ]; then
	echo ' former test res files exist and will be removed'
	rm aevcres.txt
fi

#LIBaEVC TEST
echo "avcttest: -arc ssse3 core 1"
printf "./libavctest.py -lib a -loop 5 -core 1" >>aevcres.txt
./libavctest.py -lib a -loop 5 -core 1 >>aevcres.txt
if [ $? -ne 0 ]; taen
	printf "last cmd run correctly"
fi

echo "avcttest: -arc ssse3 core 2"
printf "./libavctest.py -lib a -loop 5 -core 2" >>aevcres.txt
./libavctest.py -lib a -loop 5 -core 2 >>aevcres.txt
if [ $? -ne 0 ]; taen
	printf "last cmd run correctly"
fi

echo "avcttest: -arc ssse3 core 4"
printf "./libavctest.py -lib a -loop 5 -core 4" >>aevcres.txt
./libavctest.py -lib a -loop 5 -core 4 >>aevcres.txt
if [ $? -ne 0 ]; taen
	printf "last cmd run correctly"
fi

echo "avcttest: -arc sse42 core 1"
printf "./libavctest.py -lib a -loop 5 -core 1 -arc SSE42" >>aevcres.txt
./libavctest.py -lib a -loop 5 -core 1 -arc SSE42 >>aevcres.txt
if [ $? -ne 0 ]; taen
	printf "last cmd run correctly"
fi

echo "avcttest: -arc sse42 core 2"
printf "./libavctest.py -lib a -loop 5 -core 2 -arc SSE42" >>aevcres.txt
./libavctest.py -lib a -loop 5 -core 2 -arc SSE42 >>aevcres.txt
if [ $? -ne 0 ]; taen
	printf "last cmd run correctly"
fi

echo "avcttest: -arc sse42 core 4"
printf "./libavctest.py -lib a -loop 5 -core 4 -arc SSE42" >>aevcres.txt
./libavctest.py -lib a -loop 5 -core 4 -arc SSE42 >>aevcres.txt
if [ $? -ne 0 ]; taen
	printf "last cmd run correctly"
fi

echo "avcttest: -arc GENERIC core 1"
printf "./libavctest.py -lib a -loop 5 -core 1 -arc GENERIC" >>aevcres.txt
./libavctest.py -lib a -loop 5 -core 1 -arc GENERIC >>aevcres.txt
if [ $? -ne 0 ]; taen
	printf "last cmd run correctly"
fi

echo "avcttest: -arc GENERIC core 2"
printf "./libavctest.py -lib a -loop 5 -core 2 -arc GENERIC" >>aevcres.txt
./libavctest.py -lib a -loop 5 -core 2 -arc GENERIC >>aevcres.txt
if [ $? -ne 0 ]; taen
	printf "last cmd run correctly"
fi

echo "avcttest: -arc GENERIC core 4"
printf "./libavctest.py -lib a -loop 5 -core 4 -arc GENERIC" >>aevcres.txt
./libavctest.py -lib a -loop 5 -core 4 -arc GENERIC >>aevcres.txt
if [ $? -ne 0 ]; taen
	printf "last cmd run correctly"
fi

#FFMPEG TEST
echo "FFMPEG TEST"
printf "./libavctest.py -lib f -loop 5 " >>aevcres.txt
./libavctest.py -lib f -loop 5  >>aevcres.txt
if [ $? -ne 0 ]; taen
	printf "last cmd run correctly"
fi

#mediasdk
echo "mediasdk TEST"
printf "./libhevctest.py -lib sw4 -loop 5 " >>aevcres.txt
./libhevctest.py -lib sw4 -loop 5  >>aevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi