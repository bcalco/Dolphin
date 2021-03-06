﻿"Filed out from Dolphin Smalltalk 7"!

Core.Tests.DolphinTest subclass: #'UI.Tests.ClipboardTest'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
UI.Tests.ClipboardTest guid: (Core.GUID fromString: '{ea86f353-088f-4e28-b4db-bdb8b09e5e82}')!
UI.Tests.ClipboardTest comment: ''!
!UI.Tests.ClipboardTest categoriesForClass!Unclassified! !
!UI.Tests.ClipboardTest methodsFor!

sampleAnsiString
	^Character byteCharacterSet copyFrom: 2!

sampleBitmap
	^Bitmap fromFile: 'Resources\Beach ball.bmp' usingLocator: FileLocator installRelative!

sampleDIBSection
	^Clipboard icon asMenuBitmap!

sampleRichText
	^RichText fromString: self sampleUnicodeString!

sampleUnicodeString
	^'aƒ1Библиотека🐬£€文字化け'!

setUp
	self skipUnless: [SessionManager current isUnattended not].
	Clipboard current empty!

tearDown
	Clipboard current empty!

testAnsiString
	| actual expected |
	expected := self sampleAnsiString.
	expected copyToClipboard.
	self assert: (Clipboard current isFormatAvailable: #String).
	self assert: (Clipboard current isFormatAvailable: #AnsiString).
	actual := Clipboard current getRegisteredFormat: #AnsiString ifNone: [''].
	self assert: actual isKindOf: AnsiString.
	self assert: actual equals: expected!

testAvailableFormatsBitmaps
	| actual |
	self sampleBitmap copyToClipboard.
	actual := Clipboard current availableFormats.
	"Windows can convert between device bitmaps and DIBSections, but the native format should be listed first"
	self assert: actual equals: #(#Bitmap #DIBSection).
	self sampleDIBSection copyToClipboard.
	actual := Clipboard current availableFormats.
	self assert: actual equals: #(#DIBSection #Bitmap)!

testAvailableFormatsStrings
	| actual |
	self sampleUnicodeString copyToClipboard.
	actual := Clipboard current availableFormats.
	"For strings, we will always get both unicode and ansi string formats because Windows will convert, but the native format should be first"
	self assert: actual equals: #(#String #AnsiString).
	self sampleAnsiString copyToClipboard.
	actual := Clipboard current availableFormats.
	self assert: actual equals: #(#AnsiString #String).
	"But Windows will not convert RTF to strings or vice versa"
	self sampleRichText copyToClipboard.
	actual := Clipboard current availableFormats.
	self assert: actual equals: #(#RichText)!

testBitmap
	| actual expected |
	expected := self sampleBitmap.
	expected copyToClipboard.
	self assert: (Clipboard current isFormatAvailable: #Bitmap).
	actual := Clipboard current getBitmap.
	self assert: actual isKindOf: Bitmap.
	self assert: actual asByteArray equals: expected asByteArray!

testDIBSection
	| actual expected |
	expected := self sampleDIBSection.
	expected copyToClipboard.
	self assert: (Clipboard current isFormatAvailable: #DIBSection).
	actual := Clipboard current getDIBSection.
	self assert: actual isKindOf: DIBSection.
	self assert: actual asByteArray equals: expected asByteArray!

testRichText
	| richText actual |
	richText := self sampleRichText.
	richText copyToClipboard.
	self assert: (Clipboard current isFormatAvailable: #RichText).
	self deny: (Clipboard current isFormatAvailable: #String).
	self deny: (Clipboard current isFormatAvailable: #AnsiString).
	actual := Clipboard current getRegisteredFormat: #RichText ifNone: [''].
	self assert: actual equals: richText.
	self assert: richText asString equals: self sampleUnicodeString!

testUtf16String
	| utf16 actual |
	utf16 := self sampleUnicodeString asUtf16String.
	utf16 copyToClipboard.
	self assert: (Clipboard current isFormatAvailable: #String).
	self assert: (Clipboard current isFormatAvailable: #AnsiString).
	actual := Clipboard current getText.
	self assert: actual equals: utf16!

testUtf8String
	| utf8 actual |
	utf8 := self sampleUnicodeString asUtf8String.
	utf8 copyToClipboard.
	self assert: (Clipboard current isFormatAvailable: #String).
	self assert: (Clipboard current isFormatAvailable: #AnsiString).
	"We'll get back UTF-16, but the content should be the same."
	actual := Clipboard current getText.
	self assert: actual equals: utf8! !
!UI.Tests.ClipboardTest categoriesFor: #sampleAnsiString!constants!private! !
!UI.Tests.ClipboardTest categoriesFor: #sampleBitmap!constants!private! !
!UI.Tests.ClipboardTest categoriesFor: #sampleDIBSection!constants!private! !
!UI.Tests.ClipboardTest categoriesFor: #sampleRichText!constants!private! !
!UI.Tests.ClipboardTest categoriesFor: #sampleUnicodeString!constants!private! !
!UI.Tests.ClipboardTest categoriesFor: #setUp!private!running! !
!UI.Tests.ClipboardTest categoriesFor: #tearDown!private!running! !
!UI.Tests.ClipboardTest categoriesFor: #testAnsiString!public!unit tests! !
!UI.Tests.ClipboardTest categoriesFor: #testAvailableFormatsBitmaps!public!unit tests! !
!UI.Tests.ClipboardTest categoriesFor: #testAvailableFormatsStrings!public!unit tests! !
!UI.Tests.ClipboardTest categoriesFor: #testBitmap!public!unit tests! !
!UI.Tests.ClipboardTest categoriesFor: #testDIBSection!public!unit tests! !
!UI.Tests.ClipboardTest categoriesFor: #testRichText!public!unit tests! !
!UI.Tests.ClipboardTest categoriesFor: #testUtf16String!public!unit tests! !
!UI.Tests.ClipboardTest categoriesFor: #testUtf8String!public!unit tests! !

