Class {
	#name : 'ACExHoneyGinger',
	#superclass : 'Object',
	#instVars : [
		'renderingCycles'
	],
	#category : 'ACEx-HoneyGinger',
	#package : 'ACEx-HoneyGinger'
}

{ #category : 'initialization' }
ACExHoneyGinger >> initialize [

	renderingCycles := 600
]

{ #category : 'running' }
ACExHoneyGinger >> renderSimulation: aMorphSimulator [

	renderingCycles timesRepeat: [ WorldMorph doOneCycle ].
	aMorphSimulator window close
]

{ #category : 'running' }
ACExHoneyGinger >> run [
	
	<script: 'self new run'>

	"Simulations to use"
	self renderSimulation: HGSimulator butterBallGraffitiAtDie
	"self renderSimulation: HGSimulator ramen."
	"self renderSimulation: HGSimulator butterBall."
	
	"Stop moving eventually"
	"self renderSimulation: HGSimulator rockAtDie."
	"self renderSimulation: HGSimulator jelloAtDie."

	"Morphic world and custom forms"
	"self renderSimulation: HGSimulator stickyBeans"
	"self renderSimulation: HGSimulator impossibeRiverRefraction."

	"Mouse interaction"
	"self renderSimulation: HGSimulator liquidOxgen."
	"self renderSimulation: HGSimulator impossibeRiverPolygon."
	"self renderSimulation: HGSimulator polymer800."
	"self renderSimulation: HGSimulator impossibeRiverBorderline."
	"self renderSimulation: (HGSimulator graffitiInUserImage: 0.5)."
	"self renderSimulation: HGSimulator rockIce."
]
