﻿"Filed out from Dolphin Smalltalk 7"!

Graphics.Gdiplus.Tests.GdiplusTest subclass: #'Graphics.Gdiplus.Tests.GraphicsPathTest'
	instanceVariableNames: 'fillMode'
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
Graphics.Gdiplus.Tests.GraphicsPathTest guid: (Core.GUID fromString: '{fcef1a10-834c-11d7-b609-00e0987e8081}')!
Graphics.Gdiplus.Tests.GraphicsPathTest comment: ''!
!Graphics.Gdiplus.Tests.GraphicsPathTest categoriesForClass!Unclassified! !
!Graphics.Gdiplus.Tests.GraphicsPathTest methodsFor!

setSample3Points
	model := Path
				points: {100 @ 0. 200 @ 150. 0 @ 150}
				types: (ByteArray new: 3 withAll: PathPointTypeLine)
				fillMode: nil!

setSampleEllipse
	model := Path new addEllipse: (Point zero extent: 200 @ 100)!

setSampleNew
	model := Path new!

testBounds
	self setSample3Points.
	self assert: (Point zero extent: model bounds extent - 1) equals: (Point zero extent: 200 @ 150)!

testConstructor3Points
	self setSample3Points.
	model asParameter.
	self assertPersistedValid!

testConstructorPoints
	self setSample3Points.
	model asParameter.
	self assertPersistedValid!

testFillMode
	self setSampleNew.
	self assert: model fillMode equals: 0.
	model class enumsFillMode do: 
			[:e |
			model fillMode: e value.
			self assert: model fillMode equals: e value]!

testPointCount
	self setSample3Points.
	self assert: model pointCount equals: 3! !
!Graphics.Gdiplus.Tests.GraphicsPathTest categoriesFor: #setSample3Points!public! !
!Graphics.Gdiplus.Tests.GraphicsPathTest categoriesFor: #setSampleEllipse!public! !
!Graphics.Gdiplus.Tests.GraphicsPathTest categoriesFor: #setSampleNew!public! !
!Graphics.Gdiplus.Tests.GraphicsPathTest categoriesFor: #testBounds!public! !
!Graphics.Gdiplus.Tests.GraphicsPathTest categoriesFor: #testConstructor3Points!public! !
!Graphics.Gdiplus.Tests.GraphicsPathTest categoriesFor: #testConstructorPoints!public! !
!Graphics.Gdiplus.Tests.GraphicsPathTest categoriesFor: #testFillMode!public! !
!Graphics.Gdiplus.Tests.GraphicsPathTest categoriesFor: #testPointCount!public! !

