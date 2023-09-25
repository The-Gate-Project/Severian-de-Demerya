BEGIN ~#Sev25R~


// ROMANCE TOB
// DIALOGUE INITIAL

IF ~Global("#Sev25LoveTlk","GLOBAL",2)~ THEN BEGIN SeverianRomanceTob1
SAY @200001
IF ~~ THEN REPLY @200002 GOTO AirInquiet
IF ~~ THEN REPLY @200003 GOTO Declarations
IF ~~ THEN REPLY @200004 GOTO TousFatigues
END

IF ~~ THEN BEGIN AirInquiet
SAY @200015 = @200016
IF ~~ THEN REPLY @200017 GOTO PasHasard
IF ~~ THEN REPLY @200021 GOTO Encourageante
IF ~~ THEN REPLY @200023 GOTO AirMeprisant
END

IF ~~ THEN BEGIN PasHasard
SAY @200018 = @200026 = @200019
IF ~~ THEN DO ~SetGlobal("#Sev25LoveTlk","GLOBAL",3)
               SetGlobal("#SClicTalkTob","GLOBAL",1)
               AddJournalEntry(@900150,INFO)
               SetDialog("#Sev25J")~ EXIT
END


IF ~~ THEN BEGIN Encourageante
SAY @200022 = @200026 = @200019
IF ~~ THEN DO ~SetGlobal("#Sev25LoveTlk","GLOBAL",3)
               SetGlobal("#SClicTalkTob","GLOBAL",1)
               AddJournalEntry(@900150,INFO)
               SetDialog("#Sev25J")~ EXIT
END


IF ~~ THEN BEGIN AirMeprisant
SAY @200024
IF ~~ THEN DO ~SetDialog("#Sev25J")
               SetGlobal("#SeverRomanc eActive","GLOBAL",3)
               SetGlobal("#Sev25LoveTlk","GLOBAL",-1)
               SetGlobal("#SClicTalkTob","GLOBAL",-1)~ EXIT
END

IF ~~ THEN BEGIN Declarations
SAY @200025 = @200016
IF ~~ THEN REPLY @200017 GOTO PasHasard
IF ~~ THEN REPLY @200021 GOTO Encourageante
IF ~~ THEN REPLY @200023 GOTO AirMeprisant
END

IF ~~ THEN BEGIN TousFatigues
SAY @200005
IF ~~ THEN REPLY @200010 GOTO Brigander
IF ~~ THEN REPLY @200011 GOTO Desarconne
END

IF ~~ THEN BEGIN Brigander
SAY @200020 = @200016
IF ~~ THEN REPLY @200017 GOTO PasHasard
IF ~~ THEN REPLY @200021 GOTO Encourageante
IF ~~ THEN REPLY @200023 GOTO AirMeprisant
END

IF ~~ THEN BEGIN Desarconne
SAY @200012
IF ~~ THEN REPLY @200013 GOTO InfinimentTriste
END

IF ~~ THEN BEGIN InfinimentTriste
SAY @200014
IF ~~ THEN DO ~LeaveParty()
               EscapeArea()~ EXIT
END



// APRES DEPART DU MASK A SARADUSH

IF ~Global("#SeverianMask","GLOBAL",4)~ THEN BEGIN RencontreMask
SAY @200062
IF ~~ THEN REPLY @200063 GOTO PaleMort
IF ~~ THEN REPLY @200064 GOTO Gredin
IF ~~ THEN REPLY @200065 GOTO Enigmes
END

IF ~~ THEN BEGIN PaleMort
SAY @200066
IF ~~ THEN DO ~SetGlobal("#SeverianMask","GLOBAL",5)
               SetGlobal("#SClicTalkTob","GLOBAL",2)
               AddJournalEntry(@900151,INFO)
               SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN Gredin
SAY @200068
IF ~~ THEN DO ~SetGlobal("#SeverianMask","GLOBAL",5)
               SetGlobal("#SClicTalkTob","GLOBAL",2)
               AddJournalEntry(@900151,INFO)
               SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN Enigmes
SAY @200067
IF ~~ THEN DO ~SetGlobal("#SeverianMask","GLOBAL",5)
               SetGlobal("#SClicTalkTob","GLOBAL",2)
               AddJournalEntry(@900151,INFO)
               SetDialog("#Sev25J")~ EXIT
