Class {
	#name : 'ACExDataFrame',
	#superclass : 'Object',
	#instVars : [
		'incrementalGCs',
		'fullGCs',
		'timeGarbageCollectingInMilliseconds'
	],
	#category : 'ACEx-DataFrame',
	#package : 'ACEx-DataFrame'
}

{ #category : 'running' }
ACExDataFrame >> run [

	"self setStats."
	self runOneGBDF
	"self updateStats"
]

{ #category : 'running' }
ACExDataFrame >> runOneGBDF [
	"https://www.kaggle.com/datasets/rahulbanerjee123/aws-product-length?resource=download (529
	MB and 1.6 GB)"

	DataFrame readFromCsv:
		'/Users/sebastian/Documents/Experiments/ACEx/AWS Product Length/train.csv'
			asFileReference
]

{ #category : 'running' }
ACExDataFrame >> runThreeGBDF [
	"https://www.kaggle.com/datasets/antoninadolgorukova/proteinrna-vs-rna-spearman-correlation-data? select=Prot-RNA_corr_63gr.csv (3.1 GB)"

	self setStats.
	DataFrame readFromCsv:
		'/Users/sebastian/Documents/Experiments/ACEx/CITEseq22 Protein-RNA vs RNA Spearman cor data/Prot-RNA_corr_63gr.csv' asFileReference.
	self updateStats
]

{ #category : 'initialization' }
ACExDataFrame >> setStats [

	incrementalGCs := Smalltalk vm incrementalGCCount.
	fullGCs := Smalltalk vm fullGCCount.
	timeGarbageCollectingInMilliseconds := Smalltalk vm totalGCTime
]

{ #category : 'initialization' }
ACExDataFrame >> updateStats [

	incrementalGCs := Smalltalk vm incrementalGCCount - incrementalGCs.
	fullGCs := Smalltalk vm fullGCCount - fullGCs.
	timeGarbageCollectingInMilliseconds := Smalltalk vm totalGCTime
	                                       - timeGarbageCollectingInMilliseconds
]
