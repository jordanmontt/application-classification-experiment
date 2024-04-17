Class {
	#name : 'ACExMoose',
	#superclass : 'Object',
	#instVars : [
		'model'
	],
	#category : 'ACEx-Moose',
	#package : 'ACEx-Moose'
}

{ #category : 'as yet unclassified' }
ACExMoose >> run [

	self runLoadModel
]

{ #category : 'as yet unclassified' }
ACExMoose >> runLoadModel [

	| inputFile |
	model := FamixJavaModel new.
	inputFile := (FileLocator imageDirectory / 'omaje2.json') asFileReference.

	"Import the model"
	model importFromJSONStream: inputFile readStream
		filteredBy: FamixJavaImportingContext new importMaximum
]

{ #category : 'as yet unclassified' }
ACExMoose >> runVizu [

	self runLoadModel.
	MiArchitecturalMapBrowser open receiveEntity: model allModelClasses
]
