﻿"Filed out from Dolphin Smalltalk 7"!

Graphics.VirtualColor subclass: #'Graphics.PluggableColor'
	instanceVariableNames: 'valuable'
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
Graphics.PluggableColor guid: (Core.GUID fromString: '{74b2076a-a07a-4203-aa78-b3fc0ad65e7c}')!
Graphics.PluggableColor comment: '`PluggableColor` is the class of `Color`s that dynamically determine their actual `Color` value by evaluating a `<niladicValuable>`.

## Instance Variables:
  `valuable`		`<niladicValuable>` evaluated to determine the actual colour to use each time it is required.

'!
!Graphics.PluggableColor categoriesForClass!Drawing! !
!Graphics.PluggableColor methodsFor!

actualColor
	^valuable value actualColor!

printOn: aPuttableStream
	self basicPrintOn: aPuttableStream!

setValuable: aNiladicValuable 
	valuable := aNiladicValuable!

stbSaveOn: anSTBOutFiler
	"Override back to default implementation"

	anSTBOutFiler saveObject: self! !
!Graphics.PluggableColor categoriesFor: #actualColor!private!testing! !
!Graphics.PluggableColor categoriesFor: #printOn:!printing!public! !
!Graphics.PluggableColor categoriesFor: #setValuable:!initializing!private! !
!Graphics.PluggableColor categoriesFor: #stbSaveOn:!binary filing!public! !

!Graphics.PluggableColor class methodsFor!

stbReadFrom: anSTBInFiler format: anSTBClassConversion 
	"Override back to default implementation"

	^anSTBInFiler readObjectOfClass: self format: anSTBClassConversion!

with: aNiladicValuable 
	<primitive: 157>
	^self basicNew setValuable: aNiladicValuable! !
!Graphics.PluggableColor class categoriesFor: #stbReadFrom:format:!binary filing!public! !
!Graphics.PluggableColor class categoriesFor: #with:!instance creation!public! !

