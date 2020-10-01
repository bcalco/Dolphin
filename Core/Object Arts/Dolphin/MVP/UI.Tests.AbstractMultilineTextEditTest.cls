"Filed out from Dolphin Smalltalk 7"!

UI.Tests.AbstractTextEditTest subclass: #'UI.Tests.AbstractMultilineTextEditTest'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
UI.Tests.AbstractMultilineTextEditTest guid: (Core.GUID fromString: '{8cec10d6-5d60-4f12-9a39-999fcc22b29d}')!
UI.Tests.AbstractMultilineTextEditTest isNonInstantiable: true!
UI.Tests.AbstractMultilineTextEditTest comment: ''!
!UI.Tests.AbstractMultilineTextEditTest categoriesForClass!Unclassified! !
!UI.Tests.AbstractMultilineTextEditTest methodsFor!

testPlainTextAtLine
	presenter text: ''.
	self assert: (presenter plainTextAtLine: 1) equals: ''.
	#(-1 0 2) do: [:i | self should: [presenter plainTextAtLine: i] raise: BoundsError].
	presenter text: 'a£b
c🐬d
'.
	self assert: (presenter plainTextAtLine: 1) equals: 'a£b'.
	self assert: (presenter plainTextAtLine: 2) equals: 'c🐬d'.
	self assert: (presenter plainTextAtLine: 3) equals: ''.
	#(-1 0 4 5) do: [:i | self should: [presenter plainTextAtLine: i] raise: BoundsError]!

text
	^Object comment copyWithout: Character tab! !
!UI.Tests.AbstractMultilineTextEditTest categoriesFor: #testPlainTextAtLine!public!unit tests! !
!UI.Tests.AbstractMultilineTextEditTest categoriesFor: #text!constants!private! !

