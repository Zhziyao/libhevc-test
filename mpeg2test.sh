#!/bin/bash
#

if [ -f MPEG2.TXT ]; then
	echo ' former test res files exist and will be removed'
	rm MPEG2.TXT
fi

#LIBMPEG2 TEST
echo "hevcttest: -arc ssse3 core 1"
printf "./libhevctest.py -lib 2 -loop 5 -core 1" >>MPEG2.TXT
./libhevctest.py -lib 2 -loop 5 -core 1 >>MPEG2.TXT
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc ssse3 core 2"
printf "./libhevctest.py -lib 2 -loop 5 -core 2" >>MPEG2.TXT
./libhevctest.py -lib 2 -loop 5 -core 2 >>MPEG2.TXT
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc ssse3 core 4"
printf "./libhevctest.py -lib 2 -loop 5 -core 4" >>MPEG2.TXT
./libhevctest.py -lib 2 -loop 5 -core 4 >>MPEG2.TXT
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc sse42 core 1"
printf "./libhevctest.py -lib 2 -loop 5 -core 1 -arc SSE42" >>MPEG2.TXT
./libhevctest.py -lib 2 -loop 5 -core 1 -arc SSE42 >>MPEG2.TXT
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc sse42 core 2"
printf "./libhevctest.py -lib 2 -loop 5 -core 2 -arc SSE42" >>MPEG2.TXT
./libhevctest.py -lib 2 -loop 5 -core 2 -arc SSE42 >>MPEG2.TXT
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc sse42 core 4"
printf "./libhevctest.py -lib 2 -loop 5 -core 4 -arc SSE42" >>MPEG2.TXT
./libhevctest.py -lib 2 -loop 5 -core 4 -arc SSE42 >>MPEG2.TXT
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc GENERIC core 1"
printf "./libhevctest.py -lib 2 -loop 5 -core 1 -arc GENERIC" >>MPEG2.TXT
./libhevctest.py -lib 2 -loop 5 -core 1 -arc GENERIC >>MPEG2.TXT
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc GENERIC core 2"
printf "./libhevctest.py -lib 2 -loop 5 -core 2 -arc GENERIC" >>MPEG2.TXT
./libhevctest.py -lib 2 -loop 5 -core 2 -arc GENERIC >>MPEG2.TXT
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc GENERIC core 4"
printf "./libhevctest.py -lib 2 -loop 5 -core 4 -arc GENERIC" >>MPEG2.TXT
./libhevctest.py -lib 2 -loop 5 -core 4 -arc GENERIC >>MPEG2.TXT
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

#FFMPEG TEST
echo "FFMPEG TEST"
printf "./libhevctest.py -lib f -loop 5 " >>MPEG2.TXT
./libhevctest.py -lib f -loop 5  >>MPEG2.TXT
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi
