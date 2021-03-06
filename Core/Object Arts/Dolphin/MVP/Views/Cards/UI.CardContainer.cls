﻿"Filed out from Dolphin Smalltalk 7"!

UI.AbstractCardContainer subclass: #'UI.CardContainer'
	instanceVariableNames: 'tabs'
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
UI.CardContainer guid: (Core.GUID fromString: '{87b4c71c-026e-11d3-9fd7-00a0cc3e4a32}')!
UI.CardContainer comment: 'A CardContainer is a <cardView> that allows each of its cards (sub-views) to appear with named tabs. The tab names are specified by the #arrangement aspects of the sub-views and appear in the z-order maintained by the container. The CardContainer uses a TabView to provide the name tabs.

Typically a CardContainer will be used for tab-style property pages within a dialog. For another example, the Categories/Protocols/Variables pane in the Class Hierarchy Browser is implemented using a CardContainer.

Instance Variables:
	tabs	<TabView> holding the name tabs.

'!
!UI.CardContainer categoriesForClass!MVP-Views! !
!UI.CardContainer methodsFor!

arrangementOf: aView put: anObject 
	"Set the arrangement parameter for aView in the receiver layout manager 
	to be anObject. Usually anObject will be a String to be used to identify
	the card. This is also added to the tab view associated with the receiver."

	| existingTab |
	existingTab := aView arrangement.
	super arrangementOf: aView put: anObject.
	(tabs model includes: existingTab) 
		ifTrue: 
			["If the view has already an arrangement, just do an update of the tab 
			instead of removing it and adding it. This will keep the tabs in order"
			| index |
			index := tabs model identityIndexOf: existingTab.
			tabs model at: index put: anObject]
		ifFalse: [tabs model add: anObject]!

backcolor: aColorOrNil 
	"Sets the background colour of the receiver to aColorOrNil.
	If aColorOrNil is nil then use the default color"

	backcolor := aColorOrNil.
	tabs backcolor: aColorOrNil!

createTabs
	"Private - Add a <TabView> as a non-managed sub view of the receiver"

	tabs notNil ifTrue: [^self].
	tabs := self newTabs.
	tabs isManaged: false.
	self basicAddSubView: tabs.
	tabs backcolor: nil!

defaultBackcolor
	^Color face3d!

defaultViewClass
	^TabViewXP!

