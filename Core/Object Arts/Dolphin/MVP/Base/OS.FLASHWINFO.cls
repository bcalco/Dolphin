﻿"Filed out from Dolphin Smalltalk 7"!

OS.Win32Structure subclass: #'OS.FLASHWINFO'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {
		'_OffsetOf_dwFlags' -> 16r8.
		'_OffsetOf_dwSize' -> 16r0.
		'_OffsetOf_dwTimeout' -> 16r10.
		'_OffsetOf_hwnd' -> 16r4.
		'_OffsetOf_uCount' -> 16rC
	}!
OS.FLASHWINFO guid: (Core.GUID fromString: '{2a5e4594-f531-486b-a082-17686b820cd4}')!
OS.FLASHWINFO comment: 'FLASHWINFO is the class of <ExternalStructure> which represent the Win32 structure of the same name.

FLASHWINFO is used to pass parameters to the FlashWindowEx() API call.

Instance Variables:
	None'!
!OS.FLASHWINFO categoriesForClass!External-Data-Structured-Win32! !
!OS.FLASHWINFO methodsFor!

dwFlags
	"Answer the <Integer> value of the receiver's 'dwFlags' field."

	^bytes dwordAtOffset: _OffsetOf_dwFlags!

dwFlags: anInteger
	"Set the receiver's 'dwFlags' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_dwFlags put: anInteger!

dwSize: anInteger
	"Set the receiver's 'dwSize' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_dwSize put: anInteger!

dwTimeout: anInteger
	"Set the receiver's 'dwTimeout' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_dwTimeout put: anInteger!

hwnd: anExternalHandle
	"Set the receiver's 'hwnd' field to the value of the argument, anExternalHandle"

	bytes uintPtrAtOffset: _OffsetOf_hwnd put: anExternalHandle!

uCount: anInteger
	"Set the receiver's 'uCount' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_uCount put: anInteger! !
!OS.FLASHWINFO categoriesFor: #dwFlags!**compiled accessors**!public! !
!OS.FLASHWINFO categoriesFor: #dwFlags:!**compiled accessors**!public! !
!OS.FLASHWINFO categoriesFor: #dwSize:!**compiled accessors**!public! !
!OS.FLASHWINFO categoriesFor: #dwTimeout:!**compiled accessors**!public! !
!OS.FLASHWINFO categoriesFor: #hwnd:!**compiled accessors**!public! !
!OS.FLASHWINFO categoriesFor: #uCount:!**compiled accessors**!public! !

!OS.FLASHWINFO class methodsFor!

defineFields
	"Define the fields of the Win32 FLASHWINFO structure.

		self compileDefinition

		typedef struct {
			UINT  cbSize;
			HWND  hwnd;
			DWORD dwFlags;
			UINT  uCount;
			DWORD dwTimeout;
		} FLASHWINFO;
	"

	self
		defineField: #dwSize type: DWORDField writeOnly beOverride;
		defineField: #hwnd type: HANDLEField writeOnly;
		defineField: #dwFlags type: DWORDField new;
		defineField: #uCount type: DWORDField writeOnly;
		defineField: #dwTimeout type: DWORDField writeOnly!

getFieldNames
	^#(#dwSize #hwnd #dwFlags #uCount #dwTimeout)! !
!OS.FLASHWINFO class categoriesFor: #defineFields!public!template definition! !
!OS.FLASHWINFO class categoriesFor: #getFieldNames!**compiled accessors**!constants!private! !

