#!/bin/bash
#

if [ -f hevcres.txt ]; then
	echo ' former test res files exist and will be removed'
	rm hevcres.txt
	rm ffmpegres.txt
fi

#LIBHEVC TEST
echo "hevcttest: -arc ssse3 core 1"
printf "./libhevctest.py -lib h -loop 5 -core 1" >>hevcres.txt
./libhevctest.py -lib h -loop 5 -core 1 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc ssse3 core 2"
printf "./libhevctest.py -lib h -loop 5 -core 2" >>hevcres.txt
./libhevctest.py -lib h -loop 5 -core 2 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc ssse3 core 4"
printf "./libhevctest.py -lib h -loop 5 -core 4" >>hevcres.txt
./libhevctest.py -lib h -loop 5 -core 4 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc sse42 core 1"
printf "./libhevctest.py -lib h -loop 5 -core 1 -arc SSE42" >>hevcres.txt
./libhevctest.py -lib h -loop 5 -core 1 -arc SSE42 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc sse42 core 2"
printf "./libhevctest.py -lib h -loop 5 -core 2 -arc SSE42" >>hevcres.txt
./libhevctest.py -lib h -loop 5 -core 2 -arc SSE42 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc sse42 core 4"
printf "./libhevctest.py -lib h -loop 5 -core 4 -arc SSE42" >>hevcres.txt
./libhevctest.py -lib h -loop 5 -core 4 -arc SSE42 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc GENERIC core 1"
printf "./libhevctest.py -lib h -loop 5 -core 1 -arc GENERIC" >>hevcres.txt
./libhevctest.py -lib h -loop 5 -core 1 -arc GENERIC >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc GENERIC core 2"
printf "./libhevctest.py -lib h -loop 5 -core 2 -arc GENERIC" >>hevcres.txt
./libhevctest.py -lib h -loop 5 -core 2 -arc GENERIC >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "hevcttest: -arc GENERIC core 4"
printf "./libhevctest.py -lib h -loop 5 -core 4 -arc GENERIC" >>hevcres.txt
./libhevctest.py -lib h -loop 5 -core 4 -arc GENERIC >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

#FFMPEG TEST
echo "FFMPEG TEST"
printf "./libhevctest.py -lib f -loop 5 " >>ffmpegres.txt
./libhevctest.py -lib f -loop 5  >>ffmpegres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi
