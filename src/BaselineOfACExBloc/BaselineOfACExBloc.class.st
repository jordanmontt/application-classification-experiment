Class {
	#name : 'BaselineOfACExBloc',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfACExBloc',
	#package : 'BaselineOfACExBloc'
}

{ #category : 'baselines' }
BaselineOfACExBloc >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec package: 'ACEx-Bloc'.

		"External dependencies"
		spec
 			baseline: 'BlocBenchs'
			with: [ spec repository: 'github://pharo-graphics/BlocBenchs:master/src' ].

		"Linking external dependencies"
		spec package: 'ACEx-Bloc'
			with: [ spec requires: #('BlocBenchs') ].

		"Groups"
		spec group: 'Core' with: #( 'ACEx-Bloc' ) ]
]
