﻿"Filed out from Dolphin Smalltalk 7"!

OS.CCITEM subclass: #'OS.LVITEMW'
	instanceVariableNames: ''
	classVariableNames: 'CallbackPrototype'
	imports: #(#{OS.ListViewConstants})
	classInstanceVariableNames: ''
	classConstants: {
		'_OffsetOf_cchTextMax' -> 16r18.
		'_OffsetOf_cColumns' -> 16r2C.
		'_OffsetOf_dwState' -> 16rC.
		'_OffsetOf_iGroup' -> 16r38.
		'_OffsetOf_iGroupId' -> 16r28.
		'_OffsetOf_iImage' -> 16r1C.
		'_OffsetOf_iIndent' -> 16r24.
		'_OffsetOf_iItem' -> 16r4.
		'_OffsetOf_iSubItem' -> 16r8.
		'_OffsetOf_lParam' -> 16r20.
		'_OffsetOf_piColFmt' -> 16r34.
		'_OffsetOf_pszText' -> 16r14.
		'_OffsetOf_puColumns' -> 16r30.
		'_OffsetOf_stateMask' -> 16r10
	}!
OS.LVITEMW guid: (Core.GUID fromString: '{87b4c620-026e-11d3-9fd7-00a0cc3e4a32}')!
OS.LVITEMW comment: 'LVITEMW is an <ExternalStructure> class which represents the Windows common control structure of the same name.

LVITEMW is used to communicate information about the items (rows) in a List View control such as the text, icon, state, etc.

typedef [uuid(87b4c620-026e-11d3-9fd7-00a0cc3e4a32)]
struct tagLVITEMW {
	unsigned int mask;
	int iItem;
	int iSubItem;
	unsigned int State;
	unsigned int stateMask;
	[string] LPWSTR pszText;
	int cchTextMax;
	int iImage;
	LONG_PTR lParam;
	int iIndent;
	int iGroupId;
	unsigned int cColumns;
	[size_is(''cColumns'')] unsigned int* puColumns;
	[size_is(''cColumns'')] int* piColFmt;
	[readonly] int iGroup;
} LVITEMW;
'!
!OS.LVITEMW categoriesForClass!Win32-Structs! !
!OS.LVITEMW methodsFor!

allCallbacks
	bytes
		sdwordAtOffset: _OffsetOf_iImage put: I_IMAGECALLBACK;
		dwordAtOffset: _OffsetOf_pszText put: LPSTR_TEXTCALLBACK.
	self maskIn: ##(LVIF_TEXT | LVIF_IMAGE)!

cchTextMax
	"Answer the <Integer> value of the receiver's 'cchTextMax' field."

	^bytes sdwordAtOffset: _OffsetOf_cchTextMax!

cchTextMax: anInteger
	"Set the receiver's 'cchTextMax' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: _OffsetOf_cchTextMax put: anInteger!

cchTextMaxOffset
	^_OffsetOf_cchTextMax!

cColumns
	"Answer the <Integer> value of the receiver's 'cColumns' field."

	^bytes dwordAtOffset: _OffsetOf_cColumns!

cColumns: anInteger
	"Set the receiver's 'cColumns' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_cColumns put: anInteger!

column: colInteger 
	self iSubItem: colInteger - 1!

dwState
	"Answer the <Integer> value of the receiver's 'dwState' field."

	^bytes dwordAtOffset: _OffsetOf_dwState!

dwState: anInteger
	"Set the receiver's 'dwState' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_dwState put: anInteger!

handle
	"Answer the 'handle' of the item described by the receiver."

	^self iItem + 1!

iGroup
	"Answer the <Integer> value of the receiver's 'iGroup' field."

	^bytes sdwordAtOffset: _OffsetOf_iGroup!

iGroupId
	"Answer the <Integer> value of the receiver's 'iGroupId' field."

	^bytes sdwordAtOffset: _OffsetOf_iGroupId!

iGroupId: anInteger
	"Set the receiver's 'iGroupId' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: _OffsetOf_iGroupId put: anInteger!

iImage
	"Answer the <Integer> value of the receiver's 'iImage' field."

	^bytes sdwordAtOffset: _OffsetOf_iImage!

iImage: anInteger
	"Set the receiver's 'iImage' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: _OffsetOf_iImage put: anInteger!

iIndent
	"Answer the <Integer> value of the receiver's 'iIndent' field."

	^bytes sdwordAtOffset: _OffsetOf_iIndent!

