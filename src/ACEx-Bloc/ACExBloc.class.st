Class {
	#name : 'ACExBloc',
	#superclass : 'Object',
	#category : 'ACEx-Bloc',
	#package : 'ACEx-Bloc'
}

{ #category : 'running' }
ACExBloc >> run [

	PCBenchmarkSuite new
		addCase: PCSolidCirclesBenchCase new;
		numberOfSeconds: 10;
		addAlexandrieBenchmarker;
		run
]
