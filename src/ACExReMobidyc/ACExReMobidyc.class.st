Class {
	#name : 'ACExReMobidyc',
	#superclass : 'Object',
	#category : 'ACExReMobidyc',
	#package : 'ACExReMobidyc'
}

{ #category : 'running' }
ACExReMobidyc >> run [

	| model metainterpreter |
	model := RMDSimulationModel goatAndWolf.
	model variability
		multiplicity: 4;
		randomSeed: 1.
	metainterpreter := RMDMetaInterpreter forDryRunOn: model.
	metainterpreter openInExperimentarium presenter runSimulation
]
