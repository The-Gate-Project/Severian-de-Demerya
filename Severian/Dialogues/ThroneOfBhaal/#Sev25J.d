BEGIN ~#Sev25J~

// EVENEMENTS SPECIAUX

IF ~Global("#SApparitionGorion","GLOBAL",1)~ THEN BEGIN ApparitionGorion
SAY @0
IF ~~ THEN DO ~SetGlobal("#SApparitionGorion","GLOBAL",2)~ EXIT
END

// APRES DEPART DE VALYRIA

IF ~Global("#SDeadDarkhan","GLOBAL",5)~ THEN BEGIN MortDarkhan2
SAY @233223 = @233224 = @233225
IF ~~ THEN REPLY @233226 GOTO RegardSarrete
IF ~~ THEN REPLY @233227 GOTO RegardSarrete
IF ~~ THEN REPLY @233228 GOTO PasFourvoyer
END

IF ~~ THEN BEGIN PasFourvoyer
SAY @233229
IF ~~ THEN GOTO RegardSarrete
END

IF ~~ THEN BEGIN RegardSarrete
SAY @233230 = @233231 = @233232
IF ~~ THEN DO ~SetGlobal("#SDeadDarkhan","GLOBAL",6)
               TakePartyItem("#SAvis")
               DestroyItem("#SAvis")~ EXIT
END

// APRES AUBERGE DE SARADUSH

IF ~Global("#SJolentaSeverian","GLOBAL",6)~ THEN BEGIN CatinAuberge
SAY @207039 = @207040
IF ~~ THEN REPLY @207041 GOTO Chaleur
IF ~~ THEN REPLY @207042 GOTO Defensive
IF ~~ THEN REPLY @207043 GOTO Goujat
END

IF ~~ THEN BEGIN Chaleur
SAY @207046 = @207047 = @207048
IF ~~ THEN REPLY @207049 GOTO Alentours
IF ~~ THEN REPLY @207050 GOTO Interloque
IF ~~ THEN REPLY @207051 GOTO SacCuir
END

IF ~~ THEN BEGIN Defensive
SAY @207044 = @207047 = @207048
IF ~~ THEN REPLY @207049 GOTO Alentours
IF ~~ THEN REPLY @207050 GOTO Interloque
IF ~~ THEN REPLY @207051 GOTO SacCuir
END

IF ~~ THEN BEGIN Goujat
SAY @207045 = @207047 = @207048
IF ~~ THEN REPLY @207049 GOTO Alentours
IF ~~ THEN REPLY @207050 GOTO Interloque
IF ~~ THEN REPLY @207051 GOTO SacCuir
END

IF ~~ THEN BEGIN Interloque
SAY @207054
IF ~~ THEN REPLY @207055 GOTO Baiser
IF ~~ THEN REPLY @207056 GOTO Guepier
IF ~~ THEN REPLY @207057 GOTO CoupPied
END

IF ~~ THEN BEGIN Alentours
SAY @207052
IF ~~ THEN REPLY @207055 GOTO Baiser
IF ~~ THEN REPLY @207056 GOTO Guepier
IF ~~ THEN REPLY @207057 GOTO CoupPied
END

IF ~~ THEN BEGIN SacCuir
SAY @207053
IF ~~ THEN DO ~SetGlobal("#SArgentSale","GLOBAL",1)~ REPLY @207055 GOTO Baiser
IF ~~ THEN DO ~SetGlobal("#SArgentSale","GLOBAL",1)~ REPLY @207056 GOTO Guepier
IF ~~ THEN DO ~SetGlobal("#SArgentSale","GLOBAL",1)~ REPLY @207057 GOTO CoupPied
END

IF ~~ THEN BEGIN Baiser
SAY @207058
IF ~Global("#SArgentSale","GLOBAL",1)~ THEN DO ~SetGlobal("#SJolentaSeverian","GLOBAL",7)
                                                AddJournalEntry(@900159,INFO)
                                                AddJournalEntry(@900160,INFO)
                                                ActionOverride("#Severian",CreateItem("#SAvis",0,0,0))~ EXIT
IF ~Global("#SArgentSale","GLOBAL",0)~ THEN DO ~SetGlobal("#SJolentaSeverian","GLOBAL",7)
                                                GiveGoldForce(200)
                                                AddJournalEntry(@900159,INFO)
                                                AddJournalEntry(@900160,INFO)
                                                ActionOverride("#Severian",CreateItem("#SAvis",0,0,0))~ EXIT
