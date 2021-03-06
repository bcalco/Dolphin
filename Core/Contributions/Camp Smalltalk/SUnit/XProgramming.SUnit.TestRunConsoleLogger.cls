﻿"Filed out from Dolphin Smalltalk 7"!

XProgramming.SUnit.TestRunLogger subclass: #'XProgramming.SUnit.TestRunConsoleLogger'
	instanceVariableNames: 'stream timings'
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
XProgramming.SUnit.TestRunConsoleLogger guid: (Core.GUID fromString: '{c279d11f-90f1-4fe3-bfa6-09a2d85a208e}')!
XProgramming.SUnit.TestRunConsoleLogger comment: ''!
!XProgramming.SUnit.TestRunConsoleLogger categoriesForClass!Kernel-Objects! !
!XProgramming.SUnit.TestRunConsoleLogger methodsFor!

finishedCase: aTestCaseResult
	stream
		nextPutAll: aTestCaseResult outcome asUppercase;
		nextPutAll: ' in ';
		display: aTestCaseResult duration;
		cr!

finishedRun: aTestResult knownSlowTests: aCollection
	| passed |
	passed := aTestResult hasPassed.
	stream
		nextPutAll: 'Test run ';
		nextPutAll: (passed ifTrue: ['PASSED'] ifFalse: ['FAILED']);
		nextPutAll: ' at';
		print: DateAndTime now;
		cr;
		display: aTestResult;
		cr.
	passed
		ifTrue: 
			[self
				summarizeTimings: aTestResult
				baseline: aCollection
				threshold: self slowTestThreshold]
		ifFalse: [self summarizeFailures: aTestResult].
	stream flush!

startingCase: aTestCase
	stream
		print: aTestCase;
		nextPutAll: ' ... ';
		flush!

startingRun: aTestSuite
	stream
		nextPutAll: 'Starting test run at';
		print: DateAndTime now;
		nextPutAll: ' in locale ';
		print: Locale default code;
		cr;
		flush!

stream: anObject
	stream := anObject!

summarizeFailures: aTestResult
	| failures errors |
	failures := aTestResult failures.
	failures notEmpty
		ifTrue: 
			[stream
				cr;
				nextPutAll: 'FAILURES:';
				cr.
			failures do: 
					[:each |
					stream
						print: each;
						cr]].
	errors := aTestResult errors.
	errors notEmpty
		ifTrue: 
			[stream
				cr;
				nextPutAll: 'ERRORS:';
				cr.
			errors do: 
					[:each |
					stream
						print: each;
						cr]]!

summarizeTimings: aTestResult baseline: aCollection threshold: aDuration
	| laggards newLaggards |
	laggards := (aTestResult results select: [:each | each duration >= aDuration])
				asSortedCollectionUsing: (SortAlgorithm mergeSort: [:a :b | a duration > b duration]).
	newLaggards := laggards reject: [:each | aCollection includes: each case].
	newLaggards size > 0 ifFalse: [^self].
	stream
		print: newLaggards size;
		nextPutAll: ' test(s) took '.
	aDuration displayOn: stream.
	stream
		nextPutAll: ' or more to run, not including ';
		print: aCollection size;
		nextPutAll: ' known laggards:';
		cr.
	newLaggards do: 
			[:each |
			stream tab.
			each duration displayOn: stream.
			stream
				tab;
				print: each case;
				cr]! !
!XProgramming.SUnit.TestRunConsoleLogger categoriesFor: #finishedCase:!logging!public! !
!XProgramming.SUnit.TestRunConsoleLogger categoriesFor: #finishedRun:knownSlowTests:!logging!public! !
!XProgramming.SUnit.TestRunConsoleLogger categoriesFor: #startingCase:!logging!public! !
!XProgramming.SUnit.TestRunConsoleLogger categoriesFor: #startingRun:!logging!public! !
!XProgramming.SUnit.TestRunConsoleLogger categoriesFor: #stream:!accessing!private! !
!XProgramming.SUnit.TestRunConsoleLogger categoriesFor: #summarizeFailures:!helpers!private! !
!XProgramming.SUnit.TestRunConsoleLogger categoriesFor: #summarizeTimings:baseline:threshold:!helpers!private! !

!XProgramming.SUnit.TestRunConsoleLogger class methodsFor!

on: aPuttableStream
	^(self new)
		stream: aPuttableStream;
		yourself! !
!XProgramming.SUnit.TestRunConsoleLogger class categoriesFor: #on:!public! !