iIndent: anInteger
	"Set the receiver's 'iIndent' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: _OffsetOf_iIndent put: anInteger!

iItem
	"Answer the <Integer> value of the receiver's 'iItem' field."

	^bytes sdwordAtOffset: _OffsetOf_iItem!

iItem: anInteger
	"Set the receiver's 'iItem' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: _OffsetOf_iItem put: anInteger!

indent: widths
	"Set the number of image widths to indent the item text."

	self iIndent: widths.
	self maskIn: LVIF_INDENT!

iStateImage
	^self dwState bitShift: -12!

iStateImage: anInteger
	"Set contents' state image index to anInteger. Any other state is discarded."

	self
		dwState: (anInteger bitShift: 12);
		stateMask: LVIS_STATEIMAGEMASK!

iSubItem
	"Answer the <Integer> value of the receiver's 'iSubItem' field."

	^bytes sdwordAtOffset: _OffsetOf_iSubItem!

iSubItem: anInteger
	"Set the receiver's 'iSubItem' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: _OffsetOf_iSubItem put: anInteger!

lParam
	"Answer the <Integer> value of the receiver's 'lParam' field."

	^bytes intPtrAtOffset: _OffsetOf_lParam!

lParam: anInteger
	"Set the receiver's 'lParam' field to the value of the argument, anInteger"

	bytes intPtrAtOffset: _OffsetOf_lParam put: anInteger!

piColFmt
	"Answer the <SDWORDArray> value of the receiver's 'piColFmt' field."

	^SDWORDArray fromAddress: (bytes intPtrAtOffset: _OffsetOf_piColFmt) length: self cColumns!

piColFmt: aSDWORDArray
	"Set the receiver's 'piColFmt' field to the value of the argument, aSDWORDArray"

	bytes uintPtrAtOffset: _OffsetOf_piColFmt put: aSDWORDArray yourAddress.
	self cColumns: aSDWORDArray size!

pszText
	"Answer the <Utf16String> value of the receiver's 'pszText' field."

	^Utf16String fromAddress: (bytes intPtrAtOffset: _OffsetOf_pszText)!

pszText: anUtf16String
	"Set the receiver's 'pszText' field to the value of the argument, anUtf16String"

	bytes uintPtrAtOffset: _OffsetOf_pszText put: anUtf16String yourAddress!

puColumns
	"Answer the <DWORDArray> value of the receiver's 'puColumns' field."

	^DWORDArray fromAddress: (bytes intPtrAtOffset: _OffsetOf_puColumns) length: self cColumns!

puColumns: aDWORDArray
	"Set the receiver's 'puColumns' field to the value of the argument, aDWORDArray"

	bytes uintPtrAtOffset: _OffsetOf_puColumns put: aDWORDArray yourAddress.
	self cColumns: aDWORDArray size!

row: rowInteger text: aString imageIndex: imageInteger indent: indentInteger
	| mask iImage |
	self
		iItem: rowInteger - 1;
		pszText: (text := aString asUtf16String).
	mask := LVIF_TEXT.
	iImage := imageInteger.
	indentInteger == 0
		ifFalse:
			[self iIndent: indentInteger.
			mask := mask bitOr: LVIF_INDENT.
			indentInteger < 0 ifTrue: [iImage := UI.ListView.NoImageIndex]].
	iImage
		ifNotNil: 
			[self iImage: iImage - 1.
			mask := mask bitOr: LVIF_IMAGE].
	self mask: mask!

row: rowInteger text: aString imageIndex: imageInteger indent: indentInteger stateImageIndex: stateImageInteger
	| mask iImage |
	self
		iItem: rowInteger - 1;
		pszText: (text := aString asUtf16String).
	mask := LVIF_TEXT.
	iImage := imageInteger.
	indentInteger == 0
		ifFalse: 
			[self iIndent: indentInteger.
			mask := mask bitOr: LVIF_INDENT.
			indentInteger < 0 ifTrue: [iImage := 0]].
	iImage
		ifNotNil: 
			[self iImage: iImage - 1.
			mask := mask bitOr: LVIF_IMAGE].
	self mask: mask!

stateImageIndex: anInteger
	"Set contents' state image index to anInteger. Any other state is discarded."

	self
		iStateImage: anInteger;
		maskIn: LVIF_STATE!

stateMask
	"Answer the <Integer> value of the receiver's 'stateMask' field."

	^bytes dwordAtOffset: _OffsetOf_stateMask!

stateMask: anInteger
	"Set the receiver's 'stateMask' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_stateMask put: anInteger!