END

// ROMANCE DIALOGUE 2
// SI PAS AUBERGE SARADUSH

IF ~Global("#Sev25LoveTlk","GLOBAL",4)
    !Global("#SJolentaSeverian","GLOBAL",7)~ THEN BEGIN SeverianRomanceTob2
SAY @200080 = @206330
IF ~~ THEN REPLY @206320 GOTO ImmenseDette
IF ~~ THEN REPLY @206321 GOTO Doigt2
IF ~~ THEN REPLY @206322 GOTO Egoisme2
END

IF ~~ THEN BEGIN Egoisme2
SAY @206323 
IF ~~ THEN REPLY @206301 GOTO SonSujet
IF ~~ THEN REPLY @206302 GOTO QuelleVerite
IF ~~ THEN REPLY @206303 GOTO DenoncerGarnison
END

IF ~~ THEN BEGIN ImmenseDette
SAY @206324 
IF ~~ THEN REPLY @206301 GOTO SonSujet
IF ~~ THEN REPLY @206302 GOTO QuelleVerite
IF ~~ THEN REPLY @206303 GOTO DenoncerGarnison
END

IF ~~ THEN BEGIN Doigt2
SAY @206325 
IF ~~ THEN REPLY @206301 GOTO SonSujet
IF ~~ THEN REPLY @206302 GOTO QuelleVerite
IF ~~ THEN REPLY @206303 GOTO DenoncerGarnison
END

IF ~~ THEN BEGIN SonSujet
SAY @206304 = @206307
IF ~~ THEN REPLY @206075 GOTO ArmeImpuissante
IF ~~ THEN REPLY @206076 GOTO EntitesSuperieures
IF ~~ THEN REPLY @206077 GOTO FermerYeux
END

IF ~~ THEN BEGIN FermerYeux
SAY @206078 = @206308
IF ~~ THEN REPLY @206083 GOTO FinDia1
IF ~~ THEN REPLY @206084 GOTO FinDia2
IF ~~ THEN REPLY @206085 GOTO FinDia3
END

IF ~~ THEN BEGIN FinDia1
SAY @206311 = @206326
IF ~~ THEN REPLY @206327 GOTO IgnoreTourne
END

IF ~~ THEN BEGIN FinDia2
SAY @206310 = @206326
IF ~~ THEN REPLY @206327 GOTO IgnoreTourne
END

IF ~~ THEN BEGIN FinDia3
SAY @206309 = @206326
IF ~~ THEN REPLY @206327 GOTO IgnoreTourne
END

IF ~~ THEN BEGIN ArmeImpuissante
SAY @206075 = @206308
IF ~~ THEN REPLY @206083 GOTO FinDia1
IF ~~ THEN REPLY @206084 GOTO FinDia2
IF ~~ THEN REPLY @206085 GOTO FinDia3
END
 

IF ~~ THEN BEGIN EntitesSuperieures
SAY @206080 = @206308
IF ~~ THEN REPLY @206083 GOTO FinDia1
IF ~~ THEN REPLY @206084 GOTO FinDia2
IF ~~ THEN REPLY @206085 GOTO FinDia3
END

IF ~~ THEN BEGIN QuelleVerite
SAY @206305 = @206307
IF ~~ THEN REPLY @206075 GOTO ArmeImpuissante
IF ~~ THEN REPLY @206076 GOTO EntitesSuperieures
IF ~~ THEN REPLY @206077 GOTO FermerYeux
END

IF ~~ THEN BEGIN DenoncerGarnison
SAY @206306 = @206307
IF ~~ THEN REPLY @206075 GOTO ArmeImpuissante
IF ~~ THEN REPLY @206076 GOTO EntitesSuperieures
IF ~~ THEN REPLY @206077 GOTO FermerYeux
END

// ROMANCE DIALOGUE 2
// SI AUBERGE SARADUSH


IF ~Global("#Sev25LoveTlk","GLOBAL",4)
    Global("#SJolentaSeverian","GLOBAL",7)~ THEN BEGIN SeverianRomanceTobBis
SAY @200080 = @206330
IF ~~ THEN REPLY @206320 GOTO DetteImmense
IF ~~ THEN REPLY @206321 GOTO Doigt
IF ~~ THEN REPLY @206322 GOTO Egoisme
END

