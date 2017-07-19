#!/bin/bash
#

if [ -f mpeg2.txt ]; then
	echo ' former test res files exist and will be removed'
	rm mpeg2.txt
fi

#LIBMPEG2 TEST
echo "hevcttest: -arc ssse3 core 1"
printf "./libmpeg2test.py -lib 2 -loop 5 -core 1" >>mpeg2.txt
./libmpeg2test.py -lib 2 -loop 5 -core 1 >>mpeg2.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc ssse3 core 2"
printf "./libmpeg2test.py -lib 2 -loop 5 -core 2" >>mpeg2.txt
./libmpeg2test.py -lib 2 -loop 5 -core 2 >>mpeg2.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc ssse3 core 4"
printf "./libmpeg2test.py -lib 2 -loop 5 -core 4" >>mpeg2.txt
./libmpeg2test.py -lib 2 -loop 5 -core 4 >>mpeg2.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc sse42 core 1"
printf "./libmpeg2test.py -lib 2 -loop 5 -core 1 -arc SSE42" >>mpeg2.txt
./libmpeg2test.py -lib 2 -loop 5 -core 1 -arc SSE42 >>mpeg2.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc sse42 core 2"
printf "./libmpeg2test.py -lib 2 -loop 5 -core 2 -arc SSE42" >>mpeg2.txt
./libmpeg2test.py -lib 2 -loop 5 -core 2 -arc SSE42 >>mpeg2.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc sse42 core 4"
printf "./libmpeg2test.py -lib 2 -loop 5 -core 4 -arc SSE42" >>mpeg2.txt
./libmpeg2test.py -lib 2 -loop 5 -core 4 -arc SSE42 >>mpeg2.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc GENERIC core 1"
printf "./libmpeg2test.py -lib 2 -loop 5 -core 1 -arc GENERIC" >>mpeg2.txt
./libmpeg2test.py -lib 2 -loop 5 -core 1 -arc GENERIC >>mpeg2.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc GENERIC core 2"
printf "./libmpeg2test.py -lib 2 -loop 5 -core 2 -arc GENERIC" >>mpeg2.txt
./libmpeg2test.py -lib 2 -loop 5 -core 2 -arc GENERIC >>mpeg2.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc GENERIC core 4"
printf "./libmpeg2test.py -lib 2 -loop 5 -core 4 -arc GENERIC" >>mpeg2.txt
./libmpeg2test.py -lib 2 -loop 5 -core 4 -arc GENERIC >>mpeg2.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

#FFMPEG TEST
echo "FFMPEG TEST"
printf "./libmpeg2test.py -lib f -loop 5 " >>mpeg2.txt
./libmpeg2test.py -lib f -loop 5  >>mpeg2.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi
