Extension { #name : 'RMDNumberInputPresenter' }

{ #category : '*ACExReMobidyc' }
RMDNumberInputPresenter >> color: aColor [
	super color: aColor.
	"self withWidgetDo: [ :w | w notNil ifTrue: [ w color: aColor ] ]"
]
