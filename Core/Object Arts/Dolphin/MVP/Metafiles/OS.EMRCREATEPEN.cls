﻿"Filed out from Dolphin Smalltalk 7"!

OS.ENHMETARECORD subclass: #'OS.EMRCREATEPEN'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {
		'_OffsetOf_ihPen' -> 16r8.
		'_OffsetOf_lopn' -> 16rC
	}!
OS.EMRCREATEPEN guid: (Core.GUID fromString: '{f7e241d3-4c87-4409-a235-94cd95523c94}')!
OS.EMRCREATEPEN comment: '<EMRCREATEPEN> is an <ExternalStructure> class to wrap the struct ''Win32.EMRCREATEPEN'' from type information in the ''Win32 API (ANSI). Derived from Bruce McKinney´s Hardcore Visual Basic Type Library'' library.

The type library contains no documentation for this struct

Warning: This comment was automatically generated from the struct''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.

IDL definition follows:

typedef [uuid(F7E241D3-4C87-4409-A235-94CD95523C94)]
struct tagEMRCREATEPEN {
	EMR EMR;
	[helpstring("Pen handle index")] DWORD ihPen;
	LOGPEN lopn;
} EMRCREATEPEN;
'!
!OS.EMRCREATEPEN categoriesForClass!Win32-Structs! !
!OS.EMRCREATEPEN methodsFor!

ihPen
	"Answer the <Integer> value of the receiver's 'ihPen' field."

	^bytes dwordAtOffset: _OffsetOf_ihPen!

ihPen: anInteger
	"Set the receiver's 'ihPen' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_ihPen put: anInteger!

lopn
	"Answer the <LOGPEN> value of the receiver's 'lopn' field."

	^LOGPEN fromAddress: bytes yourAddress + _OffsetOf_lopn!

lopn: aLOGPEN
	"Set the receiver's 'lopn' field to the value of the argument, aLOGPEN"

	aLOGPEN
		replaceBytesOf: bytes
		from: ##(_OffsetOf_lopn + 1)
		to: ##(_OffsetOf_lopn + LOGPEN basicByteSize)
		startingAt: 1! !
!OS.EMRCREATEPEN categoriesFor: #ihPen!**compiled accessors**!public! !
!OS.EMRCREATEPEN categoriesFor: #ihPen:!**compiled accessors**!public! !
!OS.EMRCREATEPEN categoriesFor: #lopn!**compiled accessors**!public! !
!OS.EMRCREATEPEN categoriesFor: #lopn:!**compiled accessors**!public! !

!OS.EMRCREATEPEN class methodsFor!

defineFields
	"Define the fields of the EMRCREATEPEN structure.

	EMRCREATEPEN  compileDefinition

		typedef [uuid(F7E241D3-4C87-4409-A235-94CD95523C94)]
		struct tagEMRCREATEPEN {
			EMR EMR;
			[helpstring('Pen handle index')] DWORD ihPen;
			LOGPEN lopn;
		} EMRCREATEPEN;
"

	super defineFields.
	self
		defineField: #ihPen
			type: DWORDField new
			offset: 8;
		defineField: #lopn
			type: (StructureField type: LOGPEN)
			offset: 12.
	self byteSize: 28!

getFieldNames
	^#(#iType #nSize #ihPen #lopn)!

iTypes
	"Answer the integer enhanced metafile record type id for this record class."

	^{EMR_CREATEPEN}! !
!OS.EMRCREATEPEN class categoriesFor: #defineFields!**auto generated**!public!template definition! !
!OS.EMRCREATEPEN class categoriesFor: #getFieldNames!**compiled accessors**!constants!private! !
!OS.EMRCREATEPEN class categoriesFor: #iTypes!constants!public! !

