#!/usr/bin/python

#this program is used to compare libhevc , ffmpeg decode fps numbers with different paras.
#before each test, this program will remove the decodetest dir in the current dir.
#it will build a dir named decodetest and save the print message under decodetest dir.
#the programm parse args through argparse module.
#before you run this program ,please read the cmdProcess function carefully. 
#example cmd : python libhevctest.py -lib hf -loop 5


import os
import sys
import shutil
import string
import subprocess
import argparse

h264test = False
h265test = False
libhevc = False
libffmpeg = False
libmediasw = False
libmediahw = False
libmpeg2 = False
libavc = False
testNum = 0
coreNum = ''
coreArc = ''
curDirPath = ''
hevcFpsNum = 0
ffmpegFpsNum = 0
msdkswFpsNum = 0
msdkhwFpsNum = 0
avcFpsNum = 0
mpeg2FpsNum = 0
libhevcTestParas = ['./hevcdecode -i', ' --arch X86_', ' --num_cores ',' --soc GENERIC --num_frames -1 -s 0']
libavcTestParas = [ 'avcdecode -i', ' --arch X86_', ' --num_cores ',' --soc GENERIC --num_frames -1 -s 0']
libmpeg2TestParas = [ 'mpeg2decode -i' ' --arch X86_', ' --num_cores ',' --soc GENERIC --num_frames -1 -s 0']
libffmpegParas = ['ffmpeg -y -i ', 'decodetest/null.yuv']
libmsdkParas = ['sample_decode ', ' h265 ', ' h264 ', ' -sw -i ', ' -hw -i ']
testSaveDir = 'decodetest'
testFile = ' cin.hevc '

#cmd process
def cmdProcess():
	global libhevc 
	global libffmpeg
	global libmediasw 
	global libmediahw 
	global testNum 
	global coreNum 
	global coreArc 
	global libmpeg2 
	global libavc 
	global h264test
	global h265test
	parser = argparse.ArgumentParser()
	parser.add_argument("-lib", "--libfortest", required = True,
		help = "set the test libraries during the test")
	parser.add_argument("-loop", "--testloop", type = int, required = True,
		help = "set the loop number for the test ")
	parser.add_argument("-core", "--core_num", choices = ['1', '2', '4'], default = '2',
		help = "set the core number of libhevc")
	parser.add_argument("-arc", "--architecture", choices = ['GENERIC', 'SSSE3', 'SSE42'], default = 'SSSE3',
		help = "set the core arcitecture of libhevc")
	args = parser.parse_args()
	if 'h' in args.libfortest:
		libhevc = True
	if 'f' in args.libfortest:
		libffmpeg = True
	if 's' in args.libfortest:
		libmediasw = True
	if 'a' in args.libfortest:
		libavc = True
	if '2' in args.libfortest:
		libmpeg2 = True
	if 'w' in args.libfortest:
		libmediahw = True
	if '4' in args.libfortest:
		h264test = True
	if '5' in args.libfortest:
		h265test = True
	if args.testloop > 0:
		testNum = args.testloop
	if args.core_num:
		coreNum = args.core_num
	else:
		coreNum = default
	if args.architecture:
		coreArc = args.architecture
	else:
		coreArc = default
	pass

#check: if test dir exists, remove the dir. and else build a new one 
def checkTestdir(atestDir):
	if os.path.exists(atestDir):
		print('the testResult dir exists')
		print('remove the testResult dir and build a new one')
		if os.path.getsize(atestDir):
			shutil.rmtree(atestDir)
			os.mkdir(atestDir)
			os.system('ln -s /dev/null ' + 'decodetest/null.yuv')
	else:
		os.mkdir(atestDir)
		os.system('ln -s /dev/null ' + atestDir + '/null.yuv')

