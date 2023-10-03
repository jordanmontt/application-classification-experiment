Class {
	#name : 'ACExHoneyGinger',
	#superclass : 'Object',
	#instVars : [
		'secondsToRender'
	],
	#category : 'ACEx-HoneyGinger',
	#package : 'ACEx-HoneyGinger'
}

{ #category : 'initialization' }
ACExHoneyGinger >> initialize [

	secondsToRender := 120
]

{ #category : 'running' }
ACExHoneyGinger >> renderSimulation: aMorphSimulator [

	| renderingTime |
	renderingTime := Time primUTCMillisecondsClock + (secondsToRender * 1000).
	[ Time primUTCMillisecondsClock > renderingTime ]  whileFalse: [ WorldMorph doOneCycle ].
	aMorphSimulator window close
]

{ #category : 'running' }
ACExHoneyGinger >> run [

	<script: 'self new run'>

	self renderSimulation: HGSimulator impossibeRiverRefraction.
	self renderSimulation: HGSimulator butterBallGraffitiAtDie.
	self renderSimulation: HGSimulator stickyBeans
	"self renderSimulation: HGSimulator ramen."
	"self renderSimulation: HGSimulator rockIce."
	"self renderSimulation: HGSimulator butterBall."
	"self renderSimulation: HGSimulator polymer800."
	"self renderSimulation: HGSimulator impossibeRiverBorderline."
	"self renderSimulation: HGSimulator rockAtDie."
	"self renderSimulation: (HGSimulator graffitiInUserImage: 0.5)."
	"self renderSimulation: HGSimulator jelloAtDie."
	"self renderSimulation: HGSimulator liquidOxgen."
	"self renderSimulation: HGSimulator impossibeRiverPolygon."
]