IF ~~ THEN BEGIN Egoisme
SAY @206323 = @206326
IF ~~ THEN REPLY @206327 GOTO IgnoreTourne
END

IF ~~ THEN BEGIN DetteImmense
SAY @206324 = @206326
IF ~~ THEN REPLY @206327 GOTO IgnoreTourne
END

IF ~~ THEN BEGIN Doigt
SAY @206325 = @206326
IF ~~ THEN REPLY @206327 GOTO IgnoreTourne
END

IF ~~ THEN BEGIN IgnoreTourne
SAY @206328
IF ~~ THEN REPLY @206329 DO ~ActionOverride(Player2,MakeUnselectable(50000))
                             ActionOverride(Player3,MakeUnselectable(50000))
                             ActionOverride(Player4,MakeUnselectable(50000))
                             ActionOverride(Player5,MakeUnselectable(50000))
                             ActionOverride(Player6,MakeUnselectable(50000))
                             SetGlobal("#Sev25LoveTlk","GLOBAL",5)
                             ClearAllActions()
                             StorePartyLocations()
                             SetDialog("#Sev25J")
                             StartCutSceneMode()
                             StartCutScene("#SCutMi1")~ EXIT
END



// APRES MIROIR DE L'AME 1

IF ~Global("#SeverMiroirAme","GLOBAL",3)~ THEN BEGIN MiroirAme1
SAY @200108
IF ~~ THEN REPLY @200109 GOTO Inutile
IF ~~ THEN REPLY @200110 GOTO Verite
IF ~~ THEN REPLY @200111 GOTO UneSeconde
END

IF ~~ THEN BEGIN UneSeconde
SAY @200114
IF ~~ THEN DO ~SetGlobal("#SeverMiroirAme","GLOBAL",4)
               AddJournalEntry(@900153,INFO)
               SetGlobal("#Sev25LoveTlk","GLOBAL",5)
               SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN Verite
SAY @200112
IF ~~ THEN DO ~SetGlobal("#SeverMiroirAme","GLOBAL",4)
               AddJournalEntry(@900153,INFO)
               SetGlobal("#Sev25LoveTlk","GLOBAL",5)
               SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN Inutile
SAY @200113
IF ~~ THEN DO ~SetGlobal("#SeverMiroirAme","GLOBAL",4)
               AddJournalEntry(@900153,INFO)
               SetGlobal("#Sev25LoveTlk","GLOBAL",5)
               SetDialog("#Sev25J")~ EXIT
END


// ROMANCE DIALOGUE 3

IF ~Global("#SeverYohnLeBronze","GLOBAL",1)~ THEN BEGIN SeverianRomanceTob3
SAY @200120 = @200144
IF ~~ THEN REPLY @200121 GOTO FaireMal
IF ~~ THEN REPLY @200122 GOTO Mijoter
IF ~~ THEN REPLY @200123 GOTO AffaireGeants
END

IF ~~ THEN BEGIN FaireMal
SAY @200124
IF ~~ THEN REPLY @200127 GOTO EhBien1
IF ~~ THEN REPLY @200128 GOTO EhBien2
IF ~~ THEN REPLY @200129 GOTO Incomprehension
END

IF ~~ THEN BEGIN Mijoter
SAY @200125
IF ~~ THEN REPLY @200127 GOTO EhBien1
IF ~~ THEN REPLY @200128 GOTO EhBien2
IF ~~ THEN REPLY @200129 GOTO Incomprehension
END

IF ~~ THEN BEGIN AffaireGeants
SAY @200126
IF ~~ THEN REPLY @200127 GOTO EhBien1
IF ~~ THEN REPLY @200128 GOTO EhBien2
IF ~~ THEN REPLY @200129 GOTO Incomprehension
END

IF ~~ THEN BEGIN Incomprehension
SAY @200130
IF ~~ THEN REPLY @200131 GOTO DemandeSoutien
IF ~~ THEN REPLY @200132 GOTO BlesseMort
END