textPointerOffset
	"Private - Answer the offset of the text pointer in the receiver. "

	^_OffsetOf_pszText! !
!OS.LVITEMW categoriesFor: #allCallbacks!accessing!public! !
!OS.LVITEMW categoriesFor: #cchTextMax!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #cchTextMax:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #cchTextMaxOffset!constants!private! !
!OS.LVITEMW categoriesFor: #cColumns!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #cColumns:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #column:!accessing!public! !
!OS.LVITEMW categoriesFor: #dwState!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #dwState:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #handle!accessing!public! !
!OS.LVITEMW categoriesFor: #iGroup!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #iGroupId!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #iGroupId:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #iImage!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #iImage:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #iIndent!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #iIndent:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #iItem!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #iItem:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #indent:!accessing!public! !
!OS.LVITEMW categoriesFor: #iStateImage!accessing!public! !
!OS.LVITEMW categoriesFor: #iStateImage:!accessing!public! !
!OS.LVITEMW categoriesFor: #iSubItem!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #iSubItem:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #lParam!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #lParam:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #piColFmt!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #piColFmt:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #pszText!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #pszText:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #puColumns!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #puColumns:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #row:text:imageIndex:indent:!accessing!private! !
!OS.LVITEMW categoriesFor: #row:text:imageIndex:indent:stateImageIndex:!accessing!private! !
!OS.LVITEMW categoriesFor: #stateImageIndex:!accessing!public! !
!OS.LVITEMW categoriesFor: #stateMask!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #stateMask:!**compiled accessors**!public! !
!OS.LVITEMW categoriesFor: #textPointerOffset!constants!private! !

!OS.LVITEMW class methodsFor!

allCallbacks
	^self basicNew
		bytes: CallbackPrototype shallowCopy;
		yourself!

defineFields
	"Define the fields of the LVITEMW structure.

	self compileDefinition

		typedef [uuid(87b4c620-026e-11d3-9fd7-00a0cc3e4a32)]
		struct tagLVITEMW {
			unsigned int mask;
			int iItem;
			int iSubItem;
			unsigned int State;
			unsigned int stateMask;
			[string] LPWSTR pszText;
			int cchTextMax;
			int iImage;
			LONG_PTR lParam;
			int iIndent;
			int iGroupId;
			unsigned int cColumns;
			[size_is('cColumns')] unsigned int* puColumns;
			[size_is('cColumns')] int* piColFmt;
			[readonly] int iGroup;
		} LVITEMW;
	"

	super defineFields.
	self
		defineField: #iItem
			type: SDWORDField new
			offset: 4;
		defineField: #iSubItem
			type: SDWORDField new
			offset: 8;
		defineField: #dwState
			type: DWORDField new
			offset: 12;
		defineField: #stateMask
			type: DWORDField new
			offset: 16;
		defineField: #pszText
			type: (PointerField type: Utf16String)
			offset: 20;
		defineField: #cchTextMax
			type: SDWORDField new
			offset: 24;
		defineField: #iImage
			type: SDWORDField new
			offset: 28;
		defineField: #lParam
			type: INT_PTRField new
			offset: 32;
		defineField: #iIndent
			type: SDWORDField new
			offset: 36;
		defineField: #iGroupId
			type: SDWORDField new
			offset: 40;
		defineField: #cColumns
			type: DWORDField new
			offset: 44;
		defineField: #puColumns
			type: (ArrayPointerField type: DWORDArray
					arrayLength: (ConformantArrayFieldLength lengthField: #cColumns))
			offset: 48;
		defineField: #piColFmt
			type: (ArrayPointerField type: SDWORDArray
					arrayLength: (ConformantArrayFieldLength lengthField: #cColumns))
			offset: 52;
		defineField: #iGroup
			type: SDWORDField new beReadOnly
			offset: 56.
	self byteSize: 60!

getFieldNames
	^#(#mask #iItem #iSubItem #dwState #stateMask #pszText #cchTextMax #iImage #lParam #iIndent #iGroupId #cColumns #puColumns #piColFmt #iGroup)!

initialize
	CallbackPrototype := self new allCallbacks; bytes! !
!OS.LVITEMW class categoriesFor: #allCallbacks!public! !
!OS.LVITEMW class categoriesFor: #defineFields!public!template definition! !
!OS.LVITEMW class categoriesFor: #getFieldNames!**compiled accessors**!constants!private! !
!OS.LVITEMW class categoriesFor: #initialize!development!public! !