#create test result files for each lib
def createTestResult():
	if libhevc:
		testCmd = libhevcTestParas[0] + testFile + libhevcTestParas[1] + coreArc + libhevcTestParas[2] + coreNum + libhevcTestParas[3]
		print testCmd
		j = 0
		while j < testNum:
			testResFile = 'decodetest/'+'hevcdecode' + str(j)+'.txt'
			print('this is the %d test of libhevc' % j)
			os.system('touch '+testResFile)
			r = subprocess.Popen(testCmd, stdout=subprocess.PIPE, stderr = subprocess.PIPE,shell = True)
			(outputdata ,errdata)= r.communicate()
			f = open( testResFile, 'w')
			f.write(outputdata)
			f.close()
			j += 1
	if libmediasw:
		print 'get in libmsdk'
		if h265test:
			testCmd = libmsdkParas[0] + libmsdkParas[1] + libmsdkParas[3] + testFile
		elif h264test:
			testCmd = libmsdkParas[0] + libmsdkParas[2] + libmsdkParas[3] + testFile
		print testCmd
		k = 0
		while k < testNum:
			testResFile = 'decodetest/'+'msdkdecodesw' + str(k)+'.txt'
			print('this is the %d test of msdkdecodesw' % k)
			os.system('touch '+testResFile)
			r = subprocess.Popen(testCmd, stdout=subprocess.PIPE, stderr = subprocess.PIPE, shell = True)
			(outputdata ,errdata)= r.communicate()
			f = open( testResFile, 'w')
			f.write(outputdata)
			f.close()
			k += 1
	if libmediahw:
		print 'get in libmsdk'
		if h265test:
			testCmd = libmsdkParas[0] + libmsdkParas[1] + libmsdkParas[4] + testFile
		elif h264test:
			testCmd = libmsdkParas[0] + libmsdkParas[2] + libmsdkParas[4] + testFile
		print testCmd
		k = 0
		while k < testNum:
			testResFile = 'decodetest/'+'msdkdecodehw' + str(k)+'.txt'
			print('this is the %d test of msdkdecodehw' % k)
			os.system('touch '+testResFile)
			r = subprocess.Popen(testCmd, stdout=subprocess.PIPE, stderr = subprocess.PIPE, shell = True)
			(outputdata ,errdata)= r.communicate()
			f = open( testResFile, 'w')
			f.write(outputdata)
			f.close()
			k += 1
	if libffmpeg:
		testCmd = libffmpegParas[0] + testFile + libffmpegParas[1]
		print testCmd
		i = 0
		while i < testNum:
			testResFile = 'decodetest/'+'ffmpegdecode' + str(i)+'.txt'
			print('this is the %d test of ffmpeg' % i)
			os.system('touch '+testResFile)
			r = subprocess.Popen(testCmd, stdout=subprocess.PIPE, stderr = subprocess.PIPE, shell = True)
			(outputdata ,errdata)= r.communicate()
			f = open( testResFile, 'w')
			f.write(errdata)
			f.close()
			i += 1
	if libmpeg2:
		testCmd = libmpeg2TestParas[0] + testFile + libmpeg2TestParas[1] + coreArc + libmpeg2TestParas[2] + coreNum + libmpeg2TestParas[3]
		print testCmd
		mj = 0
		while mj < testNum:
			testResFile = 'decodetest/'+'mpeg2decode' + str(j)+'.txt'
			print('this is the %d test of libmpeg2' % mj)
			os.system('touch '+testResFile)
			r = subprocess.Popen(testCmd, stdout=subprocess.PIPE, stderr = subprocess.PIPE,shell = True)
			(outputdata ,errdata)= r.communicate()
			f = open( testResFile, 'w')
			f.write(outputdata)
			f.close()
			mj += 1
	if libavc:
		testCmd = libavcTestParas[0] + testFile + libavcTestParas[1] + coreArc + libavcTestParas[2] + coreNum + libavcTestParas[3]
		print testCmd
		aj = 0
		while aj < testNum:
			testResFile = 'decodetest/'+'avcdecode' + str(j)+'.txt'
			print('this is the %d test of libavc' % aj)
			os.system('touch '+testResFile)
			r = subprocess.Popen(testCmd, stdout=subprocess.PIPE, stderr = subprocess.PIPE,shell = True)
			(outputdata ,errdata)= r.communicate()
			f = open( testResFile, 'w')
			f.write(outputdata)
			f.close()
			aj += 1