IF ~~ THEN BEGIN BlesseMort
SAY @200133
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN DemandeSoutien
SAY @200134 = @200138
IF ~~ THEN REPLY @200139 GOTO Sceller
IF ~~ THEN REPLY @200140 GOTO Tronc
IF ~~ THEN REPLY @200141 GOTO Tronc
END

IF ~~ THEN BEGIN Sceller
SAY @200143
IF ~~ THEN DO ~AddJournalEntry(@900154,INFO)
               SetGlobal("#SeverYohnLeBronze","GLOBAL",2)
               SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN Tronc
SAY @200142
IF ~~ THEN DO ~AddJournalEntry(@900154,INFO)
               SetGlobal("#SeverYohnLeBronze","GLOBAL",2)
               SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN EhBien1
SAY @200135 = @200138
IF ~~ THEN REPLY @200139 GOTO Sceller
IF ~~ THEN REPLY @200140 GOTO Tronc
IF ~~ THEN REPLY @200141 GOTO Tronc
END


IF ~~ THEN BEGIN EhBien2
SAY @200136 = @200137 = @200138
IF ~~ THEN REPLY @200139 GOTO Sceller
IF ~~ THEN REPLY @200140 GOTO Tronc
IF ~~ THEN REPLY @200141 GOTO Tronc
END






// CAMP DES BANDITS

IF ~Global("#SeverYohnLeBronze","GLOBAL",11)~ THEN BEGIN CampDesBandits1
SAY @252150
IF ~~ THEN REPLY @252151 GOTO QuitterCalimshan
IF ~~ THEN REPLY @252152 GOTO FierApparence
IF ~~ THEN REPLY @252153 GOTO VulgaireMorveux
END

IF ~~ THEN BEGIN FierApparence
SAY @252157 = @252155 = @252156
IF ~~ THEN REPLY @252158 GOTO Promesses1
IF ~~ THEN REPLY @252159 GOTO Promesses2
IF ~~ THEN REPLY @252160 GOTO MeilleurEpeiste
END


IF ~~ THEN BEGIN VulgaireMorveux
SAY @252154 = @252155 = @252156
IF ~~ THEN REPLY @252158 GOTO Promesses1
IF ~~ THEN REPLY @252159 GOTO Promesses2
IF ~~ THEN REPLY @252160 GOTO MeilleurEpeiste
END

IF ~~ THEN BEGIN QuitterCalimshan
SAY @252155 = @252156
IF ~~ THEN REPLY @252158 GOTO Promesses1
IF ~~ THEN REPLY @252159 GOTO Promesses2
IF ~~ THEN REPLY @252160 GOTO MeilleurEpeiste
END

IF ~~ THEN BEGIN Promesses1
SAY @252162
IF ~~ THEN DO ~AddJournalEntry(@900155,INFO)
               SetGlobal("#SeverYohnLeBronze","GLOBAL",12)
               SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN Promesses2
SAY @252163
IF ~~ THEN DO ~AddJournalEntry(@900155,INFO)
               SetGlobal("#SeverYohnLeBronze","GLOBAL",12)
               SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN MeilleurEpeiste
SAY @252161
IF ~~ THEN DO ~AddJournalEntry(@900155,INFO)
               SetGlobal("#SeverYohnLeBronze","GLOBAL",12)
               SetDialog("#Sev25J")~ EXIT
END


// SECOND MIROIR DE L'AME

IF ~Global("#SecondMiroirAme","GLOBAL",1)~ THEN BEGIN SecondMiroirAme
SAY @200230 = @253228
IF ~~ THEN REPLY @200231 DO ~SetGlobal("#SecondMiroirAme","GLOBAL",2)
                             StorePartyLocations()
                             ActionOverride(Player2,MakeUnselectable(50000))
                             ActionOverride(Player3,MakeUnselectable(50000))
                             ActionOverride(Player4,MakeUnselectable(50000))
                             ActionOverride(Player5,MakeUnselectable(50000))
                             ActionOverride(Player6,MakeUnselectable(50000))
                             ClearAllActions()
                             SetDialog("#Sev25J")
                             StartCutSceneMode()
                             StartCutScene("#SCutMi2")~ EXIT
