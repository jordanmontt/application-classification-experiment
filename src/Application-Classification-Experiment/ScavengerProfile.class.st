Class {
	#name : 'ScavengerProfile',
	#superclass : 'Object',
	#instVars : [
		'incrementalGCs',
		'fullGCs',
		'timeGarbageCollectingInMilliseconds'
	],
	#category : 'Application-Classification-Experiment',
	#package : 'Application-Classification-Experiment'
}

{ #category : 'running' }
ScavengerProfile >> run [

	self runOneGBDF
]

{ #category : 'as yet unclassified' }
ScavengerProfile >> runOneGBDF [
	"https://www.kaggle.com/datasets/rahulbanerjee123/aws-product-length?resource=download (529
	MB and 1.6 GB)"

	self setStats.
	DataFrame readFromCsv: '/Users/sebastian/Downloads/csv/train.csv' asFileReference.
	self updateStats
]

{ #category : 'as yet unclassified' }
ScavengerProfile >> runThreeGBDF [
	"https://www.kaggle.com/datasets/antoninadolgorukova/proteinrna-vs-rna-spearman-correlation-data? select=Prot-RNA_corr_63gr.csv (3.1 GB)"

	self setStats.
	DataFrame readFromCsv:
		'/Users/sebastian/Downloads/csv/Prot-RNA_corr_63gr.csv' asFileReference.
	self updateStats
]

{ #category : 'initialization' }
ScavengerProfile >> setStats [

	incrementalGCs := Smalltalk vm incrementalGCCount.
	fullGCs := Smalltalk vm fullGCCount.
	timeGarbageCollectingInMilliseconds := Smalltalk vm totalGCTime
]

{ #category : 'initialization' }
ScavengerProfile >> updateStats [

	incrementalGCs := Smalltalk vm incrementalGCCount - incrementalGCs.
	fullGCs := Smalltalk vm fullGCCount - fullGCs.
	timeGarbageCollectingInMilliseconds := Smalltalk vm totalGCTime
	                                       - timeGarbageCollectingInMilliseconds
]
