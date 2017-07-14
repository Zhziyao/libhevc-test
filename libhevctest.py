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


libhevc = False
libffmpeg = False
libmedia = False
testNum = 0
coreNum = ''
coreArc = ''
curDirPath = ''
hevcFpsNum = 0
ffmpegFpsNum = 0
msdkFpsNum = 0
libhevcTestParas = ['./hevcdecode -i', ' --arch X86_', ' --num_cores ',' --soc GENERIC --num_frames -1 -s 0']
libffmpegParas = ['ffmpeg -y -i ', 'decodetest/null.yuv']
libmsdkParas = 'sample_decode h265 -sw -i '
testSaveDir = 'decodetest'
testFile = ' cin.hevc '

#cmd process
def cmdProcess():
	global libhevc 
	global libffmpeg
	global libmedia 
	global testNum 
	global coreNum 
	global coreArc 
	parser = argparse.ArgumentParser()
	parser.add_argument("-lib", "--libfortest", choices = ['h', 'f', 'm','hf', 'hfm' ,'hfg'], required = True,
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
	if 'm' in args.libfortest:
		libmedia = True
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
	print libhevc 
	print libffmpeg 
	print libmedia
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
	if libmedia:
		print 'get in libmsdk'
		testCmd = libmsdkParas + testFile
		print testCmd
		k = 0
		while k < testNum:
			testResFile = 'decodetest/'+'msdkdecode' + str(k)+'.txt'
			print('this is the %d test of msdkdecode' % k)
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

#claculate fps of each lib
def calculateFps():
	global hevcFpsNum
	global ffmpegFpsNum
	global msdkFpsNum
	testSaveFiles = os.listdir('decodetest')
	#testSaveFiles = os.listdir('/home/snow/dpwu/libhevc-test/decodetest')
	x = 1
	m = 1
	z = 1
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
		elif 'msdkdecode' in file:
			f = open('decodetest/' + file)
			resultLines = f.readlines()
			fpsNumLine = resultLines[-2]
			begin = fpsNumLine.rfind(', fps:')+6
			msdkFpsNum += float(fpsNumLine[begin : begin + 8])
			f.close()
			print('the %dth loop average fps of mesdk is %.2f' % (z, msdkFpsNum / z))
			z += 1
#main
curDirPath = os.system('pwd')
cmdProcess()
checkTestdir(testSaveDir)
createTestResult()
calculateFps()
averageHevcFps = hevcFpsNum / testNum
averageFfmpegFps = ffmpegFpsNum / testNum 
averageMsdkFps = msdkFpsNum / testNum
print("\n")
print('HevcFps is %.2f' % averageHevcFps)
print('FfmpegFps is %.2f' % averageFfmpegFps)
print('MsdkFps is %.2f' % averageMsdkFps)













