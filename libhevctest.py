#! /usr/bin/env python

import os
import sys
import shutil
import time, datetime 
import smtplib
import string
import subprocess
import threading

def checkTestdir(atestDir):
	if os.path.exists(atestDir):
		print('the testResult dir exists')
		if os.path.getsize(atestDir):
			shutil.rmtree(atestDir)
			os.mkdir(atestDir)
	else:
		os.mkdir(atestDir)

def createTestResult(atestLib, atestFile, atestResult, testNum):
	testCmd = 
	j = 0
	while j < testNum:
	print('this is the %d test' % loop)
	os.system(testCmd)
	j += 1
	pass


def calculateFps(atestDir, atestResult, testNum):
	if not os.path.isfile(atestResult):
		print('test result does not exist')
		return
	fpsNum = 0 
	f = open(atestResult)
	i = 0
	fpsLocation = 5
	resultTxt = f.readlines()[0:]
	while i < testNum:
		fpsNumLine = resultTxt[fpsLocation]
		fpsNum += float(fpsNumLine[fpsNumLine.rfind(':')+2 : ])
		check += 1
		fpsLocation += 6
		pass
	averageFps = fpsNum / (testNum - 1)
	print('fpsNum is %.2f' % averageFps)
	f.close()
	return 
	
		
libhevcTestCmdParas = [' ./test/decoder/hevctest -i', ' --arch', ' --num_cores 2 --soc GENERIC --num_frames -1 -s 0']
arcParas = [' X86_GENERIC', ' X86_SSSE3', ' X86_SSE4']
coreParas = [ 1, 2, 3, 4]
testFile = ' /home/snow/medias_for_verify/performance/2000F_1920x1080.265'
testResultName = 'result.txt'
testCmd = libhevcTestCmdParas[0] + testFile + libhevcTestCmdParas[2] + libhevcTestCmdParas[1] + arcParas[1] + ' >>' + testResultName
touchResultCmd = 'touch ' + testResultName
os.system(touchResultCmd)
f = open(testResultName)
loop = 1
testNum = 4
fpsNum = 0
averageFps = 0
fpsLocation = 5
check = 1
while loop < testNum:
	print('this is the %d test' % loop)
	os.system(testCmd)
	loop += 1
	pass
resultTxt = f.readlines()[0:]
while check < testNum:
	fpsNumLine = resultTxt[fpsLocation]
	fpsNum += float(fpsNumLine[fpsNumLine.rfind(':')+2 : ])
	check += 1
	fpsLocation += 6
	pass
averageFps = fpsNum / (testNum - 1)
print('fpsNum is %.2f' % averageFps)
print('finish')