END

IF ~~ THEN BEGIN CoupPied
SAY @207059
IF ~~ THEN DO ~SetGlobal("#SJolentaSeverian","GLOBAL",7)
               AddJournalEntry(@900159,INFO)
               AddJournalEntry(@900161,INFO)
               ActionOverride("#Severian",CreateItem("#SAvis",0,0,0))~ EXIT
END


IF ~~ THEN BEGIN Guepier
SAY @207060 = @207061
IF ~~ THEN DO ~SetGlobal("#SJolentaSeverian","GLOBAL",7)
               AddJournalEntry(@900159,INFO)
               AddJournalEntry(@900161,INFO)
               ActionOverride("#Severian",CreateItem("#SAvis",0,0,0))~ EXIT
END


// BANTER SAREVOK
// SI SAREVOK EST TUE

IF ~Global("#SeverTalkSarevokToB","GLOBAL",3)~ THEN BEGIN SeverianTueSarevok
SAY @210099
IF ~~ THEN REPLY @210100 GOTO SituationAberrante
IF ~~ THEN REPLY @210101 GOTO AssezLucide
IF ~~ THEN REPLY @210102 GOTO AssezLucide1
END

IF ~~ THEN BEGIN SituationAberrante
SAY @210103
IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",4)~ EXIT
END

IF ~~ THEN BEGIN AssezLucide
SAY @210104 = @210105
IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",4)~ EXIT
END

IF ~~ THEN BEGIN AssezLucide1
SAY @210104
IF ~~ THEN REPLY @210110 GOTO HistoireAncienne
IF ~Global("#SeverRomanc eActive","GLOBAL",2)~ THEN REPLY @210111 GOTO ArgumentAvancer
IF ~!Global("#SeverRomanc eActive","GLOBAL",2)~ THEN REPLY @210111 GOTO ArgumentAvancer1
END

IF ~~ THEN BEGIN HistoireAncienne
SAY @210112
IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",4)~ EXIT
END

IF ~~ THEN BEGIN ArgumentAvancer
SAY @210113
IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",4)
               LeaveParty()
               EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN ArgumentAvancer1
SAY @210114
IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",4)
               LeaveParty()
               EscapeArea()~ EXIT
END

// APRES MIROIR DE L'AME

IF ~Global("#SDernierMiroirAme","GLOBAL",5)~ THEN BEGIN SequenceFinTob2
SAY @201200 = @201201
IF ~~ THEN EXTERN ~#SValy25~ EnvoyerReve
END

IF ~~ THEN BEGIN CoeurReconnaissance
SAY @201203
IF ~~ THEN EXTERN ~#SValy25~ QuelqueChoseVa
END

IF ~~ THEN BEGIN EchecInacceptable
SAY @201205
IF ~~ THEN EXTERN ~#SValy25~ VousRamener
END


////// INTERJECTIONS \\\\\\

// VOLO

IF ~~ THEN BEGIN SeverVolo2
SAY @900023
IF ~~ THEN EXTERN SARVOLO 9
END

// SALADREX, DRAGON DE LA TOUR DE GARDE

INTERJECT_COPY_TRANS GORSAL 0 SeverSaladrex
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600270
END

// HELMITES

INTERJECT_COPY_TRANS GORODR1 12 SeverOdren
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600271
END

// CARSTON

INTERJECT_COPY_TRANS GORCAR 0 SeverCarston
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600272
END

// DEMOGORGON, FORME INVISIBLE

INTERJECT_COPY_TRANS GORDEMO 0 SeverDemogorgon1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600273
END


// ILLASERA

INTERJECT_COPY_TRANS ILLASERA 0 SeverIllasera
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900000
  == ILLASERA    IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900001
END

// SOLAIRE - 1ERE RENCONTRE

INTERJECT_COPY_TRANS SOLAR 1 SeverSolar1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900007
END

// SAREVOK LE RETOUR

INTERJECT_COPY_TRANS SAREV25A 3 SeverSAREV25A
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900002
  == SAREV25A    IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900003
   == "#Sev25J"  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900004
  == SAREV25A    IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900005
END

// CESPENAR

