Class {
	#name : 'ACExRegis',
	#superclass : 'Object',
	#instVars : [
		'registerMockData'
	],
	#category : 'ACEx-Regis',
	#package : 'ACEx-Regis'
}

{ #category : 'initialization' }
ACExRegis >> initialize [

	super initialize.
	registerMockData := 100
]

{ #category : 'running' }
ACExRegis >> run [

	ESUGSetUp start.
	registerMockData timesRepeat: [ ERTest generateDataForTest ].
	"ESUGSetUp stop."
]
