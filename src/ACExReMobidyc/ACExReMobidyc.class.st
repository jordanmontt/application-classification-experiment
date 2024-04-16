Class {
	#name : 'ACExReMobidyc',
	#superclass : 'Object',
	#instVars : [
		'profiler'
	],
	#category : 'ACExReMobidyc',
	#package : 'ACExReMobidyc'
}

{ #category : 'as yet unclassified' }
ACExReMobidyc >> run [

	| model metainterpreter semaphore |
	semaphore := Semaphore new.
	model := RMDSimulationModel goatAndWolf.
	model variability
		multiplicity: 4;
		randomSeed: 1.
	metainterpreter := RMDMetaInterpreter forDryRunOn: model.
	metainterpreter announcer when: RMDSimulationPaused do: [ semaphore signal ] for: self.
	metainterpreter openInExperimentarium presenter runSimulation.
	semaphore wait
]