#claculate fps of each lib
def calculateFps():
	global hevcFpsNum
	global ffmpegFpsNum
	global msdkswFpsNum
	global msdkhwFpsNum
	global avcFpsNum
	global mpeg2FpsNum
	testSaveFiles = os.listdir('decodetest')
	#testSaveFiles = os.listdir('/home/snow/dpwu/libhevc-test/decodetest')
	x = 1
	m = 1
	z = 1
	ax = 1
	m2 = 1
	hz = 1
	for file in testSaveFiles :
		if 'hevcdecode' in file :
			f = open('decodetest/' + file)
			resultLines = f.readlines()
			fpsNumLine = resultLines[-1]
			hevcFpsNum += float(fpsNumLine[fpsNumLine.find(':')+2 : ])
			f.close()
			print('the %dth loop avergae fps of hevc is %.2f' % (x, hevcFpsNum / x))
			x += 1
		elif 'ffmpegdecode' in file:
			f = open('decodetest/' + file)
			resultLines = f.readlines()
			fpsNumLine = resultLines[-2]
			begin = fpsNumLine.rfind('fps=')+4
			ffmpegFpsNum += float(fpsNumLine[begin : begin + 3])
			f.close()
			print('the %dth loop average fps of ffmpeg is %.2f' % (m, ffmpegFpsNum / m))
			m += 1
		elif 'msdkdecodesw' in file:
			f = open('decodetest/' + file)
			resultLines = f.readlines()
			fpsNumLine = resultLines[-2]
			begin = fpsNumLine.rfind(', fps:')+6
			msdkswFpsNum += float(fpsNumLine[begin : begin + 7])
			f.close()
			print('the %dth loop average fps of mesdksw is %.2f' % (z, msdkswFpsNum / z))
			z += 1
		elif 'msdkdecodehw' in file:
			f = open('decodetest/' + file)
			resultLines = f.readlines()
			fpsNumLine = resultLines[-2]
			begin = fpsNumLine.rfind(', fps:')+6
			msdkhwFpsNum += float(fpsNumLine[begin : begin + 7])
			f.close()
			print('the %dth loop average fps of mesdkhw is %.2f' % (z, msdkhwFpsNum / hz))
			hz += 1
		elif 'avcdecode' in file :
			f = open('decodetest/' + file)
			resultLines = f.readlines()
			fpsNumLine = resultLines[-1]
			avcFpsNum += float(fpsNumLine[fpsNumLine.find(':')+2 : ])
			f.close()
			print('the %dth loop avergae fps of hevc is %.2f' % (x, hevcFpsNum / ax))
			ax += 1
		elif 'mpeg2decode' in file :
			f = open('decodetest/' + file)
			resultLines = f.readlines()
			fpsNumLine = resultLines[-1]
			mpeg2FpsNum += float(fpsNumLine[fpsNumLine.find(':')+2 : ])
			f.close()
			print('the %dth loop avergae fps of hevc is %.2f' % (x, hevcFpsNum / m2))
			m2 += 1
#main
curDirPath = os.system('pwd')
cmdProcess()
checkTestdir(testSaveDir)
createTestResult()
calculateFps()

averageHevcFps = hevcFpsNum / testNum
averageFfmpegFps = ffmpegFpsNum / testNum 
averageMsdkswFps = msdkswFpsNum / testNum
averageMsdkhwFps = msdkhwFpsNum / testNum
averageAvcFps = avcFpsNum / testNum
averageMpeg2Fps = mpeg2FpsNum / testNum

print("\n")
print('HevcFps is %.2f' % averageHevcFps)
print('FfmpegFps is %.2f' % averageFfmpegFps)
print('MsdkswFps is %.2f' % averageMsdkswFps)
print('MsdkhwFps is %.2f' % averageMsdkhwFps)
print('AvcFps is %.2f' % averageAvcFps)
print('Mpeg2Fps is %.2f' % averageMpeg2Fps)












