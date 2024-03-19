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
ACExReMobidyc >> exportData [

	profiler exportData
]

{ #category : 'initialization' }
ACExReMobidyc >> initialize [

	super initialize.
	profiler := IllFinalizationProfiler new
]

{ #category : 'as yet unclassified' }
ACExReMobidyc >> profiler: aProfiler [

	profiler := aProfiler
]

{ #category : 'as yet unclassified' }
ACExReMobidyc >> run [

	self run: nil
]

{ #category : 'as yet unclassified' }
ACExReMobidyc >> run: nonSense [

	| model metainterpreter |
	self startProfiling.
	model := RMDSimulationModel goatAndWolf.
	model variability
		multiplicity: 4;
		randomSeed: 1.
	metainterpreter := RMDMetaInterpreter forDryRunOn: model.
	metainterpreter announcer when: RMDSimulationPaused do: [
		self stopProfiling.
		self exportData ] for: self.
	metainterpreter openInExperimentarium presenter runSimulation
]

{ #category : 'as yet unclassified' }
ACExReMobidyc >> samplingRate: aSamplingRate [

	profiler samplingRate: aSamplingRate
]

{ #category : 'as yet unclassified' }
ACExReMobidyc >> startProfiling [

	profiler startProfiling
]

{ #category : 'as yet unclassified' }
ACExReMobidyc >> stopProfiling [

	profiler stopProfiling
]
