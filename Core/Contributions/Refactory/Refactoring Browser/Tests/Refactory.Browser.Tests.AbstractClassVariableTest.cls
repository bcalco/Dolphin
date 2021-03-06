﻿"Filed out from Dolphin Smalltalk 7"!

Refactory.Browser.Tests.RefactoringTest subclass: #'Refactory.Browser.Tests.AbstractClassVariableTest'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
Refactory.Browser.Tests.AbstractClassVariableTest guid: (Core.GUID fromString: '{38fd1ddb-aa95-40b7-80bb-c8a7ea9dcd59}')!
Refactory.Browser.Tests.AbstractClassVariableTest comment: ''!
!Refactory.Browser.Tests.AbstractClassVariableTest categoriesForClass!Refactory-Testing! !
!Refactory.Browser.Tests.AbstractClassVariableTest methodsFor!

setUp
	super setUp.
	model := Compiler evaluate: (self readFile: 'AbstractVariableTestData.st')!

testAbstractClassVariable
	| refactoring meta class |
	refactoring := AbstractClassVariableRefactoring variable: 'RecursiveSelfRule'
				class: TransformationRuleTest.
	self executeRefactoring: refactoring.
	class := refactoring model classNamed: #'Refactory.Browser.Tests.TransformationRuleTest'.
	meta := class metaclass.
	self assert: (meta parseTreeFor: #recursiveSelfRule)
		equals: (RBParser parseMethod: 'recursiveSelfRule ^RecursiveSelfRule').
	self assert: (meta parseTreeFor: #recursiveSelfRule:)
		equals: (RBParser parseMethod: 'recursiveSelfRule: anObject RecursiveSelfRule := anObject').
	self assert: (meta parseTreeFor: #nuke)
		equals: (RBParser parseMethod: 'nuke
							self recursiveSelfRule: nil').
	self assert: (meta parseTreeFor: #initializeAfterLoad1)
		equals: (RBParser
				parseMethod: 'initializeAfterLoad1
							self recursiveSelfRule: ParseTreeSearcher new.
							self recursiveSelfRule
								addMethodSearches: #(''`@methodName: `@args | `@temps | self `@methodName: `@args'' ''`@methodName: `@args | `@temps | ^self `@methodName: `@args'')
										-> [:aNode :answer | true]').
	self assert: (class parseTreeFor: #checkMethod:)
		equals: (RBParser
				parseMethod: 'checkMethod: aSmalllintContext 
							class := aSmalllintContext selectedClass.
							(rewriteRule executeTree: aSmalllintContext parseTree) ifTrue: 
									[(self class recursiveSelfRule executeTree: rewriteRule tree initialAnswer: false)
										ifFalse: 
											[builder compile: rewriteRule tree printString
												in: class
												classified: aSmalllintContext protocols]]')!

testInheritedName
	self
		shouldFail: (AbstractClassVariableRefactoring variable: #DependentsFields class: BasicLintRuleTest)!

testMetaClassFailure
	self shouldFail: (AbstractClassVariableRefactoring variable: #RecursiveSelfRule
				class: TransformationRuleTest class)!

testModelAbstractClassVariable
	| refactoring meta class |
	class := model classNamed: #Foo.
	meta := class metaclass.
	refactoring := AbstractClassVariableRefactoring
				model: model
				variable: 'ClassVarName1'
				class: class.
	self executeRefactoring: refactoring.
	self assert: (meta parseTreeFor: #classVarName1)
		equals: (RBParser parseMethod: 'classVarName1 ^ClassVarName1').
	self assert: (meta parseTreeFor: #classVarName1:)
		equals: (RBParser parseMethod: 'classVarName1: anObject ^ClassVarName1 := anObject').
	self assert: (meta parseTreeFor: #foo)
		equals: (RBParser
				parseMethod: 'foo
					^self classVarName1: self classVarName1 * self classVarName1 * self classVarName1').
	self assert: (class parseTreeFor: #classVarName1)
		equals: (RBParser parseMethod: 'classVarName1
							^self class classVarName1').
	self assert: (class parseTreeFor: #classVarName1:)
		equals: (RBParser parseMethod: 'classVarName1: anObject
							^self class classVarName1: anObject').
	self assert: (class parseTreeFor: #asdf)
		equals: (RBParser
				parseMethod: 'asdf
						^self classVarName1: (self class classVarName1: self class classVarName1 + 1)').
	self assert: ((model classNamed: #Bar) parseTreeFor: #foo)
		equals: (RBParser
				parseMethod: 'foo
					instVarName1 := instVarName1 + instVarName2 + self class classVarName1').
	self assert: ((model classNamed: #Bar) parseTreeFor: #foo)
		equals: (RBParser
				parseMethod: 'foo
						instVarName1 := instVarName1 + instVarName2 + self class classVarName1')!

testModelAbstractClassVariableOverridenMethodsInSubclass
	| refactoring meta class |
	class := model classNamed: #Foo.
	meta := class metaclass.
	refactoring := AbstractClassVariableRefactoring
				model: model
				variable: 'ClassVarName2'
				class: class.
	self executeRefactoring: refactoring.
	self assert: (meta parseTreeFor: #classVarName21)
		equals: (RBParser parseMethod: 'classVarName21 ^ClassVarName2').
	self assert: (meta parseTreeFor: #classVarName21:)
		equals: (RBParser parseMethod: 'classVarName21: anObject ClassVarName2 := anObject')!

testNonExistantName
	self shouldFail: (AbstractClassVariableRefactoring variable: #Foo class: BasicLintRuleTest)! !
!Refactory.Browser.Tests.AbstractClassVariableTest categoriesFor: #setUp!public!set up! !
!Refactory.Browser.Tests.AbstractClassVariableTest categoriesFor: #testAbstractClassVariable!public!tests! !
!Refactory.Browser.Tests.AbstractClassVariableTest categoriesFor: #testInheritedName!failure tests!public! !
!Refactory.Browser.Tests.AbstractClassVariableTest categoriesFor: #testMetaClassFailure!failure tests!public! !
!Refactory.Browser.Tests.AbstractClassVariableTest categoriesFor: #testModelAbstractClassVariable!public!tests! !
!Refactory.Browser.Tests.AbstractClassVariableTest categoriesFor: #testModelAbstractClassVariableOverridenMethodsInSubclass!public!tests! !
!Refactory.Browser.Tests.AbstractClassVariableTest categoriesFor: #testNonExistantName!failure tests!public! !

