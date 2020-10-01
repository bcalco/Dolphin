"Filed out from Dolphin Smalltalk 7"!

UI.Tests.AbstractMultilineTextEditTest subclass: #'UI.Tests.MultilineTextEditTest'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
UI.Tests.MultilineTextEditTest guid: (Core.GUID fromString: '{2eedba10-3618-4267-9a38-179fd63152c0}')!
UI.Tests.MultilineTextEditTest comment: ''!
!UI.Tests.MultilineTextEditTest categoriesForClass!Unclassified! !
!UI.Tests.MultilineTextEditTest methodsFor!

classToTest
	^MultilineTextEdit!

margins
	^1 @ 1!

text
	"We have to work with UTF-16 for character position test as the control reports positions in UTF-16 code units, so that won't match with the character positions in a UTF-8 string"

	^super text asUtf16String! !
!UI.Tests.MultilineTextEditTest categoriesFor: #classToTest!helpers!private! !
!UI.Tests.MultilineTextEditTest categoriesFor: #margins!private!unit tests! !
!UI.Tests.MultilineTextEditTest categoriesFor: #text!constants!private! !