IF ~~ THEN REPLY @200232 DO ~SetGlobal("#SecondMiroirAme","GLOBAL",2)
                             StorePartyLocations()
                             ActionOverride(Player2,MakeUnselectable(50000))
                             ActionOverride(Player3,MakeUnselectable(50000))
                             ActionOverride(Player4,MakeUnselectable(50000))
                             ActionOverride(Player5,MakeUnselectable(50000))
                             ActionOverride(Player6,MakeUnselectable(50000))
                             ClearAllActions()
                             SetDialog("#Sev25J")
                             StartCutSceneMode()
                             StartCutScene("#SCutMi2")~ EXIT
IF ~~ THEN REPLY @200233 DO ~SetGlobal("#SecondMiroirAme","GLOBAL",2)
                             StorePartyLocations()
                             ActionOverride(Player2,MakeUnselectable(50000))
                             ActionOverride(Player3,MakeUnselectable(50000))
                             ActionOverride(Player4,MakeUnselectable(50000))
                             ActionOverride(Player5,MakeUnselectable(50000))
                             ActionOverride(Player6,MakeUnselectable(50000))
                             ClearAllActions()
                             SetDialog("#Sev25J")
                             StartCutSceneMode()
                             StartCutScene("#SCutMi2")~ EXIT
END

IF ~Global("#SecondMiroirAme","GLOBAL",18)~ THEN BEGIN SecondMiroirAme2
SAY @200270 = @200271 
IF ~~ THEN DO ~AddJournalEntry(@900158,INFO)
               AddJournalEntry(@920158,INFO)
               SetGlobal("#SecondMiroirAme","GLOBAL",19)
               SetGlobal("#SPetitLoup","GLOBAL",1)
               SetDialog("#Sev25J")~ EXIT
END




// APRES MORT DE YAGA-SHURA



// APRES JON

IF ~Global("#SYagaShuraKill","GLOBAL",8)~ THEN BEGIN Ressentiment
SAY @200350 = @200351 = @200352
IF ~~ THEN DO ~SetGlobal("#SYagaShuraKill","GLOBAL",9)
               SetGlobal("#STroisiemeMiroirAme","GLOBAL",2)
               StorePartyLocations()
               ActionOverride(Player2,MakeUnselectable(50000))
               ActionOverride(Player3,MakeUnselectable(50000))
               ActionOverride(Player4,MakeUnselectable(50000))
               ActionOverride(Player5,MakeUnselectable(50000))
               ActionOverride(Player6,MakeUnselectable(50000))
               ClearAllActions()
               SetDialog("#Sev25J")
               StartCutSceneMode()
               StartCutScene("#SCutMi3")~ EXIT
END


// RETOUR MIROIR DE L'AME 3

IF ~Global("#STroisiemeMiroirAme","GLOBAL",12)~ THEN BEGIN TroisiemeMiroirAme2
SAY @200450
IF ~~ THEN REPLY @200451 GOTO Blesse
IF ~~ THEN REPLY @200452 GOTO Blesse
IF ~~ THEN REPLY @200453 GOTO Furibond
END

IF ~~ THEN BEGIN Furibond
SAY @200454 = @200457
IF ~~ THEN DO ~AddJournalEntry(@915161,INFO)
               SetGlobal("#STroisiemeMiroirAme","GLOBAL",13)
               SetGlobal("#SApparitionVoloAmkehtranFeu","GLOBAL",1)
               SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN Blesse
SAY @200455 = @200456 
IF ~~ THEN DO ~AddJournalEntry(@915162,INFO)
               SetGlobal("#STroisiemeMiroirAme","GLOBAL",13)
               SetGlobal("#SApparitionVoloAmkehtranFeu","GLOBAL",1)
               SetDialog("#Sev25J")~ EXIT
END



// SEQUENCE AMKETHRAN
// MAPS ABAZIGAL OU SENDAI

IF ~Global("#SequenceAmkethran","GLOBAL",1)~ THEN BEGIN SequenceAmkethran1
SAY @200750
IF ~~ THEN REPLY @263750 GOTO MaryaneNaive
IF ~~ THEN REPLY @263751 GOTO MaryaneNaive
IF ~~ THEN REPLY @263752 GOTO BeaucoupAppris
END


