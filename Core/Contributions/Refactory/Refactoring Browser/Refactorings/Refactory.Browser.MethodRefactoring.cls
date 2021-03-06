﻿"Filed out from Dolphin Smalltalk 7"!

Refactory.Browser.Refactoring subclass: #'Refactory.Browser.MethodRefactoring'
	instanceVariableNames: 'class'
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
Refactory.Browser.MethodRefactoring guid: (Core.GUID fromString: '{f93954e7-217f-4070-b44d-b7d1f1bc74d3}')!
Refactory.Browser.MethodRefactoring comment: ''!
!Refactory.Browser.MethodRefactoring categoriesForClass!Refactory-Refactorings! !
!Refactory.Browser.MethodRefactoring methodsFor!

buildSelectorString: aSelector
	aSelector argumentCount = 0 ifTrue: [^aSelector].
	^self buildSelectorString: aSelector
		withPermuteMap: (1 to: aSelector argumentCount)!

buildSelectorString: aSelector withPermuteMap: anIntegerCollection
	| stream keywords |
	aSelector argumentCount == 0 ifTrue: [^aSelector asString].
	stream := WriteStream on: String new.
	keywords := aSelector keywords.
	keywords with: anIntegerCollection
		do: 
			[:each :i |
			stream
				nextPutAll: each;
				nextPutAll: ' ``@arg';
				print: i;
				nextPut: $\x20].
	^stream contents! !
!Refactory.Browser.MethodRefactoring categoriesFor: #buildSelectorString:!private! !
!Refactory.Browser.MethodRefactoring categoriesFor: #buildSelectorString:withPermuteMap:!private! !

