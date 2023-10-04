Class {
	#name : 'ACExRegis',
	#superclass : 'Object',
	#instVars : [
		'registerMockData'
	],
	#category : 'ACEx-Regis',
	#package : 'ACEx-Regis'
}

{ #category : 'running' }
ACExRegis >> run [

	ESUGSetUp start.
	ERTest generateALotDataForTest "It inserts 110 people in total"
	"ESUGSetUp stop."
]
