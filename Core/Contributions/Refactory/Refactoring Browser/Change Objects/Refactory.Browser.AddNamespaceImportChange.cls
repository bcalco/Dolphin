﻿"Filed out from Dolphin Smalltalk 7"!

Refactory.Browser.RefactoryVariableChange subclass: #'Refactory.Browser.AddNamespaceImportChange'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
Refactory.Browser.AddNamespaceImportChange guid: (Core.GUID fromString: '{48291ca4-180f-4a5e-b79e-409203e18930}')!
Refactory.Browser.AddNamespaceImportChange comment: ''!
!Refactory.Browser.AddNamespaceImportChange categoriesForClass!Refactory-Change Objects! !
!Refactory.Browser.AddNamespaceImportChange methodsFor!

asUndoOperation
	^RemoveNamespaceImportChange remove: variable from: self changeClass!

changeObject
	^variable asQualifiedReference!

changesFileTemplate
	^'<1p> <2s> <3s>'!

changeStringFormat
	^'Import <1s>, into <2s>'!

changeSymbol
	^#addImport:!

variable
	^variable asString!

variableName
	^variable asString! !
!Refactory.Browser.AddNamespaceImportChange categoriesFor: #asUndoOperation!converting!public! !
!Refactory.Browser.AddNamespaceImportChange categoriesFor: #changeObject!private! !
!Refactory.Browser.AddNamespaceImportChange categoriesFor: #changesFileTemplate!constants!private! !
!Refactory.Browser.AddNamespaceImportChange categoriesFor: #changeStringFormat!constants!printing!private! !
!Refactory.Browser.AddNamespaceImportChange categoriesFor: #changeSymbol!constants!private! !
!Refactory.Browser.AddNamespaceImportChange categoriesFor: #variable!private! !
!Refactory.Browser.AddNamespaceImportChange categoriesFor: #variableName!accessing!private! !

