Class {
	#name : 'ACExReMobidyc',
	#superclass : 'Object',
	#instVars : [
		'profiler'
	],
	#category : 'ACExReMobidyc',
	#package : 'ACExReMobidyc'
}

{ #category : 'running' }
ACExReMobidyc >> profiler: aProfiler [

	profiler := aProfiler
]

{ #category : 'running' }
ACExReMobidyc >> run [

	| model metainterpreter |
	self startProfiling.
	model := RMDSimulationModel goatAndWolf.
	model variability
		multiplicity: 4;
		randomSeed: 1.
	metainterpreter := RMDMetaInterpreter forDryRunOn: model.
	metainterpreter announcer when: RMDSimulationPaused do: [ self stopProfiling ] for: self.
	metainterpreter openInExperimentarium presenter runSimulation
]

{ #category : 'running' }
ACExReMobidyc >> startProfiling [

	profiler startProfiling
]

{ #category : 'running' }
ACExReMobidyc >> stopProfiling [

	profiler stopProfiling
]
