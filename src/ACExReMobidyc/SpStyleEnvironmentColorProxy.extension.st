Extension { #name : 'SpStyleEnvironmentColorProxy' }

{ #category : '*ACExReMobidyc' }
SpStyleEnvironmentColorProxy >> basicSize [
	"Primitive. Answer the number of indexable variables in the receiver.
	This value is the same as the largest legal subscript. Essential. Do not
	override in any subclass (except Context). See Object documentation whatIsAPrimitive."
	<reflection: 'Class structural inspection - Instance variable inspection'>
	<primitive: 62>
	"The number of indexable fields of fixed-length objects is 0"
	^0
]

{ #category : '*ACExReMobidyc' }
SpStyleEnvironmentColorProxy >> sizeInMemory [
	self class isImmediateClass
		ifTrue: [ ^ 0 ].
	^ self class isVariable
		ifTrue: [ self class byteSizeOfInstanceOfSize: self basicSize ]
		ifFalse: [ self class byteSizeOfInstance ]
]