ensureTabsAtBack
	"Private - Force the associated tab view to be behind all our managed subviews so that it
	does not obscure them. We must do this silently without causing an #onZOrderChanged."

	self hasOwnTabs 
		ifTrue: 
			[tabs 
				setWindowPosAfter: HWND_BOTTOM
				x: 0
				y: 0
				width: 0
				height: 0
				flags: ##(SWP_NOSIZE | SWP_NOMOVE)]!

getImageBlock
	"Answer the block to use to find out the image index of an object that will
	be placed displayed in the TabView associated with the receiver."

	^tabs getImageBlock!

getImageBlock: aOneArgBlock 
	"Set the block to use to find out the image index of an object that will
	be placed in the TabView associated with the receiver"

	tabs getImageBlock: aOneArgBlock!

getTextBlock
	"Answer the block to use to find out the text of an object that will
	be placed displayed in the TabView associated with the receiver."

	^tabs getTextBlock!

getTextBlock: aOneArgBlock 
	"Set the block to use to find out the text of an object that will
	be placed in the TabView associated with the receiver"

	tabs getTextBlock: aOneArgBlock!

hasButtons
	"Answer whether the receiver has the buttons instead of tabs."

	^tabs hasButtons!

hasButtons: aBoolean 
	"Set whether or not the receiver has buttons instead of tabs."

	^tabs hasButtons: aBoolean!

hasHotTracking
	"Answer whether the receiver has the hot-tracking style whereby tabs that are hovered over are automatically selected."

	^tabs hasHotTracking!

hasHotTracking: aBoolean 
	"Sets the receiver to hot-track the selection or not depending on the value of aBoolean."

	tabs hasHotTracking: aBoolean!

hasOwnTabs
	"Answer whether the tabs associated with the receiver are owned by the receiver. This will
	normally be the case, unless embedded in a SlidingCardContainer that supplies the tabs."

	^tabs parentView == self!

implicitInsets: aLayoutContext
	"Private - Answer a <Rectangle> whose edges specify the implicit distance (in pixels) by
	which the sub views have to be inset from the border of the receiver."

	"Implementation Note: We must calculate this to allow space for the TabView's decoration
	(the tabs themselves, borders, etc)."

	| rect clientRect |
	self hasOwnTabs ifFalse: [^Rectangle new].
	rect := aLayoutContext rectangleOf: tabs.
	clientRect := tabs calcClientRectangleFromRectangle: rect.
	^rect insetBy: clientRect!

isDropTarget: aBoolean 
	tabs isDropTarget: aBoolean.
	^super isDropTarget: aBoolean!

isInverted
	"Answer whether the receiver is in one of the 'inverted' orientations (that is with tabs to bottom or the right)."

	^tabs isInverted!

isInverted: aBoolean
	Notification deprecated.	"D6: Use #tabOrientation:"
	^tabs isInverted: aBoolean!

isMultiline
	"Answers whether the receiver can display multiple lines of tabs."

	^tabs isMultiline!

isMultiline: aBoolean 
	"Set whether the receiver can display multiple lines of tabs."

	tabs isMultiline: aBoolean!

isTabStop
	"Answers whether the receiver is a tab stop."

	^tabs isTabStop!

isTabStop: aBoolean 
	"Set whether or not the receiver is a tab stop."

	^tabs isTabStop: aBoolean!

isVertical
	"Answer whether the receiver has a vertical orientation (i.e. with tabs to right or left, rather than top or bottom)."

	^tabs isVertical!

isVertical: aBoolean
	Notification deprecated.	"D6: Use #tabOrientation:"
	^tabs isVertical: aBoolean!

layout: aLayoutContext 
	"Private - Recalculate the geometry of the receiver. Force the tab view to be the same size
	as the receiver, then ask for the standard layout to continue."

	self hasOwnTabs 
		ifTrue: [aLayoutContext setView: tabs rectangle: (0 @ 0 extent: (aLayoutContext extentOf: self))].
	super layout: aLayoutContext!

newTabs
	^self defaultViewClass new!

onCurrentCardChanged
	"Private - The current card has been changed in the layout manager. 
	Select the appropriate tab in the receiver to reflect this, and trigger
	our own card change event."

	tabs selection: self cardLayout currentCard arrangement.
	super onCurrentCardChanged!

onEraseRequired: aColorEvent 
	"Handler for erase background event- erase to the background colour,
	or answer nil if no colour is set to accept the default window processing."

	"CardContainers are completely covered by their unmanaged TabView child."

	^true!

onSubViewAdded: aView
	"Private - Received when aView has been added to the receiver. Ensure that the associated
	tab view is sent to the back"

	self ensureTabsAtBack.
	super onSubViewAdded: aView.
!

onTabChanged
	"Private - A tab has been selected by the user. 
	Ask our layout manager to show the appropriate view"

	| tabName |
	tabName := tabs selectionIfNone: [^self].
	self cardLayout showCardWithArrangement: tabName.

	"Note: Without the followng focus shift, Windows can loop endlessly if the receiver gains 
	focus and a key is typed."
	self hasFocusDeeply ifTrue: [self tabOntoCurrentCard]!

onTabChanging: booleanValue
	"Private - A tab has been selected by the user."

	self trigger: #currentCardChanging: with: booleanValue!

onViewCreated
	super onViewCreated.
	self createTabs.
	tabs
		when: #selectionChanging:
			send: #onTabChanging:
			to: self;
		when: #selectionChanged
			send: #onTabChanged
			to: self!

onZOrderChanged
	"Private - Received when the ZOrder of the receiver's subview has been changed.
	Rebuild the assocaited tab view to reflect the new ordering"

	super onZOrderChanged.
	self ensureTabsAtBack.
	self refreshTabs



	!

preTranslateKeyboardInput: aMSG 
	"Answer whether the receiver would like to consume the argument aMSG,
	which is a keyboard message."

	^tabs preTranslateKeyboardInput: aMSG!

queryCommand: aCommandQuery 
	"Update aCommandQuery to indicates how a command would be processed.
	if sent to the receiver. Answers whether the receiver recognised the command
	as one of its own (this may be ignored by the command router). This need not
	be supersent if the #isEnabled: is sent to the <CommandQuery> to explicitly
	enable or disable a particular command."

	| cmd |
	cmd := aCommandQuery commandSymbol.
	#viewMode: == cmd 
		ifTrue: [aCommandQuery isChecked: self viewMode == aCommandQuery command arguments first].
	#tabOrientation: == cmd 
		ifTrue: [aCommandQuery isChecked: self tabOrientation == aCommandQuery command arguments first].
	^super queryCommand: aCommandQuery!

refreshTabs
	"Rebuild the associated tab view to include all the managed subviews
	of the receiver in the correct z order sequence"

	| currentCard arrangements layout |
	layout := self cardLayout.
	currentCard := layout currentCard.
	arrangements := self cards collect: [:each | each arrangement].
	tabs model list: arrangements.
	currentCard ifNotNil: [layout showCard: currentCard]!

removeSubView: aView 
	"Removes aView as a subview of the receiver. First remove
	any associated tab. If aView is indeed a subview of the receiver then it is destroyed. If not,
	it continues to live."

	| arrangement |
	arrangement := self arrangementOf: aView.
	tabs model remove: arrangement ifAbsent: [].
	super removeSubView: aView!

tabOrientation
	"Answer a <Symbol> naming the orientation of the receiver. This primarily controls where the
	tab strip is displayed and is one of #left, #right, #top (the default) or #bottom."

	^tabs tabOrientation!

tabOrientation: aSymbol 
	"Set the orientation of the receiver. This primarily controls where the tab strip is
	displayed. The <Symbol> argument can be one of #left, #right, #top (the default) or
	#bottom."

	tabs tabOrientation: aSymbol!

tabs
	^tabs!

updateTabs
	"Update the tabs to reflect change in text/icon etc. We assume the arrangement object identity has not changed; if it
	has then #refreshTabs is more appropriate."

	tabs updateAll!

viewMode
	"Answer the view mode of the TabView associated with the receiver.
	This can be one of:
		#noIcons
		#smallIcons
		#largeIcons"

	^tabs viewMode!

viewMode: aSymbol 
	"Sets the view mode of the TabView associated with the reciver to aSymbol.
	This can be one of:
		#noIcons
		#smallIcons
		#largeIcons"

	tabs viewMode: aSymbol!

wmPrint: message wParam: wParam lParam: lParam
	"Private - Handle WM_PRINT."

	"Implementation Note: For some reason the DefWindowProc implementation seems to paint the
	TabView over the top of the current card (even though at the back in the z-order), so we
	need to take control."

	| result canvas insetRect prev card |
	self ensureLayoutValid.
	result := self
				defaultWindowProcessing: message
				wParam: wParam
				lParam: lParam.
	card := self currentCard.
	(card isNil or: [lParam noMask: PRF_CHILDREN]) ifTrue: [^result].
	insetRect := self actualInsets: (LayoutContext forContainer: self parentView).
	canvas := Canvas withNonOwnedDC: wParam.
	prev := canvas offsetWindowOrigin: (insetRect topLeft + (0 @ 0)) * -1.
	card
		sendMessage: message
		wParam: wParam
		lParam: lParam.
	canvas windowOrigin: prev.
	^result! !
!UI.CardContainer categoriesFor: #arrangementOf:put:!accessing!public! !
!UI.CardContainer categoriesFor: #backcolor:!accessing!public! !
!UI.CardContainer categoriesFor: #createTabs!helpers!private! !
!UI.CardContainer categoriesFor: #defaultBackcolor!public! !
!UI.CardContainer categoriesFor: #defaultViewClass!constants!public! !
!UI.CardContainer categoriesFor: #ensureTabsAtBack!operations!private! !
!UI.CardContainer categoriesFor: #getImageBlock!adapters!public! !
!UI.CardContainer categoriesFor: #getImageBlock:!adapters!public! !
!UI.CardContainer categoriesFor: #getTextBlock!adapters!public! !
!UI.CardContainer categoriesFor: #getTextBlock:!adapters!public! !
!UI.CardContainer categoriesFor: #hasButtons!accessing-styles!public! !
!UI.CardContainer categoriesFor: #hasButtons:!accessing-styles!public! !
!UI.CardContainer categoriesFor: #hasHotTracking!accessing-styles!public! !
!UI.CardContainer categoriesFor: #hasHotTracking:!accessing-styles!public! !
!UI.CardContainer categoriesFor: #hasOwnTabs!public!testing! !
!UI.CardContainer categoriesFor: #implicitInsets:!accessing!private! !
!UI.CardContainer categoriesFor: #isDropTarget:!accessing!public! !
!UI.CardContainer categoriesFor: #isInverted!accessing-styles!public! !
!UI.CardContainer categoriesFor: #isInverted:!accessing-styles!public! !
!UI.CardContainer categoriesFor: #isMultiline!accessing!public! !
!UI.CardContainer categoriesFor: #isMultiline:!accessing!public! !
!UI.CardContainer categoriesFor: #isTabStop!accessing!public! !
!UI.CardContainer categoriesFor: #isTabStop:!accessing-styles!public! !
!UI.CardContainer categoriesFor: #isVertical!accessing-styles!public! !
!UI.CardContainer categoriesFor: #isVertical:!accessing-styles!public! !
!UI.CardContainer categoriesFor: #layout:!geometry!public! !
!UI.CardContainer categoriesFor: #newTabs!helpers!private! !
!UI.CardContainer categoriesFor: #onCurrentCardChanged!event handling!private! !
!UI.CardContainer categoriesFor: #onEraseRequired:!event handling!public! !
!UI.CardContainer categoriesFor: #onSubViewAdded:!event handling!private! !
!UI.CardContainer categoriesFor: #onTabChanged!event handling!private! !
!UI.CardContainer categoriesFor: #onTabChanging:!event handling!private! !
!UI.CardContainer categoriesFor: #onViewCreated!event handling!private! !
!UI.CardContainer categoriesFor: #onZOrderChanged!event handling!private! !
!UI.CardContainer categoriesFor: #preTranslateKeyboardInput:!public! !
!UI.CardContainer categoriesFor: #queryCommand:!commands!public! !
!UI.CardContainer categoriesFor: #refreshTabs!public!updating! !
!UI.CardContainer categoriesFor: #removeSubView:!public! !
!UI.CardContainer categoriesFor: #tabOrientation!accessing-styles!public! !
!UI.CardContainer categoriesFor: #tabOrientation:!accessing-styles!public! !
!UI.CardContainer categoriesFor: #tabs!accessing!private! !
!UI.CardContainer categoriesFor: #updateTabs!public!updating! !
!UI.CardContainer categoriesFor: #viewMode!accessing!public! !
!UI.CardContainer categoriesFor: #viewMode:!accessing!public! !
!UI.CardContainer categoriesFor: #wmPrint:wParam:lParam:!private! !

!UI.CardContainer class methodsFor!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 985166 10 ##(UI.STBViewProxy) ##(UI.CardContainer) 34 16 nil nil 34 2 8 1409286144 131073 416 nil 917510 ##(Graphics.Color) #default nil 5 nil nil nil 416 853318 1 ##(UI.CardLayout) 138 144 8 #() nil nil nil nil 170 192 560 nil 410 ##(UI.TabViewXP) 34 28 nil 416 34 2 8 1140916736 1 592 787270 2 ##(UI.ListModel) 138 144 560 nil 1638406 ##(Kernel.IdentitySearchPolicy) nil nil 1 nil nil nil 592 nil 8 1920388864 1246566 3 ##(Kernel.BlockClosure) 0 nil 1377574 ##(Kernel.CompiledMethod) 2 3 ##(UI.ListControlView) #defaultGetTextBlock 575230339 8 #[30 105 226 0 106] #displayString 768 7 257 nil 754 0 nil 786 2 3 ##(UI.IconicListAbstract) #defaultGetImageBlock 579598755 8 #[30 105 226 0 106] #iconImageIndex 832 7 257 nil 1639750 1 ##(Graphics.IconImageManager) nil nil nil nil nil #noIcons nil nil nil nil nil 1310982 ##(Core.MessageSequence) 138 144 34 2 1049350 ##(Core.MessageSend) #createAt:extent: 34 2 655878 ##(Graphics.Point) 1 1 1026 701 501 592 978 #tcmSetExtendedStyle:dwExStyle: 8 #(-1 0) 592 1179910 ##(OS.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 94 1 0 0 250 0 0 0] 8 #() 1026 193 193 nil 27 914 138 144 34 1 978 #createAt:extent: 34 2 1026 6143 21 1026 701 501 416 1106 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 11 0 0 10 0 0 0 93 13 0 0 4 1 0 0] 34 1 592 1168 nil 27)! !
!UI.CardContainer class categoriesFor: #resource_Default_view!public!resources-views! !

