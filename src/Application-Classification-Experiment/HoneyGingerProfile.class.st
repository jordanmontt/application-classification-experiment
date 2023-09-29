Class {
	#name : 'HoneyGingerProfile',
	#superclass : 'Object',
	#instVars : [
		'renderingTimes'
	],
	#category : 'Application-Classification-Experiment',
	#package : 'Application-Classification-Experiment'
}

{ #category : 'initialization' }
HoneyGingerProfile >> initialize [

	renderingTimes := 100
]

{ #category : 'running' }
HoneyGingerProfile >> renderSimulation: aMorphSimulator [

	renderingTimes timesRepeat: [ WorldMorph doOneCycle ].
	aMorphSimulator window close
]

{ #category : 'running' }
HoneyGingerProfile >> run [

	<script: 'self new run'>
	self renderSimulation: HGSimulator ramen.
	self renderSimulation: (HGSimulator graffitiInUserImage: 0.5).
	self renderSimulation: HGSimulator jelloAtDie.
	self renderSimulation: HGSimulator rockAtDie.
	self renderSimulation: HGSimulator rockIce.
	self renderSimulation: HGSimulator liquidOxgen.
	self renderSimulation: HGSimulator polymer800.
	self renderSimulation: HGSimulator impossibeRiverBorderline.
	self renderSimulation: HGSimulator impossibeRiverPolygon.
	self renderSimulation: HGSimulator impossibeRiverRefraction.
	self renderSimulation: HGSimulator butterBall.
	self renderSimulation: HGSimulator butterBallGraffitiAtDie.
	self renderSimulation: HGSimulator stickyBeans
]
