Class {
	#name : 'BaselineOfACExRegis',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfACExRegis',
	#package : 'BaselineOfACExRegis'
}

{ #category : 'baselines' }
BaselineOfACExRegis >> baseline: spec [
	<baseline>
	
	spec for: #'common' do: [
		spec package: 'ACEx-Regis'.
		
		"External dependencies"
		spec baseline: 'ESUGApp'
			with: [ spec repository: 'github://ESUG/Regis:master' ].
		
		"Linking external dependencies"
		spec package: 'ACEx-Regis'
			with: [ spec requires: #('ESUGApp') ].
		
		"Groups"
		spec group: 'Core' with: #( 'ACEx-Regis' ) ]
]
