Class {
	#name : 'BaselineOfApplicationClassificationExperiment',
	#superclass : 'BaselineOf',
	#instVars : [
		'renderingTimes'
	],
	#category : 'BaselineOfApplicationClassificationExperiment',
	#package : 'BaselineOfApplicationClassificationExperiment'
}

{ #category : 'baselines' }
BaselineOfApplicationClassificationExperiment >> baseline: spec [
	<baseline>
	
	spec for: #'common' do: [
		spec package: 'Application-Classification-Experiment'.
			
		"External dependencies"
		spec baseline: 'HoneyGinger'
			with: [ spec repository: 'github://tomooda/HoneyGinger:main' ].
		
		"Linking external dependencies"
		spec package: 'Application-Classification-Experiment'
			with: [ spec requires: #('HoneyGinger') ].
		
		"Groups"
		spec group: 'Core'
			with: #( 'Application-Classification-Experiment' ) ]
]