INTERJECT_COPY_TRANS BOTSMITH 0 SeverCespenar
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900006
END


// SEQUENCE SARADUSH 

// MELISSANNE - 1ERE RENCONTRE

INTERJECT_COPY_TRANS SARMEL01 7 SeverAmelyssanne1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900008
END

// ORPHELIN SARADUSH

INTERJECT_COPY_TRANS ORPHAN1 3 SeverOrphelin1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900009 = @900010
  == ORPHAN1   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900011
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900136
  == ORPHAN1   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900137
 == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900138
END

// SERVEUSE SARADUSH


INTERJECT_COPY_TRANS SARWAI01 1 SeverServeuseSaradush
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900012 
END

// PELTJE 

INTERJECT_COPY_TRANS SARPEL01 0 SeverPeltje
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900015
END

// SERVEUR SARADUSH

INTERJECT_COPY_TRANS SARBAR02 0 SeverServeurSaradush1
  == "#Sev25J"   IF ~Gender(Protagonist,MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900016
END

// SERVEUR SARADUSH

INTERJECT_COPY_TRANS SARBAR02 0 SeverServeurSaradush2
  == "#Sev25J"   IF ~Gender(Protagonist,FEMALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900017
   == SARBAR02   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900130
  == "#Sev25J"   IF ~Gender(Protagonist,FEMALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900131
 == SARBAR02   IF ~Gender(Protagonist,FEMALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900132
  == SARBAR02   IF ~Gender(Protagonist,FEMALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900133
END

// PROSTITUEE SARADUSH

INTERJECT_COPY_TRANS SARPRO01 0 SeverProstitueeSaradush1
  == "#Sev25J"   IF ~Gender(Protagonist,MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900024
END

INTERJECT_COPY_TRANS SARPRO01 1 SeverProstitueeSaradush2
  == "#Sev25J"   IF ~OR(2)
Global("#SeverRomanceActive","GLOBAL",1) 
Global("#SeverRomanceActive","GLOBAL",3)  
Gender(Protagonist,FEMALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900024
END

INTERJECT_COPY_TRANS SARPRO01 1 SeverProstitueeSaradush3
  == "#Sev25J"   IF ~Global("#SeverRomanceActive","GLOBAL",2) Gender(Protagonist,FEMALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900025
END

// SQUIP SARADUSH

INTERJECT_COPY_TRANS SARTHF2 2 SeverSquip
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900026
END

// SOLDAT DE GROMNIR

INTERJECT_COPY_TRANS SARBUL05 0 SeverSoldatGromnir
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900027
END

// HECTAN

INTERJECT_COPY_TRANS SARTHF1 3 SeverHectan1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900028
END

INTERJECT_COPY_TRANS SARTHF1 6 SeverHectan2
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900034
END

// ORIS FOURBEDOIGTS


INTERJECT_COPY_TRANS SARBHA02 1 SeverOrisFourbedoigts
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900029
END

// PHLYDIAN


INTERJECT_COPY_TRANS SARVAM01 0 SeverPhlydian
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900030
END

// GROMNIR IL-KHAN

INTERJECT_COPY_TRANS GROMNIR 2 SeverGromnir1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900031
END

INTERJECT_COPY_TRANS GROMNIR 7 SeverGromnir2
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900032
   == GROMNIR   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900033
 == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900134
  == GROMNIR   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900135
END

// SEQUENCE YAGA-SHURA

// APPARITION GORION

INTERJECT_COPY_TRANS HGWRA01 0 SeverGorion1
  == "#Sev25J"   IF ~Gender(Protagonist,MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900035
END

INTERJECT_COPY_TRANS HGWRA01 0 SeverGorion2
  == "#Sev25J"   IF ~Gender(Protagonist,FEMALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900036
END

INTERJECT_COPY_TRANS HGWRA01 27 SeverGorion3
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900037
END

INTERJECT_COPY_TRANS HGWRA01 28 SeverGorion4
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900037
END


// NYALEE PREMIERE RENCONTRE

INTERJECT_COPY_TRANS HGNYA01 1 SeverNyalee1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900038
END

INTERJECT_COPY_TRANS HGNYA01 21 SeverNyalee2
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900039
END

INTERJECT_COPY_TRANS HGNYA01 27 SeverNyalee3
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900040
END

INTERJECT_COPY_TRANS HGNYA01 29 SeverNyalee4
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900041
END

// YAGA-SHURA

INTERJECT_COPY_TRANS YAGA01 3 SeverYagaShura
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900042 = @900043
   == YAGA01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900044
END

// SEQUENCE AMKETHRAN

// GENERAL JAMIS TOMBELTHEN

INTERJECT_COPY_TRANS AMTGEN01 1 SeverJamis
  == AMTGEN01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900045
   == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900046
  == AMTGEN01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900047
END

// BALTHAZAR PREMIERE RENCONTRE

INTERJECT_COPY_TRANS BALTH 0 SeverBalthazar1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900048
    == BALTH   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900049
END

// GARCON GROTTE

INTERJECT_COPY_TRANS AMGRAV01 1 SeverGarconGrotte
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900050
END

// OMAR HARAAD

INTERJECT_COPY_TRANS AMMAYOR 3 SeverOmar
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900051
END

// ZAKEE RAFEHA

INTERJECT_COPY_TRANS AMBAR01 0 SeverZakee
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900052
END

// SAEMON HAVARIAN PREMIERE RENCONTRE

INTERJECT_COPY_TRANS AMSAEMON 1 SeverSaemon1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900053
   == AMSAEMON   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900054
   == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900055
   == AMSAEMON   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900056
END

INTERJECT_COPY_TRANS AMSAEMON 7 SeverSaemon2
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900057
   == AMSAEMON   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900058
END

// MARLOWE

INTERJECT_COPY_TRANS MARLOWE 21 SeverMarlowe
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900059
END

// VONGOETHE

INTERJECT_COPY_TRANS AMLICH01 26 SeverVongoethe
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900060
   == AMLICH01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900061
   == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900062
END

// SEQUENCE ENCLAVE DE SENDAI

// BUCHERON

INTERJECT_COPY_TRANS SENGUA01 11 SeverBucheron1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900063
END

INTERJECT_COPY_TRANS SENGUA01 19 SeverBucheron2
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900064
END

// DIAYTHA

INTERJECT_COPY_TRANS SENPRI 2 SeverDiaytha1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900065
  == SENPRI   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900066
END

// CAPITAIN EGEISSAG

INTERJECT_COPY_TRANS SENGUA03 4 SeverEgeissag1
  == "#Sev25J"   IF ~Gender(Protagonist, MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900067
END

INTERJECT_COPY_TRANS SENGUA03 4 SeverEgeissag2
  == "#Sev25J"   IF ~Gender(Protagonist, FEMALE) 
OR(2)
Global("#SeverRomanceActive","GLOBAL",1) 
Global("#SeverRomanceActive","GLOBAL",3) 
 InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900068
END

INTERJECT_COPY_TRANS SENGUA03 4 SeverEgeissag3
  == "#Sev25J"   IF ~Gender(Protagonist, FEMALE) Global("#SeverRomanceActive","GLOBAL",2) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900069= @900070
END

INTERJECT_COPY_TRANS SENDAI 14 SeverSendai
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900071
  == SENDAI   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900072
END


// SEQUENCE ANTRE D'ABAZIGAL

// DRACONIS

INTERJECT_COPY_TRANS BAZDRA01 5 SeverDraconis2
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900073 = @900074
END

// LYCANTH LE FOU

INTERJECT_COPY_TRANS BAZEYE01 0 SeverLycanth1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900075
  == BAZEYE01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900076
   == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900077
END

INTERJECT_COPY_TRANS BAZEYE01 2 SeverLycanth2
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900078
  == BAZEYE01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900079
END

// BONDARI

INTERJECT_COPY_TRANS BAZPAT01 16 SeverBondari
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900080
  == BAZPAT01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900081
   == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900082
  == BAZPAT01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900083
END

// FLL'YISSETAT

INTERJECT_COPY_TRANS BAZDRA03 5 SeverFlliyssetat
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900084
END

// ABAZIGAL

INTERJECT_COPY_TRANS ABAZIGAL 0 SeverAbazigal1
  == "#Sev25J"   IF ~Gender(Protagonist,FEMALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900085 = @900086
END

INTERJECT_COPY_TRANS ABAZIGAL 0 SeverAbazigal2
  == "#Sev25J"   IF ~Gender(Protagonist,MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900085 = @900087
END

// SEQUENCE BALTHAZAR

// ELMINSTER

INTERJECT_COPY_TRANS AMELM01 0 SeverElminster1
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900088
END

INTERJECT_COPY_TRANS AMELM01 13 SeverElminster2
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900089
  == AMELM01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900090
END


// SAEMON HAVARIAN DEUXIEME RENCONTRE

INTERJECT_COPY_TRANS AMSAEMON 8 SeverSaemon3
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900091
   == AMSAEMON   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900092
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900093
END

INTERJECT_COPY_TRANS AMSAEMON 32 SeverSaemon4
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900094
END


// BALTHAZAR

INTERJECT_COPY_TRANS BALTH 12 SeverBalthazar2
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900095
END

// KARTHIS AL HEZZAR 

INTERJECT_COPY_TRANS HGKAR01 9 SeverKarthis
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900130
 == HGKAR01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900131
 == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900122
 == HGKAR01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900123
 == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900124
 == HGKAR01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900125
 == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900126
 == HGKAR01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900127
 == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900128
 == HGKAR01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900129
END

// MELISSANNE FIN

INTERJECT_COPY_TRANS FINMEL01 1 SeverMelissanneFin1
  == "#Sev25J"   IF ~Gender(Protagonist,FEMALE) 
OR(2)
Global("#SeverRomanceActive","GLOBAL",1) 
Global("#SeverRomanceActive","GLOBAL",3)  
InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900096
  == FINMEL01    IF ~Gender(Protagonist,FEMALE)
OR(2)
Global("#SeverRomanceActive","GLOBAL",1) 
Global("#SeverRomanceActive","GLOBAL",3) 
 InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900097
END

INTERJECT_COPY_TRANS FINMEL01 1 SeverMelissanneFin2
  == "#Sev25J"   IF ~Gender(Protagonist,MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900096
  == FINMEL01    IF ~Gender(Protagonist,MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900097
END

INTERJECT_COPY_TRANS FINMEL01 1 SeverMelissanneFin3
  == "#Sev25J"   IF ~Gender(Protagonist,FEMALE) Global("#SeverRomanceActive","GLOBAL",2) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900096
  == FINMEL01    IF ~Gender(Protagonist,FEMALE) Global("#SeverRomanceActive","GLOBAL",2) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900098
END

INTERJECT_COPY_TRANS FINMEL01 7 SeverMelissanneFin4
  == "#Sev25J"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900099
END

// SOLAIRE FIN

INTERJECT_COPY_TRANS FINSOL01 27 SeverSolaire2
  == "#Sev25J"   IF ~Gender(Protagonist,FEMALE) Global("#SeverRomanceActive","GLOBAL",2) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900100 = @900101 = @900102 = @900121 = @900103
END

INTERJECT_COPY_TRANS FINSOL01 27 SeverSolaire3
  == "#Sev25J"   IF ~Gender(Protagonist,FEMALE) 
OR(2)
Global("#SeverRomanceActive","GLOBAL",1) 
Global("#SeverRomanceActive","GLOBAL",3) 
 InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900104
END

INTERJECT_COPY_TRANS FINSOL01 27 SeverSolaire4
  == "#Sev25J"   IF ~Gender(Protagonist,MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900105
END

INTERJECT_COPY_TRANS FINSOL01 33 SeverSolaire5
  == "#Sev25J"   IF ~Global("PlayerChoseEssence","GLOBAL",0) Gender(Protagonist,MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900106
END

INTERJECT_COPY_TRANS FINSOL01 33 SeverSolaire6
  == "#Sev25J"   IF ~Global("PlayerChoseEssence","GLOBAL",0) Gender(Protagonist,FEMALE) 
OR(2)
Global("#SeverRomanceActive","GLOBAL",1) 
Global("#SeverRomanceActive","GLOBAL",3) 
 InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900107
END

INTERJECT_COPY_TRANS FINSOL01 33 SeverSolaire7
  == "#Sev25J"   IF ~Global("PlayerChoseEssence","GLOBAL",0) Gender(Protagonist,FEMALE) Global("#SeverRomanceActive","GLOBAL",2) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900108 = @900120
END

INTERJECT_COPY_TRANS FINSOL01 33 SeverSolaire8
  == "#Sev25J"   IF ~Global("PlayerChoseEssence","GLOBAL",1) Gender(Protagonist,FEMALE) 
OR(2)
Global("#SeverRomanceActive","GLOBAL",1) 
Global("#SeverRomanceActive","GLOBAL",3) 
 InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900110
END

INTERJECT_COPY_TRANS FINSOL01 33 SeverSolaire9
  == "#Sev25J"   IF ~Global("PlayerChoseEssence","GLOBAL",1) Gender(Protagonist,MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900111
END


INTERJECT_COPY_TRANS FINSOL01 33 SeverSolaire10
  == "#Sev25J"   IF ~OR(3)Alignment(Player1,LAWFUL_GOOD)
                          Alignment(Player1,NEUTRAL_GOOD)
                          Alignment(Player1,CHAOTIC_GOOD)
                          Global("PlayerChoseEssence","GLOBAL",1) Gender(Protagonist,FEMALE) Global("#SeverRomanceActive","GLOBAL",2) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @900112 = @900113
END

INTERJECT_COPY_TRANS FINSOL01 33 SeverSolaire11
  == "#Sev25J"   IF ~OR(3)Alignment(Player1,LAWFUL_NEUTRAL)
                          Alignment(Player1,NEUTRAL)
                          Alignment(Player1,CHAOTIC_NEUTRAL)
                          Global("PlayerChoseEssence","GLOBAL",1) Gender(Protagonist,FEMALE) Global("#SeverRomanceActive","GLOBAL",2) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @900112 = @900114
END

// VOLOTHAMP GEDDARM SARADUSH

EXTEND_BOTTOM SARVOLO 9
IF ~Gender(Protagonist,FEMALE) Global("#SeverRomanceActive","GLOBAL",2) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN REPLY @900018 EXTERN SARVOLO SeverVolo1
END

EXTEND_BOTTOM SARVOLO 9
IF ~Gender(Protagonist,MALE) InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN REPLY @900018 EXTERN SARVOLO SeverVolo4
END

EXTEND_BOTTOM SARVOLO 9
IF ~Gender(Protagonist,FEMALE)
OR(2)
Global("#SeverRomanceActive","GLOBAL",1)
Global("#SeverRomanceActive","GLOBAL",3)
InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN REPLY @900018 EXTERN SARVOLO SeverVolo4
END

APPEND SARVOLO

IF ~~ THEN BEGIN SeverVolo1
SAY @900139 = @900022
IF ~~ THEN EXTERN ~#Sev25J~ SeverVolo2
END

IF ~~ THEN BEGIN SeverVolo4
SAY @900020
IF ~~ THEN EXTERN ~#Sev25J~ SeverVolo2
END

END

APPEND ~SAREV25J~


IF ~Global("#SeverTalkSarevokToB","GLOBAL",3)~ THEN BEGIN SarevokTueSeverian
SAY @210115
IF ~~ THEN REPLY @210116 GOTO RendreService
IF ~~ THEN REPLY @210117 GOTO SoufflerBougie
IF ~~ THEN REPLY @210118 GOTO AinsiSoit
IF ~~ THEN REPLY @210119 GOTO DernierSouffle
END

IF ~~ THEN BEGIN RendreService
SAY @210123
IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",4)~ EXIT
END

IF ~~ THEN BEGIN SoufflerBougie
SAY @210122
IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",4)~ EXIT
END

IF ~~ THEN BEGIN AinsiSoit
SAY @210121
IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",4)
               LeaveParty()
               EscapeArea()~ EXIT
END


IF ~~ THEN BEGIN DernierSouffle
SAY @210120
IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",4)
               LeaveParty()
               Enemy()
               Attack(Player1)~ EXIT
END

END

APPEND ~#SValy25~

 IF ~~ THEN BEGIN EnvoyerReve
 SAY @201202
 IF ~~ THEN EXTERN ~#Sev25J~ CoeurReconnaissance
 END

 IF ~~ THEN BEGIN QuelqueChoseVa
 SAY @201204
 IF ~~ THEN EXTERN ~#Sev25J~ EchecInacceptable
 END

 IF ~~ THEN BEGIN VousRamener
 SAY @201206 = @201207
 IF ~~ THEN DO ~StartCutSceneMode()
                StartCutScene("#SCutFi7")~ EXIT
END


END

