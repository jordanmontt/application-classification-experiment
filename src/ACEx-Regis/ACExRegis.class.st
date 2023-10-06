Class {
	#name : 'ACExRegis',
	#superclass : 'Object',
	#category : 'ACEx-Regis',
	#package : 'ACEx-Regis'
}

{ #category : 'running' }
ACExRegis >> run [

	ESUGSetUp start.
	ERTest generateALotDataForTest. "It inserts 400 people in total"
	ESUGSetUp stop.
]
