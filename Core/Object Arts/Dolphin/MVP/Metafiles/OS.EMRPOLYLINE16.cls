﻿"Filed out from Dolphin Smalltalk 7"!

OS.ENHMETARECORD subclass: #'OS.EMRPOLYLINE16'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {
		'_OffsetOf_apts' -> 16r1C.
		'_OffsetOf_cpts' -> 16r18.
		'_OffsetOf_rclBounds' -> 16r8
	}!
OS.EMRPOLYLINE16 guid: (Core.GUID fromString: '{89918c5e-59a5-4f2a-a8a0-61e552795224}')!
OS.EMRPOLYLINE16 comment: '<EMRPOLYLINE16> is an <ExternalStructure> class to wrap the struct ''Win32.EMRPOLYLINE16'' from type information in the ''Win32 API (ANSI). Derived from Bruce McKinney´s Hardcore Visual Basic Type Library'' library.

The type library contains no documentation for this struct

Warning: This comment was automatically generated from the struct''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.

IDL definition follows:

typedef [uuid(89918C5E-59A5-4F2A-A8A0-61E552795224)]
struct tagEMRPOLYLINE16 {
	EMR EMR;
	[helpstring("Inclusive-inclusive bounds in device units")] RECTL rclBounds;
	DWORD cpts;
	POINTS* apts;
} EMRPOLYLINE16;
'!
!OS.EMRPOLYLINE16 categoriesForClass!Win32-Structs! !
!OS.EMRPOLYLINE16 methodsFor!

apts
	"Answer the <StructureArray> value of the receiver's 'apts' field."

	^StructureArray
		fromAddress: bytes yourAddress + _OffsetOf_apts
		length: self cpts
		elementClass: POINTS!

apts: aStructureArrayOfPOINTS
	"Set the receiver's 'apts' field to the value of the argument, aStructureArrayOfPOINTS"

	| size |
	size := aStructureArrayOfPOINTS byteSize.
	aStructureArrayOfPOINTS
		replaceBytesOf: bytes
		from: ##(_OffsetOf_apts + 1)
		to: _OffsetOf_apts + size
		startingAt: 1.
	self cpts: aStructureArrayOfPOINTS size!

cpts
	"Answer the <Integer> value of the receiver's 'cpts' field."

	^bytes dwordAtOffset: _OffsetOf_cpts!

cpts: anInteger
	"Set the receiver's 'cpts' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_cpts put: anInteger!

rclBounds
	"Answer the <RECTL> value of the receiver's 'rclBounds' field."

	^RECTL fromAddress: bytes yourAddress + _OffsetOf_rclBounds!

rclBounds: aRECT
	"Set the receiver's 'rclBounds' field to the value of the argument, aRECT"

	aRECT
		replaceBytesOf: bytes
		from: ##(_OffsetOf_rclBounds + 1)
		to: ##(_OffsetOf_rclBounds + RECTL basicByteSize)
		startingAt: 1! !
!OS.EMRPOLYLINE16 categoriesFor: #apts!**compiled accessors**!public! !
!OS.EMRPOLYLINE16 categoriesFor: #apts:!**compiled accessors**!public! !
!OS.EMRPOLYLINE16 categoriesFor: #cpts!**compiled accessors**!public! !
!OS.EMRPOLYLINE16 categoriesFor: #cpts:!**compiled accessors**!public! !
!OS.EMRPOLYLINE16 categoriesFor: #rclBounds!**compiled accessors**!public! !
!OS.EMRPOLYLINE16 categoriesFor: #rclBounds:!**compiled accessors**!public! !

!OS.EMRPOLYLINE16 class methodsFor!

defineFields
	"Define the fields of the EMRPOLYLINE16 structure.

	EMRPOLYLINE16  compileDefinition

		typedef [uuid(89918C5E-59A5-4F2A-A8A0-61E552795224)]
		struct tagEMRPOLYLINE16 {
			EMR EMR;
			[helpstring('Inclusive-inclusive bounds in device units')] RECTL rclBounds;
			DWORD cpts;
			[size_is(cpts)]POINTS apts[];
		} EMRPOLYLINE16;
"

	super defineFields.
	self
		defineField: #rclBounds
			type: (StructureField type: RECTL)
			offset: 8;
		defineField: #cpts
			type: DWORDField new
			offset: 24;
		defineField: #apts
			type: (StructureArrayField type: POINTS lengthField: #cpts)
			offset: 28.
	self byteSize: 32!

getFieldNames
	^#(#iType #nSize #rclBounds #cpts #apts)!

iTypes
	"Answer the integer enhanced metafile record type id for this record class."

	^{EMR_POLYLINE16. EMR_POLYBEZIER16. EMR_POLYGON16. EMR_POLYBEZIERTO16. EMR_POLYLINETO16}! !
!OS.EMRPOLYLINE16 class categoriesFor: #defineFields!public!template definition! !
!OS.EMRPOLYLINE16 class categoriesFor: #getFieldNames!**compiled accessors**!constants!private! !
!OS.EMRPOLYLINE16 class categoriesFor: #iTypes!constants!public! !

