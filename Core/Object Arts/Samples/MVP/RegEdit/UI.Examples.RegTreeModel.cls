﻿"Filed out from Dolphin Smalltalk 7"!

UI.VirtualTreeModel subclass: #'UI.Examples.RegTreeModel'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
UI.Examples.RegTreeModel guid: (Core.GUID fromString: '{87b4c674-026e-11d3-9fd7-00a0cc3e4a32}')!
UI.Examples.RegTreeModel comment: 'RegTreeModel implements a <treeModel> representing the hierarchy of <RegKey>s in the Windows system registry. For an example of its use, see the RegEdit sample application.'!
!UI.Examples.RegTreeModel categoriesForClass!MVP-Models! !
!UI.Examples.RegTreeModel methodsFor!

approxSize
	"Private - Answer the approximate size of the receiver.
	Implementation Note: This does not have to be accurate, but it should be fast
	(i.e. don't calculate it by counting the receiver's elements)."

	^5000!

defaultGetChildrenBlock
	^[:each | each asSortedCollection: [:a :b | a name < b name]]!

defaultGetParentBlock
	^[:aRegKey | aRegKey parentKey]!

defaultHasChildrenBlock
	^[:aRegKey | aRegKey notEmpty]! !
!UI.Examples.RegTreeModel categoriesFor: #approxSize!accessing!private! !
!UI.Examples.RegTreeModel categoriesFor: #defaultGetChildrenBlock!initializing!private! !
!UI.Examples.RegTreeModel categoriesFor: #defaultGetParentBlock!initializing!private! !
!UI.Examples.RegTreeModel categoriesFor: #defaultHasChildrenBlock!initializing!private! !

!UI.Examples.RegTreeModel class methodsFor!

defaultSearchPolicy
	"Answer the <searchPolicy> used to compare and search for elements in the receiver's
	instances."

	"Implementation Note: As we are fronting an externally represented tree (i.e the Registry)
	the nodes are created to represent the external keys and values, and are not, therefore,
	identical."

	^SearchPolicy equality! !
!UI.Examples.RegTreeModel class categoriesFor: #defaultSearchPolicy!accessing!public! !

