#!/bin/bash


#LIBHEVC TEST
echo "avcttest: -arc ssse3 core 1"
printf "./libavctest.py -lib h -loop 5 -core 1" >>hevcres.txt
./libavctest.py -lib h -loop 5 -core 1 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc ssse3 core 2"
printf "./libavctest.py -lib h -loop 5 -core 2" >>hevcres.txt
./libavctest.py -lib h -loop 5 -core 2 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc ssse3 core 4"
printf "./libavctest.py -lib h -loop 5 -core 4" >>hevcres.txt
./libavctest.py -lib h -loop 5 -core 4 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc sse42 core 1"
printf "./libavctest.py -lib h -loop 5 -core 1 -arc SSE42" >>hevcres.txt
./libavctest.py -lib h -loop 5 -core 1 -arc SSE42 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc sse42 core 2"
printf "./libavctest.py -lib h -loop 5 -core 2 -arc SSE42" >>hevcres.txt
./libavctest.py -lib h -loop 5 -core 2 -arc SSE42 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc sse42 core 4"
printf "./libavctest.py -lib h -loop 5 -core 4 -arc SSE42" >>hevcres.txt
./libavctest.py -lib h -loop 5 -core 4 -arc SSE42 >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc GENERIC core 1"
printf "./libavctest.py -lib h -loop 5 -core 1 -arc GENERIC" >>hevcres.txt
./libavctest.py -lib h -loop 5 -core 1 -arc GENERIC >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc GENERIC core 2"
printf "./libavctest.py -lib h -loop 5 -core 2 -arc GENERIC" >>hevcres.txt
./libavctest.py -lib h -loop 5 -core 2 -arc GENERIC >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

echo "avcttest: -arc GENERIC core 4"
printf "./libavctest.py -lib h -loop 5 -core 4 -arc GENERIC" >>hevcres.txt
./libavctest.py -lib h -loop 5 -core 4 -arc GENERIC >>hevcres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi

#FFMPEG TEST
echo "FFMPEG TEST"
printf "./libavctest.py -lib f -loop 5 " >>ffmpegres.txt
./libavctest.py -lib f -loop 5  >>ffmpegres.txt
if [ $? -ne 0 ]; then
	printf "last cmd run correctly"
fi
