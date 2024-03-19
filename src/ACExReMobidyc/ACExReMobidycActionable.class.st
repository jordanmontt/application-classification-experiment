Class {
	#name : 'ACExReMobidycActionable',
	#superclass : 'ACExReMobidyc',
	#category : 'ACExReMobidyc',
	#package : 'ACExReMobidyc'
}

{ #category : 'running' }
ACExReMobidycActionable >> classesToKeepReferenced: aCol [

	profiler classesToKeepReferenced: aCol
]

{ #category : 'initialization' }
ACExReMobidycActionable >> initialize [

	super initialize.
	profiler := IllFinalizationInstanceKeeper new
]