IF ~~ THEN BEGIN BeaucoupAppris
SAY @263753
IF ~~ THEN DO ~SetGlobal("#SequenceAmkethran","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN MaryaneNaive
SAY @263754 = @263755 = @263756
IF ~~ THEN REPLY @263757 GOTO ApprocheFin
IF ~~ THEN REPLY @263758 GOTO ApprocheFin
IF ~~ THEN REPLY @263759 GOTO TuEsMonstrueux
END

IF ~~ THEN BEGIN TuEsMonstrueux
SAY @263762 
IF ~~ THEN REPLY @263763 GOTO ApprocheFin
IF ~~ THEN REPLY @263764 GOTO RienAAjouter
END

IF ~~ THEN BEGIN RienAAjouter
SAY @263765
IF ~~ THEN DO ~SetGlobal("#SequenceAmkethran","GLOBAL",2)~ EXIT
END


IF ~~ THEN BEGIN ApprocheFin
SAY @263760 = @263761
IF ~~ THEN REPLY @263766 GOTO AvecVehemence
IF ~~ THEN REPLY @263767 GOTO AvecVehemence
IF ~~ THEN REPLY @263768 GOTO AvecVehemence
END

IF ~~ THEN BEGIN AvecVehemence
SAY @263769
IF ~~ THEN REPLY @263770 GOTO PasPrescience
IF ~~ THEN REPLY @263771 GOTO IneffableReconnaissance
IF ~~ THEN REPLY @263772 GOTO ObserverGlacial
END

IF ~~ THEN BEGIN ObserverGlacial
SAY @263773
IF ~~ THEN DO ~SetGlobal("#SequenceAmkethran","GLOBAL",2)~ EXIT
END


IF ~~ THEN BEGIN IneffableReconnaissance
SAY @263775
IF ~~ THEN DO ~SetGlobal("#SequenceAmkethran","GLOBAL",2)
               AddJournalEntry(@915165,INFO)~ EXIT
END

IF ~~ THEN BEGIN PasPrescience
SAY @263774
IF ~~ THEN DO ~SetGlobal("#SequenceAmkethran","GLOBAL",2)
               AddJournalEntry(@915166,INFO)~ EXIT
END






// FIN THRONE OF BHAAL

IF ~Global("#SDernierMiroirAme","GLOBAL",1)~ THEN BEGIN FinThroneBhaal1
SAY @200850
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCutFi1")~ EXIT
END


// LES CATINS DE L'ARBRE A CHOPINES

IF ~Global("#SAfficheMiseAPrix","GLOBAL",2)~ THEN BEGIN ReposAuberge
SAY @206200 = @206020
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtTav2")~ EXIT
END

IF ~Global("#SAfficheMiseAPrix","GLOBAL",3)~ THEN BEGIN ReposAuberge2
SAY @206060 = @206061 = @206062
IF ~~ THEN REPLY @206063 GOTO BienCompris
IF ~~ THEN REPLY @206064 GOTO BoulePapier
IF ~~ THEN REPLY @206065 GOTO UnHumour
END

IF ~~ THEN BEGIN UnHumour
SAY @206090  
IF ~~ THEN REPLY @206069 GOTO TropSoucis
IF ~~ THEN REPLY @206070 GOTO QuelIncident
END



IF ~~ THEN BEGIN BoulePapier
SAY @206066 = @206067
IF ~~ THEN REPLY @206069 GOTO TropSoucis
IF ~~ THEN REPLY @206070 GOTO QuelIncident
END


IF ~~ THEN BEGIN BienCompris
SAY @206068
IF ~~ THEN REPLY @206069 GOTO TropSoucis
IF ~~ THEN REPLY @206070 GOTO QuelIncident
END

IF ~~ THEN BEGIN TropSoucis
SAY @206071 = @206073
IF ~~ THEN GOTO Arriere
END


IF ~~ THEN BEGIN QuelIncident
SAY @206072 = @206073
IF ~~ THEN GOTO Arriere
END

IF ~~ THEN BEGIN Arriere
SAY @206074
IF ~~ THEN REPLY @206075 GOTO LutteFeroce
IF ~~ THEN REPLY @206076 GOTO SiFacile
IF ~~ THEN REPLY @206077 GOTO DurcirTraits
END

IF ~~ THEN BEGIN DurcirTraits
SAY @206078
IF ~~ THEN GOTO Serment
END

IF ~~ THEN BEGIN SiFacile
SAY @206080
IF ~~ THEN GOTO Serment
END

IF ~~ THEN BEGIN LutteFeroce
SAY @206082
IF ~~ THEN GOTO Serment
END

IF ~~ THEN BEGIN Serment
SAY @206081
IF ~~ THEN REPLY @206083 GOTO Douceur
IF ~~ THEN REPLY @206084 GOTO Gratitude
IF ~~ THEN REPLY @206085 GOTO Cv
END

IF ~~ THEN BEGIN Douceur
SAY @206088
IF ~~ THEN DO ~SetGlobal("#SJolentaSeverian","GLOBAL",1)
               SetGlobal("#SAfficheMiseAPrix","GLOBAL",4)
               SetDialog("#Sev25J")
               StartCutSceneMode()
               StartCutScene("#SCtTav1")~ EXIT
END

IF ~~ THEN BEGIN Cv
SAY @206086
IF ~~ THEN DO ~SetGlobal("#SJolentaSeverian","GLOBAL",1)
               SetGlobal("#SAfficheMiseAPrix","GLOBAL",4)
               SetDialog("#Sev25J")
               StartCutSceneMode()
               StartCutScene("#SCtTav1")~ EXIT
END

IF ~~ THEN BEGIN Gratitude
SAY @206087
IF ~~ THEN DO ~SetGlobal("#SJolentaSeverian","GLOBAL",1)
               SetGlobal("#SAfficheMiseAPrix","GLOBAL",4)
               SetDialog("#Sev25J")
               StartCutSceneMode()
               StartCutScene("#SCtTav1")~ EXIT
END



// ENTREE DANS L'ARBRE A CHOPINES

IF ~Global("#SAfficheMiseAPrix","GLOBAL",2)~ THEN BEGIN MiseAPrix1
SAY @206200
IF ~~ THEN DO ~SetGlobal("#SAfficheMiseAPrix","GLOBAL",3)
               SetDialog("#Sev25J")~ EXIT
END

// ARRIVEE SARADUSH
// APRES MELISSANNE

IF ~Global("#SArriveeSaradush","GLOBAL",1)~ THEN BEGIN ArriveeSaradush
SAY @206210
IF ~~ THEN REPLY @206211 GOTO Forteresse
IF ~~ THEN REPLY @206212 GOTO SoucisRien
IF ~~ THEN REPLY @206213 GOTO SeulInstant
END

IF ~~ THEN BEGIN Forteresse
SAY @206216
IF ~~ THEN DO ~SetGlobal("#SArriveeSaradush","GLOBAL",2)
              SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN SoucisRien
SAY @206215
IF ~~ THEN DO ~SetGlobal("#SArriveeSaradush","GLOBAL",2)
              SetDialog("#Sev25J")~ EXIT
END

IF ~~ THEN BEGIN SeulInstant
SAY @206214
IF ~~ THEN DO ~SetGlobal("#SArriveeSaradush","GLOBAL",2)
              SetDialog("#Sev25J")~ EXIT
END





// APRES DARKHAN
// SI SEVERIAN EST MORT

IF ~Global("#SDeadSeverian","GLOBAL",4)~ THEN BEGIN Resurrection1
SAY @203222
IF ~~ THEN EXTERN ~#SValy3~ DestineeDenouement
END

IF ~~ THEN BEGIN PasEncoreFini
SAY @233220
IF ~~ THEN EXTERN ~#SValy3~ CoeurEstBon
END

IF ~~ THEN BEGIN RevoirMallory
SAY @233222
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtDa11")~ EXIT
END

IF ~Global("#SDeadSeverian","GLOBAL",5)~ THEN BEGIN Resurrection2
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
IF ~~ THEN DO ~SetGlobal("#SDeadSeverian","GLOBAL",6)
               TakePartyItem("#SAvis")
               DestroyItem("#SAvis")~ EXIT
END



APPEND ~#SValy3~

 IF ~~ THEN BEGIN DestineeDenouement
 SAY @203252
 IF ~~ THEN EXTERN ~#Sev25R~ PasEncoreFini
 END
 
 IF ~~ THEN BEGIN CoeurEstBon
 SAY @233221
 IF ~~ THEN EXTERN ~#Sev25R~ RevoirMallory
 END 


END
  

