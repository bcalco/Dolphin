﻿"Filed out from Dolphin Smalltalk 7"!

Kernel.Tests.AbstractBindingReferenceTest subclass: #'Kernel.Tests.MetaBindingReferenceTest'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
Kernel.Tests.MetaBindingReferenceTest guid: (Core.GUID fromString: '{fd978d4f-c029-4293-a636-297a14b7fa15}')!
Kernel.Tests.MetaBindingReferenceTest comment: ''!
!Kernel.Tests.MetaBindingReferenceTest categoriesForClass!Unclassified! !
!Kernel.Tests.MetaBindingReferenceTest methodsFor!

nameSuffix
	^' class'!

printStringTestCases
	^#(#(#(#Object) '#{Object class}') #(#('A' 'B' 'C') '#{A.B.C class}')  #(#('_' 'SUnit' 'TestCase') '#{_.SUnit.TestCase class}'))!

subjectClass
	^MetaBindingReference!

testEqualityOfMetaAndInstance
	"Meta and instance references should never be equal, whether or not the path is the same."

	self deny: #{Core.Object class} equals: #{Core.Object}.
	self deny: #{_.Object class} equals: #{_.Object}
!

testInstance
	| inst subject |
	inst := BindingReference pathString: 'Object'.
	subject := inst meta.
	self assert: subject instance identicalTo: inst!

testLessOrEqual
	| a b |
	super testLessOrEqual.
	a := self subjectClass pathString: 'Core.Object'.
	b := self subjectClass pathString: 'Core.object'.
	self deny: a <= b instance.
	self deny: a <= b instance!

testMeta
	| subject |
	subject := self subjectClass pathString: 'Object'.
	self assert: subject meta identicalTo: subject!

testRefersToLiteral
	| method |
	method := self class >> testSelector.
	"A BindingReference matches literals for the same path..."

	"self assert: (Object class fullyQualifiedReference refersToLiteral: (self subjectClass pathString: 'Object'))."

	".. and the binding to which it would resolve ..."

	self assert: (#{Object class} refersTo: Object binding asLiteralOf: method).
	"... but not the target value."
	self deny: (#{Object class} refersTo: #{Object class} value asLiteralOf: method)!

valueOfBinding: aVariableBinding
	^aVariableBinding value class! !
!Kernel.Tests.MetaBindingReferenceTest categoriesFor: #nameSuffix!constants!private! !
!Kernel.Tests.MetaBindingReferenceTest categoriesFor: #printStringTestCases!constants!private! !
!Kernel.Tests.MetaBindingReferenceTest categoriesFor: #subjectClass!constants!private! !
!Kernel.Tests.MetaBindingReferenceTest categoriesFor: #testEqualityOfMetaAndInstance!public!unit tests! !
!Kernel.Tests.MetaBindingReferenceTest categoriesFor: #testInstance!public!unit tests! !
!Kernel.Tests.MetaBindingReferenceTest categoriesFor: #testLessOrEqual!public!unit tests! !
!Kernel.Tests.MetaBindingReferenceTest categoriesFor: #testMeta!public!unit tests! !
!Kernel.Tests.MetaBindingReferenceTest categoriesFor: #testRefersToLiteral!public!unit tests! !
!Kernel.Tests.MetaBindingReferenceTest categoriesFor: #valueOfBinding:!helpers!private! !

