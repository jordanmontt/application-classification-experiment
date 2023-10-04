Class {
	#name : 'BaselineOfACExRegis',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfACExRegis',
	#package : 'BaselineOfACExRegis'
}

{ #category : 'baselines' }
BaselineOfACExRegis >> baseline: spec [

	<baseline>
	self preLoad.

	spec for: #common do: [
		spec package: 'ACEx-Regis'.

		"Groups"
		spec group: 'Core' with: #( 'ACEx-Regis' ) ]
]

{ #category : 'baselines' }
BaselineOfACExRegis >> preLoad [
	"Download through executing the baseline because there are conflicts.
	Using onConflictUseLoaded"

	Metacello new
		baseline: 'ESUGApp';
		githubUser: 'ESUG' project: 'Regis' commitish: 'master' path: 'src';
		onWarningLog;
		onConflictUseLoaded;
		load
]
