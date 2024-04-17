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

{ #category : 'synthetic' }
ACExDataFrame >> run [

	self runSyntheticOneHundredTimes
]

{ #category : 'aws' }
ACExDataFrame >> runAWS1dot6GB [
	"https://www.kaggle.com/datasets/rahulbanerjee123/aws-product-length?resource=download (529
	MB and 1.6 GB)"

	DataFrame readFromCsv:
		'/Users/sebastian/Documents/Experiments/ACEx/AWS Product Length/train.csv'
			asFileReference
]

{ #category : 'protein' }
ACExDataFrame >> runProtein1dot14GB [
	"1.14 GB"

	DataFrame readFromCsv:
		'/Users/sebastian/Documents/Experiments/ACEx/CITEseq22 Protein-RNA vs RNA Spearman cor data/Prot-RNA_corr_21gr.csv'
			asFileReference
]

{ #category : 'protein' }
ACExDataFrame >> runProtein3GB [
	"https://www.kaggle.com/datasets/antoninadolgorukova/proteinrna-vs-rna-spearman-correlation-data? select=Prot-RNA_corr_63gr.csv (3.1 GB)"

	DataFrame readFromCsv:
		'/Users/sebastian/Documents/Experiments/ACEx/CITEseq22 Protein-RNA vs RNA Spearman cor data/Prot-RNA_corr_63gr.csv' asFileReference
]

{ #category : 'synthetic' }
ACExDataFrame >> runSynthetic [
	"This is a small synthetic dataset generated using make_regression of sklearn.
	It weights 2.3 MB. It has 20000 rows and 5 columns. It contains only numbers"

	DataFrame readFromCsv:
		'/Users/sebastian/Documents/Experiments/ACEx/Synthetic Dataset/tiny_dataset.csv'
			asFileReference
]

{ #category : 'synthetic' }
ACExDataFrame >> runSyntheticFiftyTimes [
	"This is a small synthetic dataset generated using make_regression of sklearn. The code is
	at https://github.com/jordanmontt/lapack-experiment.
	It weights 23 MB. It has 1000000 rows and 5 columns. It contains only numbers"

	DataFrame readFromCsv:
		'/Users/sebastian/Documents/Experiments/ACEx/Synthetic Dataset/tiny_fifty_times_larger_dataset.csv'
			asFileReference
]

{ #category : 'synthetic' }
ACExDataFrame >> runSyntheticOneHundredTimes [
	"This is a small synthetic dataset generated using make_regression of sklearn.
	It weights 230 MB. It has 2000000 rows and 5 columns. It contains only numbers"

	| file |
	file := (FileLocator imageDirectory / 'tiny_one_hundred_times_larger_dataset.csv') asFileReference.
	DataFrame readFromCsv: file
]

{ #category : 'synthetic' }
ACExDataFrame >> runSyntheticTenTimes [
	"This is a small synthetic dataset generated using make_regression of sklearn.
	It weights 23 MB. It has 200000 rows and 5 columns. It contains only numbers"

	DataFrame readFromCsv:
		'/Users/sebastian/Documents/Experiments/ACEx/Synthetic Dataset/tiny_ten_times_larger_dataset.csv'
			asFileReference
]
