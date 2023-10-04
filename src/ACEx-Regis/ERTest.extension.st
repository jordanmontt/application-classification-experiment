Extension { #name : 'ERTest' }

{ #category : '*ACEx-Regis' }
ERTest class >> fakeEmailDomainCollection [

	^ #( 'gmail.com' 'hotmail.com' 'free.fr' 'mail.com' 'yahoo.com' 'hotmail.es' 'protonmail.com'
	     'protonme.com' 'tutanova.com' 'outlook.com' 'gmail.fr' )
]

{ #category : '*ACEx-Regis' }
ERTest class >> fakeNamesCollection [

	^ #( 'ibrahim' 'holly' 'meredith' 'malik' 'zach' 'mckenna' 'hermione' 'emory' 'luke'
	     'cecil' 'albie' 'dawid' 'benjamin' 'cory' 'blair' 'jayden' 'iman' 'seren' 'raphael'
	     'lilly' 'alana' 'warren' 'jamie' 'safiya' 'diego' 'catherine' 'enzo' 'reagan'
	     'roman' 'xavier' 'georgia' 'hashim' 'lucy' 'aiden' 'kara' 'luka' 'noel' 'nicola'
	     'sylvie' 'angelina' 'aurora' 'iona' 'kye' 'zacharias' 'sydney' 'myah' 'scott' 'malachi'
	     'maria' 'paris' 'frankie' 'lexi' 'mohammad' 'jamal' 'dustin' 'maksymilian'
	     'alina' 'inayah' 'victoria' 'charlie' 'royal' 'ezra' 'jules' 'dakota' 'nikola'
	     'ellie-may' 'hayden' 'lawrence' 'erica' 'brooklyn' 'dean' 'pippa' 'flora' 'jason'
	     'zaynab' 'verity' 'brodie' 'noah' 'remy' 'avery' 'albert' 'zack' 'brian' 'thea'
	     'gabriel' 'lewis' 'rafael' 'robin' 'quinn' 'pixie' 'cohen' 'daniyal' 'sam' 'hayley'
	     'mohammed' 'denis' 'carson' 'michaela' 'archie' 'delilah' 'ciaran' 'jake' 'angus'
	     'florian' 'beatrix' 'elisha' 'lukas' 'owen' 'isabella' 'delaney' )
]

{ #category : '*ACEx-Regis' }
ERTest class >> generateALotDataForTest [

	| names emailDomains emailAddresses instance |
	"110 different names"
	names := self fakeNamesCollection.
	emailDomains := self fakeEmailDomainCollection.

	emailAddresses := names collect: [ :aName | aName , '@' , emailDomains atRandom ]
		as: OrderedCollection.

	"Copying the original method's generateDataForTest logic"
	instance := self new.
	[ emailAddresses isEmpty ] whileFalse: [
		"Register 5 attendees"
		instance registerAttendees: (emailAddresses removeFirst: 5).
		"Register groups of people with a manager"
		instance
			registerGroupWithGroupManager: emailAddresses removeFirst
			listOfAttendees: (emailAddresses removeFirst: 4) ]
]
