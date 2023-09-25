BEGIN ~#SeverR~

//////////////////////////////////////////////////////////////
///////////////////////// DEBUT DE LA ROMANCE



// ROMANCE (SI CHARNAME EST UNE FEMME ELFE DEMI ELFE OU HUMAINE)
// ETAPE 1

IF ~Global("#SeverLoveTlk","LOCALS",2)~ THEN BEGIN EnfantDeBhaal
  SAY @120
  IF ~~ THEN REPLY @121 GOTO Petrin
  IF ~~ THEN REPLY @122 GOTO Crapule
  IF ~~ THEN REPLY @12300 GOTO PlaceChef
END

IF ~~ THEN BEGIN PlaceChef
  SAY @12301
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END


// 1ER TYPE DE CONVERSATION


IF ~~ THEN BEGIN Crapule
  SAY @124
  IF ~~ THEN REPLY @12400 GOTO Tangente
  IF ~~ THEN REPLY @12401 GOTO HaricotSec
  IF ~~ THEN REPLY @12402 GOTO MagicienIntelligence
END

IF ~~ THEN BEGIN MagicienIntelligence
  SAY @125
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Tangente
  SAY @126
  IF ~~ THEN REPLY @12600 GOTO Petrin
  IF ~~ THEN REPLY @12601 GOTO ColereTour
END

IF ~~ THEN BEGIN ColereTour
  SAY @12602
  IF ~~ THEN DO ~LeaveParty()
                 EscapeArea()
                 SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN HaricotSec
  SAY @127
  IF ~~ THEN REPLY @12700 GOTO BruteSanguinaire
  IF ~~ THEN REPLY @12701 GOTO Petrin
  IF ~~ THEN REPLY @12702 GOTO Supporter
END

IF ~~ THEN BEGIN Supporter
  SAY @128
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN BruteSanguinaire
  SAY @129
  IF ~~ THEN REPLY @12900 GOTO Prognostics
  IF ~~ THEN REPLY @12901 GOTO Petrin
  IF ~~ THEN REPLY @12902 GOTO Stupide
END

IF ~~ THEN BEGIN Stupide
  SAY @130
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Prognostics
  SAY @131
  IF ~~ THEN REPLY @13100 GOTO Petrin
  IF ~~ THEN REPLY @13101 GOTO Susceptible
END

IF ~~ THEN BEGIN Susceptible
  SAY @132
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END


// CONVERSATION BLOC COMMUN

IF ~~ THEN BEGIN Petrin
  SAY @139 = @140
  IF ~~ THEN REPLY @14000 GOTO BoireChopine
  IF ~~ THEN REPLY @14001 GOTO MotMalheureux
  IF ~~ THEN REPLY @14002 GOTO MotMalheureux
END

IF ~~ THEN BEGIN BonneGuerre
  SAY @14005
  IF ~~ THEN DO ~LeaveParty()
                 EscapeArea()
                 SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN MotMalheureux
  SAY @14004
  IF ~~ THEN REPLY @14600 GOTO AvenirIncertain
  IF ~~ THEN REPLY @14601 GOTO AucunePrise
END

// CONVERSATION ALCOOL

IF ~~ THEN BEGIN BoireChopine
  SAY @141
  IF ~~ THEN REPLY @14100 GOTO Solennel
  IF ~~ THEN REPLY @14101 GOTO PasPourToi
END

IF ~~ THEN BEGIN PasPourToi
  SAY @143
  IF ~~ THEN REPLY @14300 GOTO Desastre
  IF ~~ THEN REPLY @14301 GOTO QuoiDetonnant
END

// CONVERSATION ENFANT DE BHAAL

IF ~~ THEN BEGIN Solennel
  SAY @142 = @146
  IF ~~ THEN REPLY @14600 GOTO AvenirIncertain
  IF ~~ THEN REPLY @14601 GOTO AucunePrise
  IF ~~ THEN REPLY @14003 GOTO BonneGuerre
END


IF ~~ THEN BEGIN Desastre
  SAY @144 = @146
  IF ~~ THEN REPLY @14600 GOTO AvenirIncertain
  IF ~~ THEN REPLY @14601 GOTO AucunePrise
END

IF ~~ THEN BEGIN QuoiDetonnant
  SAY @145 = @146
  IF ~~ THEN REPLY @14600 GOTO AvenirIncertain
  IF ~~ THEN REPLY @14601 GOTO AucunePrise
END

IF ~~ THEN BEGIN AvenirIncertain
  SAY @149
  IF ~~ THEN REPLY @14900 GOTO Illusion
  IF ~~ THEN REPLY @14901 GOTO VeuxAide
END

IF ~~ THEN BEGIN Illusion
  SAY @150 = @151
  IF ~~ THEN REPLY @15100 GOTO PasDifferents
  IF ~~ THEN REPLY @15101 GOTO SansDoute
END

IF ~~ THEN BEGIN VeuxAide
  SAY @151
  IF ~~ THEN REPLY @15100 GOTO PasDifferents
  IF ~~ THEN REPLY @15101 GOTO SansDoute
END

IF ~~ THEN BEGIN SansDoute
  SAY @152
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN AucunePrise
  SAY @147
  IF ~~ THEN REPLY @14700 GOTO PasDifferents
  IF ~~ THEN REPLY @14701 GOTO Houleux
END

IF ~~ THEN BEGIN Houleux
  SAY @148
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

// CONVERSATION FINALE

IF ~~ THEN BEGIN PasDifferents
  SAY @153
  IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                 SetGlobal("#SClicTalk","GLOBAL",1)
                 RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                 SetDialog("#SeverJ")~ EXIT
END




// ROMANCE
// ETAPE 2




IF ~Global("#SeverLoveTlk","LOCALS",4)~ THEN BEGIN Parages
  SAY @154
  IF ~~ THEN REPLY @15400 GOTO Pensif
  IF ~~ THEN REPLY @15401 GOTO BeauxYeux
  IF ~~ THEN REPLY @15403 GOTO Inimitie
END

IF ~~ THEN BEGIN Inimitie
  SAY @156
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN BeauxYeux
  SAY @159
  IF ~~ THEN REPLY @15900 GOTO Pensif
  IF ~~ THEN REPLY @15901 GOTO Venimeux
END

IF ~~ THEN BEGIN Venimeux
  SAY @160
IF ~~ THEN DO ~LeaveParty()
               EscapeArea()
               SetGlobal("#SeverRomanceActive","GLOBAL",3)
               SetGlobal("#SClicTalk","GLOBAL",3)
               SetDialog("#SeverJ")~ EXIT
END

// Conversation principale

IF ~~ THEN BEGIN Pensif
  SAY @172
  IF ~~ THEN REPLY @17200 GOTO ReconversionFacile
  IF ~~ THEN REPLY @17201 GOTO Aguicheuse
  IF ~~ THEN REPLY @17202 GOTO Paranoiaque
END

IF ~~ THEN BEGIN Paranoiaque
  SAY @174
  IF ~~ THEN DO ~LeaveParty()
                 EscapeArea()
                 SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Aguicheuse
  SAY @17400
  IF ~~ THEN REPLY @17500 GOTO LacheAffaire
  IF ~~ THEN REPLY @17501 GOTO MassageDouee
  IF ~~ THEN REPLY @17502 GOTO TropStupide
END

IF ~~ THEN BEGIN TropStupide
  SAY @176
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN ReconversionFacile
 SAY @175
 IF ~~ THEN REPLY @17500 GOTO LacheAffaire
 IF ~~ THEN REPLY @17501 GOTO MassageDouee
 IF ~~ THEN REPLY @17502 GOTO TropStupide
END

IF ~~ THEN BEGIN MassageDouee
 SAY @177
 IF ~~ THEN REPLY @17700 GOTO LacheAffaire
 IF ~~ THEN REPLY @17701 GOTO LacheAffaire
 IF ~~ THEN REPLY @17702 GOTO BouderCoin
END

IF ~~ THEN BEGIN BouderCoin
 SAY @178
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN LacheAffaire
 SAY @179 = @180
 IF ~~ THEN REPLY @18000 GOTO Enfance
 IF ~~ THEN REPLY @18001 GOTO Commandement
 IF ~~ THEN REPLY @18002 GOTO Batailler
END

IF ~~ THEN BEGIN Batailler
 SAY @181
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Commandement
 SAY @182
 IF ~~ THEN REPLY @18000 GOTO Enfance
 IF ~~ THEN REPLY @18002 GOTO Batailler
END

IF ~~ THEN BEGIN Enfance
 SAY @183
 IF ~~ THEN REPLY @18300 GOTO Frasques
 IF ~~ THEN REPLY @18301 GOTO LesVoiles
END

IF ~~ THEN BEGIN LesVoiles
 SAY @186
 IF ~~ THEN REPLY @18600 GOTO MefierSourire
 IF ~~ THEN REPLY @18402 GOTO PasSattacher
END

IF ~~ THEN BEGIN PasSattacher
 SAY @185
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN MefierSourire
 SAY @187
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Frasques
 SAY @184
 IF ~~ THEN REPLY @18400 GOTO MefierSourire
 IF ~~ THEN REPLY @18401 GOTO MefierSourire
 IF ~~ THEN REPLY @18402 GOTO PasSattacher
END



// ROMANCE
// ETAPE 3


IF ~Global("#SeverLoveTlk","LOCALS",6)~ THEN BEGIN PisteIrenicus
  SAY @220
  IF ~~ THEN REPLY @22000 GOTO Nuits
  IF ~~ THEN REPLY @22001 GOTO Aveux
  IF ~~ THEN REPLY @22002 DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                              SetGlobal("#SClicTalk","GLOBAL",3)
                              SetDialog("#SeverJ")~ EXIT
END

// Aveux?

IF ~~ THEN BEGIN Aveux
 SAY @221
 IF ~~ THEN REPLY @22100 GOTO RengainePoignard
 IF ~~ THEN REPLY @22101 GOTO TentativeFlirt
 IF ~~ THEN REPLY @22102 GOTO CorpsDeesse
END

IF ~~ THEN BEGIN CorpsDeesse
 SAY @222
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN TentativeFlirt
 SAY @223
 IF ~~ THEN GOTO Cartes
END

IF ~~ THEN BEGIN RengainePoignard
 SAY @224
 IF ~~ THEN GOTO Cartes
END

// Nuits

IF ~~ THEN BEGIN Nuits
 SAY @225
 IF ~~ THEN GOTO Cartes
END

// Cartes

IF ~~ THEN BEGIN Cartes
 SAY @226 = @227
 IF ~~ THEN REPLY @22700 GOTO JeuCartes
 IF ~~ THEN REPLY @22701 GOTO BelleCamelote
 IF ~~ THEN REPLY @22702 GOTO Bagne
END

IF ~~ THEN BEGIN Bagne
 SAY @228
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

// Camelote

IF ~~ THEN BEGIN BelleCamelote
 SAY @229
 IF ~~ THEN REPLY @22900 GOTO JeuCartes
 IF ~~ THEN REPLY @22901 GOTO JeuCartes
 IF ~~ THEN REPLY @22902 GOTO MordreDoigt
END

IF ~~ THEN BEGIN MordreDoigt
 SAY @230
IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
               SetGlobal("#SClicTalk","GLOBAL",3)
               SetDialog("#SeverJ")~ EXIT
END

// Jeu

IF ~~ THEN BEGIN JeuCartes
 SAY @231 = @232 = @233
 IF ~~ THEN REPLY @23300 GOTO Piece
 IF ~~ THEN REPLY @23301 GOTO QuelCaractere
 IF ~~ THEN REPLY @23302 GOTO Arnaqueur
END

IF ~~ THEN BEGIN Arnaqueur
 SAY @234
IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
               SetGlobal("#SClicTalk","GLOBAL",3)
               SetDialog("#SeverJ")~ EXIT
END

// QuelCaractere

IF ~~ THEN BEGIN QuelCaractere
 SAY @235 = @237
 IF ~~ THEN REPLY @23700 GOTO MithrestRepas
 IF ~~ THEN REPLY @23701 GOTO BonneClaque
 IF ~~ THEN REPLY @23702 GOTO CadetSoucis
END


// Piece

IF ~~ THEN BEGIN Piece
 SAY @236 = @237
 IF ~~ THEN REPLY @23700 GOTO MithrestRepas
 IF ~~ THEN REPLY @23701 GOTO BonneClaque
 IF ~~ THEN REPLY @23702 GOTO CadetSoucis
END

IF ~~ THEN BEGIN CadetSoucis
 SAY @238
IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
               SetGlobal("#SClicTalk","GLOBAL",3)
               SetDialog("#SeverJ")~ EXIT
END

// Claque

IF ~~ THEN BEGIN BonneClaque
 SAY @239
 IF ~~ THEN GOTO MithrestRepas
END

// Mithrest

IF ~~ THEN BEGIN MithrestRepas
 SAY @240
 IF ~~ THEN REPLY @24000 GOTO FestinRoi
 IF ~~ THEN REPLY @24001 GOTO BabioleFestin
 IF ~~ THEN REPLY @24002 GOTO CrieFamine
END

IF ~~ THEN BEGIN CrieFamine
 SAY @241
IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
               SetGlobal("#SClicTalk","GLOBAL",3)
               SetDialog("#SeverJ")~ EXIT
END

// Festin

IF ~~ THEN BEGIN FestinRoi
 SAY @243
 IF ~~ THEN DO ~AddJournalEntry(@71014,INFO)
                IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN BabioleFestin
 SAY @242
 IF ~~ THEN DO ~AddJournalEntry(@71014,INFO)
                IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                SetDialog("#SeverJ")~ EXIT
END





// ROMANCE
// ETAPE 4
// CHANGEMENT DE BANDE-SON
// CONDITION DE DECLENCHEMENT: AUBERGE DU MITHREST

// DIALOGUE PREMIERE PARTIE

IF ~Global("#SeverLoveTlk","LOCALS",8)
    Global("#SRomanceRepasMithrest","AR0704",1)
    Global("#SDeadHugor","GLOBAL",2)~ THEN BEGIN Mithrest
  SAY @280 = @281
  IF ~~ THEN REPLY @28100 GOTO Gene
  IF ~~ THEN REPLY @28101 GOTO DinerChandelles
  IF ~~ THEN REPLY @28102 GOTO GargoteDiscrete
END

IF ~~ THEN BEGIN GargoteDiscrete
  SAY @282
  IF ~~ THEN REPLY @28200 GOTO TableMith
  IF ~~ THEN REPLY @28201 GOTO Obscession
END

IF ~~ THEN BEGIN Obscession
  SAY @283
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SRomanceRepasMithrest","AR0704",-1) SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Gene
  SAY @285
  IF ~~ THEN GOTO TableMith
END
  
IF  ~~ THEN BEGIN DinerChandelles
  SAY @284
  IF ~~ THEN GOTO TableMith
END

// Table

IF ~~ THEN BEGIN TableMith
 SAY @286 = @287
  IF ~~ THEN DO ~SetGlobal("#SRomanceRepasMithrest","AR0704",2)
                 StartCutSceneMode() 
                 StartCutScene("#SCtRom4")~ EXIT // Lancement cutscene
END


// DIALOGUE DEUXIEME PARTIE

IF ~Global("#SRomanceRepasMithrest","AR0704",3)
    Global("#SDeadHugor","GLOBAL",2)~ THEN BEGIN UnBonRepas
 SAY @292 = @293 = @294
 IF ~~ THEN REPLY @29400 GOTO GestePouce
 IF ~~ THEN REPLY @29401 GOTO LippeSoudard
 IF ~~ THEN REPLY @29402 GOTO Specialite
END

IF ~~ THEN BEGIN Specialite
 SAY @295
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SRomanceRepasMithrest","AR0704",-1) SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN LippeSoudard
 SAY @296
 IF ~~ THEN REPLY @29800 GOTO Bougie
 IF ~~ THEN REPLY @29801 GOTO Allusion
 IF ~~ THEN REPLY @29802 GOTO Specialite
END

IF ~~ THEN BEGIN GestePouce
 SAY @297
 IF ~~ THEN REPLY @29800 GOTO Bougie
 IF ~~ THEN REPLY @29801 GOTO Allusion
 IF ~~ THEN REPLY @29802 GOTO Specialite
END

IF ~~ THEN BEGIN Allusion
 SAY @299
 IF ~~ THEN GOTO Retrousser
END

IF ~~ THEN BEGIN Bougie
 SAY @300
 IF ~~ THEN GOTO Retrousser
END

IF ~~ THEN BEGIN Retrousser
 SAY @301 = @302
 IF ~~ THEN REPLY @30200 GOTO EnfantNuit
 IF ~~ THEN REPLY @30201 GOTO ConnaissanceJoueur
 IF ~~ THEN REPLY @30202 GOTO Grief
END
 
IF ~~ THEN BEGIN Grief
 SAY @303
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SRomanceRepasMithrest","AR0704",-1) SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN ConnaissanceJoueur
 SAY @304
 IF ~~ THEN GOTO Exploration
END

IF ~~ THEN BEGIN EnfantNuit
 SAY @305
 IF ~~ THEN GOTO Exploration
END

IF ~~ THEN BEGIN Exploration
 SAY @306
 IF ~~ THEN DO ~SetGlobal("#SRomanceRepasMithrest","AR0704",4)
                IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                AddJournalEntry(@71015,INFO)
                SetDialog("#SeverJ")~ EXIT
END


// ROMANCE
// ETAPE 5
// PROTAGONISTES : CHARNAME, SEVERIAN, ONYX.
// CONDITIONS DE DECLENCHEMENT : 
// CONVOCATION D'ONYX (PROVOQUEE POUR LA ROMANCE)
// EN EXTERIEUR, CAMPAGNE
// TEMPS : SOLEIL, JOUR


IF ~Global("#SeverLoveTlk","LOCALS",10)~ THEN BEGIN AppelOnyx
  SAY @350 = @351
  IF ~~ THEN EXTERN ~#SBlaidd~ Echine
END

IF ~~ THEN BEGIN SaleBestiau
  SAY @353
  IF ~~ THEN DO ~SetGlobal("#SUnSumBlaidd","GLOBAL",1) 
                 SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 LeaveParty()
                 EscapeArea()
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN GrosPetrin
  SAY @355
  IF ~~ THEN EXTERN ~#SBlaidd~ PresenceLoup
END

IF ~~ THEN BEGIN OursTissu
  SAY @354
  IF ~~ THEN EXTERN ~#SBlaidd~ PresenceLoup
END

IF ~~ THEN BEGIN Orties
  SAY @357
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SUnSumBlaidd","GLOBAL",1) SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN GrognonExpose
  SAY @358
  IF ~~ THEN EXTERN ~#SBlaidd~ MuseauHumide
END

IF ~~ THEN BEGIN BaveGrouilleux
  SAY @360
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SUnSumBlaidd","GLOBAL",1) SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN ConnaisPas
  SAY @363 = @365 = @366 = @367 = @368
  IF ~~ THEN REPLY @36800 GOTO DelicieuxFemme
  IF ~~ THEN REPLY @36801 GOTO VicesFemme
  IF ~~ THEN REPLY @36802 GOTO SouNeuf
END

IF ~~ THEN BEGIN SouNeuf
  SAY @369
  IF ~~ THEN REPLY @36900 GOTO DelicieuxFemme
  IF ~~ THEN REPLY @36901 GOTO VicesFemme
  IF ~~ THEN REPLY @36902 GOTO NainTresor
END

IF ~~ THEN BEGIN NainTresor
  SAY @370
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SUnSumBlaidd","GLOBAL",1)    SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

// Limites



IF ~~ THEN BEGIN DelicieuxFemme
  SAY @372
  IF ~~ THEN REPLY @37400 GOTO ScrupuleContact
  IF ~~ THEN REPLY @37401 GOTO ContactScrupule
  IF ~~ THEN REPLY @37402 GOTO EspritEtrique
END



IF ~~ THEN BEGIN VicesFemme
  SAY @373
  IF ~~ THEN REPLY @37400 GOTO ScrupuleContact
  IF ~~ THEN REPLY @37401 GOTO ContactScrupule
  IF ~~ THEN REPLY @37402 GOTO EspritEtrique
END

IF ~~ THEN BEGIN EspritEtrique
  SAY @375
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SUnSumBlaidd","GLOBAL",1)    SetGlobal("#SClicTalk","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT
END

// Scrupules

IF ~~ THEN BEGIN ScrupuleContact
 SAY @376
 IF ~~ THEN GOTO LeveJambes
END

IF ~~ THEN BEGIN ContactScrupule
 SAY @377
 IF ~~ THEN GOTO LeveJambes
END

IF ~~ THEN BEGIN LeveJambes
 SAY @378 = @379
 IF ~~ THEN REPLY @37900 GOTO RappelEnfance
 IF ~~ THEN REPLY @37901 GOTO ParleEnfance
 IF ~~ THEN REPLY @37902 GOTO Omelette
 IF ~~ THEN REPLY @37903 GOTO BainRiviere
 IF ~~ THEN REPLY @37904 GOTO MinutePlus
 IF ~~ THEN REPLY @37905 DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SUnSumBlaidd","GLOBAL",1) SetGlobal("#SClicTalk","GLOBAL",3)
                             SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN MinutePlus
 SAY @37906
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SUnSumBlaidd","GLOBAL",1)   SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN BainRiviere
 SAY @380
 IF ~~ THEN REPLY @37900 GOTO RappelEnfance
 IF ~~ THEN REPLY @37901 GOTO ParleEnfance
 IF ~~ THEN REPLY @37902 GOTO Omelette
 IF ~~ THEN REPLY @37904 GOTO MinutePlus
 IF ~~ THEN REPLY @37905 DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SUnSumBlaidd","GLOBAL",1)   SetGlobal("#SClicTalk","GLOBAL",3)
                             SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Omelette
 SAY @381
 IF ~~ THEN REPLY @37900 GOTO RappelEnfance
 IF ~~ THEN REPLY @37901 GOTO ParleEnfance
 IF ~~ THEN REPLY @37903 GOTO BainRiviere
 IF ~~ THEN REPLY @37904 GOTO MinutePlus
 IF ~~ THEN REPLY @37905 DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) SetGlobal("#SUnSumBlaidd","GLOBAL",1)   SetGlobal("#SClicTalk","GLOBAL",3)
                             SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN RappelEnfance
 SAY @383
 IF ~~ THEN GOTO Elvaar
END

IF ~~ THEN BEGIN ParleEnfance
 SAY @382
 IF ~~ THEN GOTO Elvaar
END

IF ~~ THEN BEGIN Elvaar
 SAY @384 = @385 = @386 = @387
 IF ~~ THEN DO ~SetGlobal("#SUnSumBlaidd","GLOBAL",1)
                IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                SetGlobal("#SClicTalk","GLOBAL",2)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END
 

// L'APPEND D'ONYX SE TROUVE TOUT EN BAS DU FICHIER.



// ROMANCE
// ETAPE 6
// EN EXTERIEUR
// JOUR



IF ~Global("#SeverLoveTlk","LOCALS",12)~ THEN BEGIN EpisodeMare
  SAY @411 = @412
  IF ~~ THEN REPLY @41200 GOTO Contourner
  IF ~~ THEN REPLY @41201 GOTO GalantChevalier
  IF ~~ THEN REPLY @41202 GOTO Balivernes
END

IF ~~ THEN BEGIN Balivernes
  SAY @423
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN GalantChevalier
  SAY @414
  IF ~~ THEN REPLY @41600 GOTO CriEau
  IF ~~ THEN REPLY @41601 GOTO Confortable
  IF ~~ THEN REPLY @41602 GOTO EtalerEau
END

IF ~~ THEN BEGIN Contourner
  SAY @415
  IF ~~ THEN REPLY @41600 GOTO CriEau
  IF ~~ THEN REPLY @41601 GOTO Confortable
  IF ~~ THEN REPLY @41602 GOTO EtalerEau
END

IF ~~ THEN BEGIN EtalerEau
  SAY @417
IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
               SetGlobal("#SClicTalk","GLOBAL",3)
               SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Confortable
  SAY @419
  IF ~~ THEN GOTO TuEtrangle
END

IF ~~ THEN BEGIN CriEau
  SAY @418
  IF ~~ THEN GOTO TuEtrangle
END

IF ~~ THEN BEGIN TuEtrangle
  SAY @420 = @421 = @422 = @423
  IF ~~ THEN REPLY @42300 GOTO DefautCuriosite
  IF ~~ THEN REPLY @42301 GOTO PrincesseEau
  IF ~~ THEN REPLY @42302 GOTO HancheCurieuse
END

IF ~~ THEN BEGIN HancheCurieuse
  SAY @424
IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
               SetGlobal("#SClicTalk","GLOBAL",3)
               SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN PrincesseEau
  SAY @425
  IF ~~ THEN GOTO EclatRire
END

IF ~~ THEN BEGIN DefautCuriosite
  SAY @426
  IF ~~ THEN GOTO EclatRire
END

IF ~~ THEN BEGIN EclatRire
  SAY @427 = @428 = @429
  IF ~~ THEN REPLY @42900 GOTO AmourFilial
  IF ~~ THEN REPLY @42901 GOTO TristePoint
  IF ~~ THEN REPLY @42902 GOTO MeprisPeine
END

IF ~~ THEN BEGIN MeprisPeine
  SAY @430
IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
               SetGlobal("#SClicTalk","GLOBAL",3)
               SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN TristePoint
  SAY @431
  IF ~~ THEN GOTO HistoireArmure
END

IF ~~ THEN BEGIN AmourFilial
  SAY @432
  IF ~~ THEN GOTO HistoireArmure
END

IF ~~ THEN BEGIN HistoireArmure
  SAY @433 = @434 = @435 = @436 = @437
  IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                 RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                 SetDialog("#SeverJ")~ EXIT
END


// ROMANCE
// ETAPE 7
// SI LE GROUPE N'EST PAS A IMNESVALE


IF ~Global("#SeverLoveTlk","LOCALS",14)~ THEN BEGIN VolSacPomme
  SAY @440
  IF ~~ THEN REPLY @44000 GOTO Effrayee
  IF ~~ THEN REPLY @44001 GOTO ManegeDeviner
  IF ~~ THEN REPLY @44002 GOTO Effrayee
END

IF ~~ THEN BEGIN Effrayee
 SAY @441
 IF ~~ THEN REPLY @44300 GOTO PommeRation
 IF ~~ THEN REPLY @44301 GOTO PommeBouche
 IF ~~ THEN REPLY @44302 GOTO PingreDragon
END

IF ~~ THEN BEGIN PingreDragon
 SAY @444
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN ManegeDeviner
 SAY @442
 IF ~~ THEN REPLY @44300 GOTO PommeRation
 IF ~~ THEN REPLY @44301 GOTO PommeBouche
 IF ~~ THEN REPLY @44302 GOTO PingreDragon
END

IF ~~ THEN BEGIN PommeRation
 SAY @446
 IF ~~ THEN GOTO PitreJongle
END

IF ~~ THEN BEGIN PommeBouche
 SAY @445
 IF ~~ THEN GOTO PitreJongle
END

IF ~~ THEN BEGIN PitreJongle
 SAY @447 = @448
 IF ~~ THEN REPLY @44800 GOTO BardeBouffon
 IF ~~ THEN REPLY @44801 GOTO BardeBouffon
 IF ~~ THEN REPLY @44802 GOTO ConcessionHumour
END

IF ~~ THEN BEGIN ConcessionHumour
 SAY @449
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN BardeBouffon
 SAY @450 = @451
 IF ~~ THEN REPLY @45100 GOTO Majorite
 IF ~~ THEN REPLY @45101 GOTO FemmeFatale
 IF ~~ THEN REPLY @45102 GOTO Morfondre
END

IF ~~ THEN BEGIN Morfondre
 SAY @452
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN FemmeFatale
 SAY @453
 IF ~~ THEN GOTO ValVisite
END

 IF ~~ THEN BEGIN ValVisite
 SAY @455
 IF ~~ THEN REPLY @45600 GOTO TonEnjoue
 IF ~~ THEN REPLY @45601 GOTO HommeFatal
 IF ~~ THEN REPLY @45602 GOTO FaireConvaincre
END

IF ~~ THEN BEGIN Majorite
 SAY @454
 IF ~~ THEN GOTO ValVisite
END

IF ~~ THEN BEGIN FaireConvaincre
 SAY @457
 IF ~~ THEN REPLY @45700 GOTO TonEnjoue
 IF ~~ THEN REPLY @45701 GOTO FroideTombe
END

IF ~~ THEN BEGIN FroideTombe
 SAY @458
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN TonEnjoue
 SAY @460
 IF ~~ THEN DO ~AddJournalEntry(@60000,INFO) RevealAreaOnMap("AR1100")  SetGlobal("#SRomanceHuit","GLOBAL",1)
                IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                SetDialog("#SeverJ")~ EXIT
END


IF ~~ THEN BEGIN HommeFatal
 SAY @459
 IF ~~ THEN DO ~AddJournalEntry(@60000,INFO) RevealAreaOnMap("AR1100")  SetGlobal("#SRomanceHuit","GLOBAL",1)
                IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                SetDialog("#SeverJ")~ EXIT
END



// ROMANCE
// ETAPE 8
// DIALOGUE DETERMINANT DANS LA SUITE DU MOD (ROMANCE + SCENARIO)
// SI LE GROUPE SE TROUVE SUR LA MAP D'IMNESVALE



// PARTIE 1

IF ~Global("#SDecisifImnesvale","AR1100",2)~ THEN BEGIN PiqueNiqueParty
  SAY @500
  IF ~~ THEN REPLY @50001 GOTO LesAutres
  IF ~~ THEN REPLY @50002 GOTO ToiMoi
  IF ~~ THEN REPLY @50003 GOTO SourireCharmeur
END

IF ~~ THEN BEGIN SourireCharmeur
  SAY @501
  IF ~~ THEN REPLY @50100 GOTO LesAutres
  IF ~~ THEN REPLY @50101 GOTO ToiMoi
  IF ~~ THEN REPLY @50102 GOTO DeceptionClaire
END

IF ~~ THEN BEGIN DeceptionClaire
  SAY @502
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN LesAutres
  SAY @503
  IF ~~ THEN GOTO CharmeMain
END

IF ~~ THEN BEGIN ToiMoi
  SAY @504
  IF ~~ THEN GOTO CharmeMain
END

IF ~~ THEN BEGIN CharmeMain
  SAY @505
 IF ~~ THEN DO ~SetGlobal("#SDecisifImnesvale","AR1100",3)
                PlaySong(0)
                PlaySound("#SMusicE")~ EXIT  // Téléportation sous les arbres
END


// PARTIE 2

// APRES TELEPORTATION

IF ~Global("#SDecisifImnesvale","AR1100",4)~ THEN BEGIN GrandSaule
  SAY @508 = @509 = @510 = @511 = @512
  IF ~~ THEN REPLY @51200 GOTO BrinDherbe
  IF ~~ THEN REPLY @51201 GOTO BrinDherbe
  IF ~~ THEN REPLY @51202 GOTO RedresseCoude
END

IF ~~ THEN BEGIN RedresseCoude
  SAY @513
   IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                  SetGlobal("#SClicTalk","GLOBAL",3)
                  SetGlobal("#SDecisifImnesvale","AR1100",-1)
                  StartCutSceneMode()
                 StartCutScene("#SCutR85")~ EXIT
END


IF ~~ THEN BEGIN BrinDherbe
  SAY @514 = @515
  IF ~~ THEN REPLY @51500 GOTO ReflexeRoulade
  IF ~~ THEN REPLY @51501 GOTO OccuperRoulade
  IF ~~ THEN REPLY @51502 GOTO ApresMidi
END

IF ~~ THEN BEGIN ApresMidi
  SAY @516
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 StartCutSceneMode()
                 StartCutScene("#SCutR85")~ EXIT
END

IF ~~ THEN BEGIN ReflexeRoulade
  SAY @517 = @518
  IF ~~ THEN GOTO ChaleurEmotion
END

IF ~~ THEN BEGIN OccuperRoulade
  SAY @519 = @520
  IF ~~ THEN GOTO ChaleurEmotion
END

IF ~~ THEN BEGIN ChaleurEmotion
  SAY @521 = @566 = @522 = @523
  IF ~~ THEN REPLY @52300 GOTO LigneTombe
  IF ~~ THEN REPLY @52301 GOTO MethodePeche
  IF ~~ THEN REPLY @52302 GOTO LaMouche
END

IF ~~ THEN BEGIN LaMouche
  SAY @52303 = @52304
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                  SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 StartCutSceneMode()
                 StartCutScene("#SCutR85")~ EXIT
END

IF ~~ THEN BEGIN LigneTombe
  SAY @52305
  IF ~~ THEN DO ~SetGlobal("#SDecisifImnesvale","AR1100",5)
                 PlaySong(0)
                 PlaySound("#SMusicG")
                 StartCutSceneMode()
                 StartCutScene("#SCutR82")~ EXIT  // Lancement Cutscene Peche
END

IF ~~ THEN BEGIN MethodePeche
  SAY @52306
  IF ~~ THEN DO ~SetGlobal("#SDecisifImnesvale","AR1100",5)
                 PlaySong(0)
                 PlaySound("#SMusicG")
                 StartCutSceneMode()
                 StartCutScene("#SCutR82")~ EXIT  // Lancement Cutscene Peche
END


// PARTIE 3 : LA PARTIE DE PECHE

// Cutscene : déplacements simultanés de Charname & Severian jusqu'au bord de la rivière

IF ~Global("#SDecisifImnesvale","AR1100",6)~ THEN BEGIN PecheParty
  SAY @525 = @526
  IF ~~ THEN REPLY @52600 GOTO PiedSec
  IF ~~ THEN REPLY @52601 GOTO DansLeau
  IF ~~ THEN REPLY @52602 GOTO JeuxPuerils
END

IF ~~ THEN BEGIN JeuxPuerils
  SAY @527
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 StartCutSceneMode()
                 StartCutScene("#SCutR85")~ EXIT
END

IF ~~ THEN BEGIN PiedSec
  SAY @528
  IF ~~ THEN GOTO DeuxRiviere
END

IF ~~ THEN BEGIN DansLeau
  SAY @529
  IF ~~ THEN GOTO SeverRiviere
END

IF ~~ THEN BEGIN DeuxRiviere
  SAY @530 = @531 = @532
  IF ~~ THEN REPLY @53200 GOTO TraitreCaillou
  IF ~~ THEN REPLY @53201 GOTO MorteRire
  IF ~~ THEN REPLY @53202 GOTO SouVaillant
END

IF ~~ THEN BEGIN SouVaillant
  SAY @533
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 StartCutSceneMode()
                 StartCutScene("#SCutR85")~ EXIT
END

IF ~~ THEN BEGIN TraitreCaillou
  SAY @534
  IF ~~ THEN GOTO Plongeons
END

IF ~~ THEN BEGIN MorteRire
  SAY @535
  IF ~~ THEN GOTO Plongeons
END

IF ~~ THEN BEGIN SeverRiviere
  SAY @536 = @537 = @538
  IF ~~ THEN REPLY @53800 GOTO TraitreCaillou
  IF ~~ THEN REPLY @53801 GOTO MoiEssai
  IF ~~ THEN REPLY @53802 GOTO SouVaillant
END

IF ~~ THEN BEGIN MoiEssai
  SAY @540 = @541
  IF ~~ THEN GOTO Plongeons
END

IF ~~ THEN BEGIN Plongeons
  SAY @542
  IF ~~ THEN  DO ~ PlaySong(0)
                   PlaySound("#SMusicH")
                   StartCutSceneMode()
                   StartCutScene("#SCutR83")~ EXIT  // LANCEMENT CUTSCENE
END



// CUTSCENE : DEPLACEMENTS SIMULTANES DE CHARNAME ET SEVERIAN
// SEVERIAN : 1754, 2501, 12
// CHARNAME : 1821,3500, 4


// PARTIE 4 : L'ABRI DU SAULE
// MODIFICATION DU TEMPS (PLUIE, ET ORAGE SI POSSIBLE)


IF ~Global("#SDecisifImnesvale","AR1100",7)~ THEN BEGIN Orage
  SAY @545 = @546
  IF ~~ THEN REPLY @54600 GOTO VraimentPrudent
  IF ~~ THEN REPLY @54601 GOTO SpectacleGrandiose
  IF ~~ THEN REPLY @54602 GOTO DerangeFurieux
END

IF ~~ THEN BEGIN DerangeFurieux
  SAY @547 = @548
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 StartCutSceneMode()
                 StartCutScene("#SCutR85")~ EXIT
END


IF ~~ THEN BEGIN VraimentPrudent
  SAY @549
  IF ~~ THEN GOTO Desarme
END

IF ~~ THEN BEGIN SpectacleGrandiose
  SAY @550
  IF ~~ THEN GOTO Desarme
END

IF ~~ THEN BEGIN Desarme
  SAY @551 = @55100 = @552 = @553
  IF ~~ THEN REPLY @55300 DO ~PlaySong(0)
                              PlaySound("#SMusicI")
                              StartCutSceneMode()
                              StartCutScene("#SCutR84")~ EXIT
  IF ~~ THEN REPLY @55301 DO ~PlaySong(0)
                              PlaySound("#SMusicI")
                              StartCutSceneMode()
                              StartCutScene("#SCutR84")~ EXIT
  IF ~~ THEN REPLY @55302 GOTO ChoseEvidente
END

IF ~~ THEN BEGIN ChoseEvidente
  SAY @554
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 StartCutSceneMode()
                 StartCutScene("#SCutR85")~ EXIT
END

// CUTSCENE : DEPLACEMENT SIMULTANES DE CHARNAME ET Severian
// Severian : vers 1761,3550,12
// CHARNAME : vers 1722,3546,4

// PARTIE 5 : SOUS L'ORAGE
// TOUJOURS TEMPS DE PLUIE ET ORAGE


IF ~Global("#SDecisifImnesvale","AR1100",8)
~ THEN BEGIN DebutAmour
  SAY @55500 = @556 = @557 = @558 = @559
  IF ~~ THEN REPLY @55900 GOTO HommeAFemmes
  IF ~~ THEN REPLY @55901 GOTO PassionFebrile
  IF ~~ THEN REPLY @55902 GOTO CourtisaneConfiance
END

IF ~~ THEN BEGIN CourtisaneConfiance
  SAY @560 = @561
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 StartCutSceneMode()
                 StartCutScene("#SCutR85")~ EXIT
END

IF ~~ THEN BEGIN HommeAFemmes
  SAY @562
  IF ~~ THEN GOTO BaiserFragrance
END

IF ~~ THEN BEGIN PassionFebrile
  SAY @563
  IF ~~ THEN GOTO PresseBaiser
END

IF ~~ THEN BEGIN BaiserFragrance
  SAY @564 = @565 = @566
  IF ~~ THEN GOTO Physionomie
END

IF ~~ THEN BEGIN PresseBaiser
  SAY @567 = @568 = @569
  IF ~~ THEN GOTO Physionomie
END

IF ~~ THEN BEGIN Physionomie
  SAY @570 = @585 = @586
  IF ~~ THEN DO ~PlaySong(0)
                 PlaySound("#SMusicI")
                 StartCutSceneMode()
                 StartCutScene("#SCutR86")~ EXIT // LANCEMENT TELEPORTATION A L'AUBERGE, PARTIE 6
END


// SI AMOUR
// TELEPORTATION CHARNAME ET SEVER AR1105 (AUBERGE)
// CHARNAME : 777,374,14
// SeverA : 809,398,6
// LA PORTE DE LA CHAMBRE DOIT ETRE OUVERTE


IF ~Global("#SDecisifImnesvale","AR1100",9)~ THEN BEGIN ConfortAuberge
  SAY @587 = @588
  IF ~~ THEN REPLY @58800 GOTO BaiserChaste
  IF ~~ THEN REPLY @58801 GOTO Requete
  IF ~~ THEN REPLY @58802 GOTO SigneTete
END

IF ~~ THEN BEGIN SigneTete
  SAY @592 = @591
  IF ~~ THEN DO ~StartCutSceneMode()
                 StartCutScene("#SCutR89")~ EXIT // ALLER A PARTIE 7
END

IF ~~ THEN BEGIN BaiserChaste
  SAY @593 = @590 = @591
  IF ~~ THEN DO ~StartCutSceneMode()
                 StartCutScene("#SCutR89")~ EXIT // ALLER A PARTIE 7
END

IF ~~ THEN BEGIN Requete
  SAY @594 = @595
  IF ~~ THEN REPLY @59500 GOTO AvertissementNote
  IF ~~ THEN REPLY @59501 GOTO MordreOreille
  IF ~~ THEN REPLY @59502 GOTO SansMenagement
END

IF ~~ THEN BEGIN SansMenagement
  SAY @596
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3) 
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN AvertissementNote
  SAY @59600
  IF ~~ THEN DO ~StartCutSceneMode()
                 StartCutScene("#SCutR89")~ EXIT // ALLER A PARTIE 7
END

IF ~~ THEN BEGIN MordreOreille
  SAY @597
  IF ~~ THEN DO ~SetGlobal("#SeverSexe","LOCALS",1)
                 SetDialog("#SeverJ")
                 StartCutSceneMode()
                 StartCutScene("#SCutR87")~ EXIT // ALLER A PARTIE 7
END


// PARTIE 7
// APRES UNE PHASE DE REPOS AUTOMATIQUE
// NOUS RETROUVONS SEVERIAN ET CHARNAME DANS LA CHAMBRE
// SEVERIAN : 637,290,6 AR1105
// CHARNAME : 636,284,14 AR1105

// SI VARIABLE #SeverSEXE VERIFIEE
// ECHEC DE LA ROMANCE ET DE L'AMITIE
// SEVERIAN QUITTE LA PARTY ET LA ZONE

IF ~Global("#SeverSexe","LOCALS",1)
    Global("#SDecisifImnesvale","AR1100",10)~ THEN BEGIN ChantOiseaux
  SAY @598
  IF ~~ THEN REPLY @59800 GOTO OmbreSeul
  IF ~~ THEN REPLY @59801 GOTO ToutLoisir
END

IF ~~ THEN BEGIN OmbreSeul
  SAY @599 = @600
  IF ~~ THEN GOTO QuitteAuberge
END

IF ~~ THEN BEGIN ToutLoisir
  SAY @601 = @602
  IF ~~ THEN GOTO QuitteAuberge
END

IF ~~ THEN BEGIN QuitteAuberge
  SAY @603 = @604 =@605
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 LeaveParty()
                 EscapeArea()~ EXIT
END


// SI PAS VARIABLE #SeverSEXE
// SUCCES ROMANCE
// PETIT DEJEUNER

IF ~Global("#SeverSexe","LOCALS",0)
    Global("#SDecisifImnesvale","AR1100",10)~ THEN BEGIN BelleEndormie
  SAY @612
  IF ~~ THEN REPLY @61200 GOTO Nue
  IF ~~ THEN REPLY @61201 GOTO Couvertures
  IF ~~ THEN REPLY @61202 GOTO Volet
END

IF ~~ THEN BEGIN Volet
  SAY @613
  IF ~~ THEN GOTO PetitDejeuner
END

IF ~~ THEN BEGIN Couvertures
  SAY @615
  IF ~~ THEN GOTO PetitDejeuner
END

IF ~~ THEN BEGIN Nue
  SAY @614
  IF ~~ THEN GOTO PetitDejeuner
END

IF ~~ THEN BEGIN PetitDejeuner
  SAY @616
  IF ~~ THEN REPLY @61600 GOTO AssisLit
  IF ~~ THEN REPLY @61601 GOTO AssisLit
  IF ~~ THEN REPLY @61602 GOTO Grippe
END

IF ~~ THEN BEGIN Grippe
  SAY @617
  IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 StartCutSceneMode()
                 StartCutScene("#SCutR88")~ EXIT
END

IF ~~ THEN BEGIN AssisLit
  SAY @618 = @619
  IF ~~ THEN REPLY @61900 GOTO SocieteReflexion
  IF ~~ THEN REPLY @61901 GOTO Cliches
  IF ~~ THEN REPLY @61902 GOTO EnfournerTartine
END

IF ~~ THEN BEGIN EnfournerTartine
  SAY @620
  IF ~~ THEN GOTO SocieteReflexion
END

IF ~~ THEN BEGIN Cliches
  SAY @621
  IF ~~ THEN GOTO SocieteReflexion
END

IF ~~ THEN BEGIN SocieteReflexion
  SAY @622 = @623 = @624 = @625 = @626
  IF ~~ THEN DO ~SetGlobal("#SDecisifImnesvale","AR1100",-1)
                 SetGlobal("#SeverChapDeux","GLOBAL",1)
                 SetGlobal("#SMalloExists","AR1100",0)
                 StartCutSceneMode()
                 StartCutScene("#SCutR90")~ EXIT
END

// TELEPORTATION
// CHARNAME RESTE A 636,284,14 AR1105
// SEVERIAN : 1111,302,4 AR1105


// CHAPITRE 2 : LES OMBRES DU PASSE
// PARTIE 1 : IMNESVALE, AU SORTIR DE L'AUBERGE
// SCENE 2 : APRES LA VISITE DE MALLORY - DISCUSSION CHARNAME / SEVERIAN
// CONDITIONS DE DECLENCHEMENT : ROMANCE REUSSIE (DIALOGUE 8)

IF ~Global("#SeverMallo","GLOBAL",2)~ THEN BEGIN Meconnaissable
  SAY @700
  IF ~~ THEN REPLY @70000 GOTO FemmeEnvoyee
  IF ~~ THEN REPLY @70001 GOTO FemmeEnvoyee
  IF ~~ THEN REPLY @70002 GOTO RaleFaute
END

IF ~~ THEN BEGIN RaleFaute
  SAY @701
  IF ~~ THEN REPLY @70100 GOTO FemmeEnvoyee
  IF ~~ THEN REPLY @70101 GOTO ProblemeHistoire
END

IF ~~ THEN BEGIN ProblemeHistoire
  SAY @702
   IF ~~ THEN DO ~LeaveParty()
                 EscapeArea()
                 SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN FemmeEnvoyee
  SAY @703 = @704 = @705
  IF ~~ THEN REPLY @70500 GOTO TempleWaukyne
  IF ~~ THEN REPLY @70501 GOTO CriseJalousie
  IF ~~ THEN REPLY @70502 GOTO CriseJalousie
END

IF ~~ THEN BEGIN CriseJalousie
  SAY @706
  IF ~~ THEN REPLY @70600 GOTO TempleWaukyne
  IF ~~ THEN REPLY @70601 GOTO Satellite
END


IF ~~ THEN BEGIN Satellite
  SAY @707
  IF ~~ THEN REPLY @70600 GOTO TempleWaukyne
  IF ~~ THEN REPLY @70701 GOTO DouleurTerrible
END

IF ~~ THEN BEGIN DouleurTerrible
  SAY @708
  IF ~~ THEN DO ~SetGlobal("#SeverMallo","GLOBAL",-1)
                 SetGlobal("#SeverRomanceActive","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 LeaveParty()
                 EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN TempleWaukyne
  SAY @709 = @710
  IF ~~ THEN DO ~AddJournalEntry(@711,QUEST)
                 RevealAreaOnMap("AR2000")
                 SetGlobal("#SeverChapDeux","GLOBAL",3)
                 SetGlobal("#SClicTalk","GLOBAL",3)
                 SetGlobal("#SeverMallo","GLOBAL",3)
                 SetDialog("#SeverJ")~ EXIT  // Début Partie 2 du Chapitre 2 à Franc-Marché
END

// CHAPITRE 2
// SEVERIAN RECUPERE YAMANEKO

IF ~Global("#SeverYaman","GLOBAL",1)~ THEN BEGIN Ninjato
  SAY @750 = @751
  IF ~~ THEN DO ~SetGlobal("#SeverYaman","GLOBAL",2)
                 AddJournalEntry(@752,INFO)
                 SetDialog("#SeverJ")~ EXIT
END


// CHAPITRE 2
// PARTIE 1 - SCENE 1
// L'HEURE DES CHOIX

IF ~Global("#SeverEnterrement","GLOBAL",10)~ THEN BEGIN AssisRiviere
 SAY @800 = @801 = @802 = @803
 IF ~~ THEN REPLY @80300 GOTO ManegeRacine
 IF ~~ THEN REPLY @80301 GOTO ManegeRacine
 IF ~~ THEN REPLY @80302 GOTO DesireSolitude
END

IF ~~ THEN BEGIN DesireSolitude
 SAY @804
 IF ~~ THEN REPLY @80400 GOTO ManegeRacine
 IF ~~ THEN REPLY @80401 GOTO MaudireEnnuis
END

IF ~~ THEN BEGIN MaudireEnnuis
 SAY @805 = @806
 IF ~~ THEN DO ~TakePartyItem("#SMaBody")
                DestroyItem("#SMaBody")
                SetGlobal("#SeverEnterrement","GLOBAL",-1)
                SetGlobal("#SeverRomanceActive","GLOBAL",3) 
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN ManegeRacine
 SAY @80700 = @807 = @808
 IF ~~ THEN REPLY @80800 GOTO VoyouTruand
 IF ~~ THEN REPLY @80801 GOTO VoyouTruand
 IF ~~ THEN REPLY @80802 GOTO SymboleBraquemart
END

IF ~~ THEN BEGIN SymboleBraquemart
 SAY @809
 IF ~~ THEN GOTO Saitama
END

IF ~~ THEN BEGIN VoyouTruand
 SAY @810
 IF ~~ THEN GOTO Saitama
END

IF ~~ THEN BEGIN Saitama
 SAY @811
 IF ~~ THEN REPLY @81100 GOTO Portail
 IF ~~ THEN REPLY @81101 GOTO PasFaute
 IF ~~ THEN REPLY @81102 GOTO ExcusePlanter
END

IF ~~ THEN BEGIN ExcusePlanter
 SAY @81103 = @81104
 IF ~~ THEN DO ~TakePartyItem("#SMaBody")
                DestroyItem("#SMaBody")
                SetGlobal("#SeverEnterrement","GLOBAL",-1)
                SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN PasFaute
 SAY @813
 IF ~~ THEN GOTO Portail2
END
 
IF ~~ THEN BEGIN Portail
 SAY @814
 IF ~~ THEN GOTO Portail2
END

IF ~~ THEN BEGIN Portail2
 SAY @81400 = @815 = @816 = @819 = @820 = @821 = @822 = @825 = @826 = @827
 IF ~~ THEN REPLY @82700 GOTO Redemption
 IF ~~ THEN REPLY @82701 GOTO PasRedemption
END

IF ~~ THEN BEGIN PasRedemption
 SAY @828 = @829 = @830 = @831 = @83100
 IF ~~ THEN DO ~TakePartyItem("#SMaBody")
                DestroyItem("#SMaBody")
                TakePartyItem("#SYaman1")
                DestroyItem("#SYaman1")
                ChangeAlignment("#Severian",NEUTRAL_EVIL)
                AddJournalEntry(@83102,INFO)
                SetGlobal("#SYaman2Creation","GLOBAL",1)
                SetGlobal("#SeverEnterrement","GLOBAL",-1)
                SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                SetDialog("#SeverJ")~ EXIT
                
END

IF ~~ THEN BEGIN Redemption
 SAY @832
 IF ~~ THEN REPLY @83200 GOTO FilleDieu
 IF ~~ THEN REPLY @83201 GOTO PlusHumain 
END

IF ~~ THEN BEGIN FilleDieu 
 SAY @833
 IF ~~ THEN GOTO Pacte
END

IF ~~ THEN BEGIN PlusHumain
 SAY @834
 IF ~~ THEN GOTO Pacte
END

IF ~~ THEN BEGIN Pacte
 SAY @835 = @836 = @837 =  @838 =@839
 IF ~~ THEN DO ~TakePartyItem("#SMaBody")
                DestroyItem("#SMaBody")
                TakePartyItem("#SYaman1")
                DestroyItem("#SYaman1")
                ChangeAlignment("#Severian",CHAOTIC_GOOD)
                SetGlobal("#SeverEnterrement","GLOBAL",11)
                SetGlobal("#SeverMallo","GLOBAL",4)
                StartCutSceneMode()
                StartCutScene("#SCutBle")
                SetDialog("#SeverJ")~ EXIT
END

// CHAPITRE 2
// AU COEUR DU VAL
// LA CONVALESCENCE DE SEVERIAN


IF ~Global("#SeverianMailikki","GLOBAL",9)~ THEN BEGIN Convalescence
 SAY @1000 = @1001 = @1002
 IF ~~ THEN DO ~PlaySong(0)
                PlaySound("#SMusicV")
                SetGlobal("#SeverianMailikki","GLOBAL",10)
                SetGlobal("#SClicTalk","GLOBAL",2)
                ForceSpellRES("#SGivSpl","#Severian")
                SetDialog("#SeverJ")
                AddexperienceParty(10000)
                StartCutSceneMode()
                StartCutScene("#SCutMa6")~ EXIT // Obtention capacités spéciales liées à Mailikki
END

// CHAPITRE 2
// REFUS DE CHARNAME (FETE DU VILLAGE)

IF ~Global("#SeverianMailikki","GLOBAL",-3)~ THEN BEGIN Handicap
 SAY @1005
 IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",-4)
                SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                AddJournalEntry(@10050,INFO)
                SetDialog("#SeverJ")~ EXIT
END


// CHAPITRE 2
// MINI QUETE : LA POUPEE DE MALLORY

IF ~Global("#SeverianMailikki","GLOBAL",17)~ THEN BEGIN Poupee
 SAY @1006 = @1007 = @1008
 IF ~~ THEN DO ~PlaySong(0)
                PlaySound("#SMusicV")
                SetGlobal("#SeverianMailikki","GLOBAL",18)
                ActionOverride("#Severian",CreateItem("#SPoup",0,0,0))
                SetDialog("#SeverJ")~ EXIT
END

// CHAPITRE 2
// MINI QUETE : L'ESCAPADE D'ONYX

IF ~Global("#SPinkieQuete","GLOBAL",8)
    Global("#SMalloQuete","GLOBAL",9)~ THEN BEGIN Ressource
 SAY @1010
 IF ~~ THEN REPLY @1011 GOTO RatisserVal
 IF ~~ THEN REPLY @1012 GOTO Culottes
END

IF ~~ THEN BEGIN Culottes
 SAY @1013
 IF ~~ THEN REPLY @1014 GOTO RatisserVal
END

IF ~~ THEN BEGIN RatisserVal
 SAY @1015
 IF ~~ THEN REPLY @1016 GOTO Impossible
END

IF ~~ THEN BEGIN Impossible
 SAY @1017 = @1018
 IF ~~ THEN DO ~SetGlobal("#SPinkieQuete","GLOBAL",9)
                SetGlobal("#SMalloQuete","GLOBAL",10)
                SetGlobal("#SBlaiddQuete","GLOBAL",1)
                AddJournalEntry(@1019,QUEST)
                SetDialog("#SeverJ")~ EXIT
END

// Chapitre 2
// Essayage de costumes

IF ~Global("#SeverianMailikki","GLOBAL",19)~ THEN BEGIN SoirMariage
 SAY @1025 = @1026
 IF ~~ THEN REPLY @10260 GOTO HausseEpaules
 IF ~~ THEN REPLY @10261 GOTO Enigmatique
 IF ~~ THEN REPLY @10262 GOTO ArmuresEpees
END

IF ~~ THEN BEGIN ArmuresEpees
 SAY @10280 = @10281
 IF ~~ THEN REPLY @10270 GOTO ChemiseHostile
 IF ~~ THEN REPLY @10271 GOTO ChemiseAide
 IF ~~ THEN REPLY @10272 GOTO Rechigner
END

IF ~~ THEN BEGIN HausseEpaules
 SAY @1027
 IF ~~ THEN REPLY @10270 GOTO ChemiseHostile
 IF ~~ THEN REPLY @10271 GOTO ChemiseAide
 IF ~~ THEN REPLY @10272 GOTO Rechigner
END

IF ~~ THEN BEGIN Enigmatique
 SAY @1028
 IF ~~ THEN REPLY @10270 GOTO ChemiseHostile
 IF ~~ THEN REPLY @10271 GOTO ChemiseAide
 IF ~~ THEN REPLY @10272 GOTO Rechigner
END

IF ~~ THEN BEGIN Rechigner
 SAY @90000 = @90001 = @10290 = @1030
 IF ~~ THEN REPLY @10300 GOTO PasPavoiser
 IF ~~ THEN REPLY @10301 GOTO Baratineurs
 IF ~~ THEN REPLY @10302 GOTO Intentions
END

IF ~~ THEN BEGIN Baratineurs
 SAY @10320
 IF ~~ THEN REPLY @10321 GOTO Inexorablement
 IF ~~ THEN REPLY @10322 GOTO Inexorablement
 IF ~~ THEN REPLY @10323 GOTO BlesseVoulais
END
 
IF ~~ THEN BEGIN BlesseVoulais
 SAY @10324
 IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",20)
                SetDialog("#SeverJ")
                StartCutSceneMode() 
                StartCutScene("#SCutApp")~ EXIT
END

IF ~~ THEN BEGIN Inexorablement
 SAY @1033
 IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",20)
                SetDialog("#SeverJ")
                StartCutSceneMode() 
                StartCutScene("#SCutApp")~ EXIT
END

IF ~~ THEN BEGIN PasPavoiser
 SAY @1032
 IF ~~ THEN REPLY @10321 GOTO Inexorablement
 IF ~~ THEN REPLY @10322 GOTO Inexorablement
 IF ~~ THEN REPLY @10323 GOTO BlesseVoulais
END

IF ~~ THEN BEGIN ChemiseHostile
 SAY @90002 = @90001 = @10290 = @1030
 IF ~~ THEN REPLY @10300 GOTO PasPavoiser
 IF ~~ THEN REPLY @10301 GOTO Baratineurs
 IF ~~ THEN REPLY @10302 GOTO Intentions
END

IF ~~ THEN BEGIN ChemiseAide
 SAY @1029 = @10290 = @1030
 IF ~~ THEN REPLY @10300 GOTO PasPavoiser
 IF ~~ THEN REPLY @10301 GOTO Baratineurs
 IF ~~ THEN REPLY @10302 GOTO Intentions
END
 
 
IF ~~ THEN BEGIN Intentions
 SAY @1031
 IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",20)
                SetDialog("#SeverJ")
                StartCutSceneMode() 
                StartCutScene("#SCutApp")~ EXIT
END



// CHAPITRE 2
// LE BAL

IF ~Global("#SConvivesAppear","GLOBAL",4)~ THEN BEGIN TourneDos
 SAY @1050 = @1051
 IF ~~ THEN REPLY @10510 GOTO Debrouiller
 IF ~~ THEN REPLY @10511 GOTO ManqueAssurance
END

IF ~~ THEN BEGIN ManqueAssurance
 SAY @1054
 IF ~~ THEN DO ~SetGlobal("#SConvivesAppear","GLOBAL",5)
                SetDialog("#SeverJ")
                StartCutSceneMode() 
                StartCutScene("#SCutWe3")~ EXIT
END

IF ~~ THEN BEGIN Debrouiller
 SAY @1052 = @1053
 IF ~~ THEN DO ~SetGlobal("#SConvivesAppear","GLOBAL",5)
                SetDialog("#SeverJ")
                StartCutSceneMode() 
                StartCutScene("#SCutWe3")~ EXIT
END

IF ~Global("#SConvivesAppear","GLOBAL",6)~ THEN BEGIN ProcheVous
 SAY @1055 = @1056
 IF ~~ THEN REPLY @10560 GOTO Audace
 IF ~~ THEN REPLY @10561 GOTO ConfianceDesastre
 IF ~~ THEN REPLY @10562 GOTO Stratagemes
END

IF ~~ THEN BEGIN Stratagemes
 SAY @1057 = @1058
 IF ~~ THEN REPLY @10580 GOTO Blessures
 IF ~~ THEN REPLY @10581 GOTO QuelquesMois
END

IF ~~ THEN BEGIN QuelquesMois
 SAY @1059
 IF ~~ THEN REPLY @10590 GOTO Etoffe
 IF ~~ THEN REPLY @10591 GOTO Maitresse
END

IF ~~ THEN BEGIN Maitresse
 SAY @1060
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                TakeItemReplace("#SRingB","#SRingF","#Severian")
                SetDialog("#SeverJ")
                StartCutSceneMode() 
                StartCutScene("#SCutCan")~ EXIT // Romance échouée
END

IF ~~ THEN BEGIN Etoffe
 SAY @1062
 IF ~~ THEN DO ~SetGlobal("#SConvivesAppear","GLOBAL",7)
                SetDialog("#SeverJ")
                StartCutSceneMode() 
                StartCutScene("#SCutWe4")~ EXIT
END

IF ~~ THEN BEGIN Blessures
 SAY @1061 = @1059
 IF ~~ THEN REPLY @10590 GOTO Etoffe
 IF ~~ THEN REPLY @10591 GOTO Maitresse
END

IF ~~ THEN BEGIN ConfianceDesastre
 SAY @1063
 IF ~~ THEN REPLY @10590 GOTO Etoffe
 IF ~~ THEN REPLY @10591 GOTO Maitresse
END

IF ~~ THEN BEGIN Audace
 SAY @1064 = @1062
 IF ~~ THEN DO ~SetGlobal("#SConvivesAppear","GLOBAL",7)
                SetDialog("#SeverJ")
                StartCutSceneMode() 
                StartCutScene("#SCutWe4")~ EXIT
END


// CHAPITRE 3
// LA VALSE

IF ~Global("#SConvivesAppear","GLOBAL",8)~ THEN BEGIN Esplanade
 SAY @1070 = @1071 = @1072 = @1073 = @1074
 IF ~~ THEN REPLY @10740 GOTO AussiBelle
END

IF ~~ THEN BEGIN AussiBelle
 SAY @1075
 IF ~~ THEN REPLY @10750 GOTO MotDire
 IF ~~ THEN REPLY @10751 GOTO MotDire
 IF ~~ THEN REPLY @10752 GOTO Plaque
END

IF ~~ THEN BEGIN Plaque
 SAY @1076
 IF ~~ THEN REPLY @10760 GOTO MotDire
 IF ~~ THEN REPLY @10761 GOTO Poignard
END

IF ~~ THEN BEGIN Poignard
 SAY @1077
 IF ~~ THEN REPLY @10770 GOTO MotDire
 IF ~~ THEN REPLY @10771 GOTO CoeurBrise
END

IF ~~ THEN BEGIN CoeurBrise
 SAY @1078
 IF ~~ THEN DO ~LeaveParty()
                EscapeArea()
                SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                StartCutSceneMode() 
                StartCutScene("#SCutCan")~ EXIT // Romance échouée
END

IF ~~ THEN BEGIN MotDire
 SAY @1079 = @1080 = @1081
 IF ~~ THEN REPLY @10810 GOTO Baiser
 IF ~~ THEN REPLY @10811 GOTO Baiser
END

IF ~~ THEN BEGIN Baiser
 SAY @1082 = @1083 = @1084
 IF ~~ THEN DO ~PlaySong(0)
                PlaySound("#SMusicO")
                SetGlobal("#SConvivesAppear","GLOBAL",9)
                SetDialog("#SeverJ")
                StartCutSceneMode() 
                StartCutScene("#SCutNu1")~ EXIT
END

// CHAPITRE 3
// LES PROMESSES

IF ~Global("#SConvivesAppear","GLOBAL",10)~ THEN BEGIN Promesses
 SAY @1090 = @1091 = @1092 = @1093 = @1094 = @1095 = @1096 = @1097 = @1098
 IF ~~ THEN REPLY @1099 GOTO PassePasse
END

IF ~~ THEN BEGIN PassePasse
 SAY @1100 = @1101
 IF ~~ THEN REPLY @11010 GOTO Satin
 IF ~~ THEN REPLY @11011 GOTO Satin
END

IF ~~ THEN BEGIN Satin
 SAY @1102 = @1103 = @1104 = @1105 = @1106 = @1107 = @1108
 IF ~~ THEN REPLY @110800 GOTO EcrinMain
 IF ~~ THEN REPLY @110801 GOTO Fougueux
 IF ~~ THEN REPLY @110802 GOTO Stupefait
END

IF ~~ THEN BEGIN Stupefait
 SAY @1109
 IF ~~ THEN REPLY @11090 GOTO EcrinMain
 IF ~~ THEN REPLY @11091 GOTO Mortifie
END

IF ~~ THEN BEGIN Mortifie
 SAY @1110
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                TakeItemReplace("#SRingB","#SRingF","#Severian")
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN EcrinMain
 SAY @1111
 IF ~~ THEN REPLY @11110 GOTO Fougueux
 IF ~~ THEN REPLY @11111 GOTO Fougueux
END

IF ~~ THEN BEGIN Fougueux
 SAY @1113 = @1114 = @1115
 IF ~~ THEN REPLY @111500 GOTO PlusJamais
 IF ~~ THEN REPLY @111501 GOTO PlusJamais
END

IF ~~ THEN BEGIN PlusJamais
 SAY @1116
 IF ~~ THEN REPLY @111600 GOTO Gemissements
 IF ~~ THEN REPLY @111601 GOTO Gemissements
END

IF ~~ THEN BEGIN Gemissements
 SAY @1112
 IF ~~ THEN DO ~SetGlobal("#SConvivesAppear","GLOBAL",11)
                RestParty()
                SetDialog("#SeverJ")~ EXIT
END


// REVEIL DANS LE VAL


IF ~Global("#SConvivesAppear","GLOBAL",12)~ THEN BEGIN ReveilVal
 SAY @1120
 IF ~~ THEN REPLY @11200 GOTO Chatouille
 IF ~~ THEN REPLY @11201 GOTO BatRetraite
END

IF ~~ THEN BEGIN BatRetraite
 SAY @1121
 IF ~~ THEN REPLY @11210 GOTO CheminRetour
 IF ~~ THEN REPLY @11211 GOTO Amazone
END

IF ~~ THEN BEGIN Amazone
 SAY @1123
 IF ~~ THEN REPLY @11230 GOTO ChairRouge
 IF ~~ THEN REPLY @11231 GOTO ChairRouge
END

IF ~~ THEN BEGIN ChairRouge
 SAY @1124 = @1125 = @1126
 IF ~~ THEN DO ~PlaySong(0)
                PlaySound("#SMusicS")
                SetGlobal("#SConvivesAppear","GLOBAL",13)
                SetDialog("#SeverJ")
                StartCutSceneMode()
                StartCutScene("#SCutNu2")~ EXIT
END

IF ~~ THEN BEGIN CheminRetour
 SAY @1122
 IF ~~ THEN DO ~SetGlobal("#SConvivesAppear","GLOBAL",13)
                SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                TakeItemReplace("#SRingB","#SRingF","#Severian")
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Chatouille
 SAY @1127
 IF ~~ THEN REPLY @11230 GOTO ChairRouge
 IF ~~ THEN REPLY @11231 GOTO ChairRouge
END


// DEPART DU VAL

IF ~Global("#SConvivesAppear","GLOBAL",20)~ THEN BEGIN Conge
 SAY @1200
 IF ~~ THEN REPLY @1201 DO ~SetGlobal("#SConvivesAppear","GLOBAL",21)
                            SetDialog("#SeverJ")
                            StartCutSceneMode()
                            StartCutScene("#SCutDe1")~ EXIT
END

IF ~Global("#SConvivesAppear","GLOBAL",22)~ THEN BEGIN RetourLoup
 SAY @1202
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")
                StartCutSceneMode()
                StartCutScene("#SCutRet")~ EXIT
END


///////// ROMANCE - PARTIE 2
// ROMANCE DIALOGUE 9

IF ~Global("#SeverLoveTlk","LOCALS",18)
    Global("#SeverRomanceActive","GLOBAL",2)~ THEN BEGIN Massage
SAY @1300 = @1301
IF ~~ THEN REPLY @1302 GOTO CoeurLourd
IF ~~ THEN REPLY @1303 GOTO Instinct
IF ~~ THEN REPLY @1304 GOTO ChangerTon
END

IF ~~ THEN BEGIN ChangerTon
 SAY @1305
 IF ~~ THEN REPLY @1306 GOTO CoeurLourd
 IF ~~ THEN REPLY @1307 GOTO SceneMenage
END

IF ~~ THEN BEGIN SceneMenage
 SAY @1308
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Instinct
 SAY @1309
 IF ~~ THEN REPLY @1310 GOTO Meute
 IF ~~ THEN REPLY @1311 GOTO CoeurLourd
END

IF ~~ THEN BEGIN Meute
 SAY @1312
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN CoeurLourd
 SAY @1313
 IF ~~ THEN REPLY @131300 GOTO Valeurs
 IF ~~ THEN REPLY @131301 GOTO Exaspere
 IF ~~ THEN REPLY @131303 GOTO Tendu
END

IF ~~ THEN BEGIN Exaspere
 SAY @131302
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Tendu
 SAY @131304
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Valeurs
 SAY @1314
 IF ~~ THEN REPLY @131400 GOTO Fourbu
 IF ~~ THEN REPLY @131401 GOTO Indifference
END

IF ~~ THEN BEGIN Indifference
 SAY @1315
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Fourbu
 SAY @1316
 IF ~~ THEN REPLY @131600 GOTO EcrinBras
 IF ~~ THEN REPLY @131601 GOTO MainDos
 IF ~~ THEN REPLY @131602 GOTO Memorable
END

IF ~~ THEN BEGIN Memorable
 SAY @1317
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN EcrinBras
 SAY @1318
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN MainDos
 SAY @1319 = @1320
 IF ~~ THEN GOTO Etreinte
END

IF ~~ THEN BEGIN Etreinte
 SAY @1321
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

// ROMANCE DIALOGUE 10

IF ~Global("#SeverLoveTlk","LOCALS",20)
    Global("#SeverRomanceActive","GLOBAL",2)~ THEN BEGIN EcartGroupe
 SAY @1322
 IF ~~ THEN EXTERN ~#SBlaidd~ LapinTerrier
END

IF ~~ THEN BEGIN Jouet
 SAY @132302
 IF ~~ THEN EXTERN ~#SBlaidd~ Esquive
END

IF ~~ THEN BEGIN Ferraille
 SAY @132304
 IF ~~ THEN EXTERN ~#SBlaidd~ Museau
END

IF ~~ THEN BEGIN Poing
 SAY @132306 = @132307
 IF ~~ THEN REPLY @1324 GOTO LegerSourire
 IF ~~ THEN REPLY @132400 GOTO PasGeste
END

IF ~~ THEN BEGIN PasGeste
 SAY @1325
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetGlobal("#SUnSumBlaidd","GLOBAL",1)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN LegerSourire
 SAY @132401
 IF ~~ THEN REPLY @1326 GOTO Cygne
 IF ~~ THEN REPLY @132600 GOTO ContreAttaque
END

IF ~~ THEN BEGIN Cygne
 SAY @1331
 IF ~~ THEN REPLY @132700 GOTO Levres
 IF ~~ THEN REPLY @132701 GOTO Chemise
 IF ~~ THEN REPLY @132702 GOTO Moqueur
 IF ~~ THEN REPLY @132703 GOTO Souffrante
END

IF ~~ THEN BEGIN ContreAttaque
 SAY @1327
 IF ~~ THEN REPLY @132700 GOTO Levres
 IF ~~ THEN REPLY @132701 GOTO Chemise
 IF ~~ THEN REPLY @132702 GOTO Moqueur
 IF ~~ THEN REPLY @132703 GOTO Souffrante
END

IF ~~ THEN BEGIN Souffrante
 SAY @1328
 IF ~~ THEN REPLY @132800 GOTO JoliMinois
 IF ~~ THEN REPLY @132801 GOTO ContreCoeur
END

IF ~~ THEN BEGIN ContreCoeur
 SAY @1329
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetGlobal("#SUnSumBlaidd","GLOBAL",1)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN JoliMinois
 SAY @1330
 IF ~~ THEN REPLY @132700 GOTO Levres
 IF ~~ THEN REPLY @132701 GOTO Chemise
 IF ~~ THEN REPLY @132702 GOTO Moqueur
END

IF ~~ THEN BEGIN Moqueur
 SAY @1332
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetGlobal("#SUnSumBlaidd","GLOBAL",1)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Chemise
 SAY @1333
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetGlobal("#SUnSumBlaidd","GLOBAL",1)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Levres
 SAY @1334
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetGlobal("#SUnSumBlaidd","GLOBAL",1)
                SetDialog("#SeverJ")~ EXIT
END

// ROMANCE DIALOGUE 11
// PARTIE 1
// NUIT 
// EXTERIEUR

IF ~Global("#SeverLoveTlk","LOCALS",22)
    Global("#SeverDialogue11","GLOBAL",0)
    Global("#SeverDispute","GLOBAL",0)~ THEN BEGIN Blabla
 SAY @1335 = @1336
 IF ~~ THEN REPLY @1336 GOTO SouvenirCoeur
 IF ~~ THEN REPLY @133601 GOTO SauveSorcier
 IF ~~ THEN REPLY @133602 GOTO ImportanceMoi
END

IF ~~ THEN BEGIN ImportanceMoi
 SAY @1337
 IF ~~ THEN GOTO JouetRappelle
END

IF ~~ THEN BEGIN SouvenirCoeur
 SAY @1339
 IF ~~ THEN GOTO JouetRappelle
END
 
IF ~~ THEN BEGIN SauveSorcier
 SAY @1338
 IF ~~ THEN GOTO JouetRappelle
END

IF ~~ THEN BEGIN JouetRappelle
 SAY @1340
 IF ~~ THEN REPLY @134000 GOTO AbsurditeMarmot
 IF ~~ THEN REPLY @134001 GOTO AbsurditeMarmot
 IF ~~ THEN REPLY @134002 GOTO AbsurditeMarmot
END

IF ~~ THEN BEGIN AbsurditeMarmot
 SAY @1341 = @1342
 IF ~~ THEN REPLY @134200 GOTO OutreSatisfait
 IF ~~ THEN REPLY @134201 GOTO OutreSatisfait
 IF ~~ THEN REPLY @134202 GOTO AutresSobres
END

IF ~~ THEN BEGIN AutresSobres
 SAY @1343
 IF ~~ THEN REPLY @134300 GOTO OutreSatisfait
 IF ~~ THEN REPLY @134301 GOTO TaGuiseJolie
END

IF ~~ THEN BEGIN TaGuiseJolie
 SAY @1344
 IF ~~ THEN DO ~SetGlobal("#SeverNoAlcool","GLOBAL",1)
                SetGlobal("#SeverDialogue11","GLOBAL",1)
                RestParty()
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN OutreSatisfait
 SAY @1345 = @1346 = @1347 = @1348 = @1349
 IF ~~ THEN REPLY @134900 GOTO CoteEpee
 IF ~~ THEN REPLY @134901 GOTO ArracheuseDent
 IF ~~ THEN REPLY @134902 GOTO TropBu
END

IF ~~ THEN BEGIN TropBu
 SAY @1350 = @1356
 IF ~~ THEN DO ~SetGlobal("#SeverAlcoolNuit","GLOBAL",1)
                SetGlobal("#SeverDialogue11","GLOBAL",1)
                RestParty()
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN VieilleRengaine
 SAY @1356
 IF ~~ THEN DO ~SetGlobal("#SeverAlcoolNuit","GLOBAL",1)
                SetGlobal("#SeverDialogue11","GLOBAL",1)
                RestParty()
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN ArracheuseDent
 SAY @1351
IF ~~ THEN GOTO OffrirMonde
END

IF ~~ THEN BEGIN CoteEpee
 SAY @1352
 IF ~~ THEN GOTO OffrirMonde
END
 
IF ~~ THEN BEGIN OffrirMonde
 SAY @1353
 IF ~~ THEN REPLY @135300 GOTO VoyageEtoile
 IF ~~ THEN REPLY @135301 GOTO PlanReticent
 IF ~~ THEN REPLY @134902 GOTO TropBu
END

IF ~~ THEN BEGIN VoyageEtoile
 SAY @1355
 IF ~~ THEN GOTO VieilleRengaine
END

IF ~~ THEN BEGIN PlanReticent
 SAY @1354
 IF ~~ THEN GOTO VieilleRengaine
END


// ROMANCE DIALOGUE 11
// PARTIE 2
// MATIN
// EXTERIEUR


IF ~OR(2)
    Global("#SeverAlcoolNuit","GLOBAL",1)
    Global("#SeverNoAlcool","GLOBAL",1)
    Global("#SeverDialogue11","GLOBAL",1)~ THEN BEGIN SeanceRasage
 SAY @1357 = @1358 = @1359 = @1360
 IF ~Global("#SeverAlcoolNuit","GLOBAL",1)~ THEN GOTO Alcool
 IF ~Global("#SeverNoAlcool","GLOBAL",1)~ THEN GOTO NoAlcool
END

// SI CHARNAME A BU

IF ~~ THEN BEGIN Alcool
 SAY @1361 = @1362
 IF ~~ THEN REPLY @136200 GOTO ArmeePassera
 IF ~~ THEN REPLY @136201 GOTO ParierPipe
 IF ~~ THEN REPLY @136202 GOTO Regression
END

IF ~~ THEN BEGIN Regression
 SAY @1368
 IF ~~ THEN GOTO TailleBarbe
END

IF ~~ THEN BEGIN ParierPipe
 SAY @1367
 IF ~~ THEN GOTO TailleBarbe
END

IF ~~ THEN BEGIN ArmeePassera
 SAY @1366
 IF ~~ THEN GOTO TailleBarbe
END

// SI CHARNAME N'A PAS BU

IF ~~ THEN BEGIN NoAlcool
 SAY @1361
 IF ~~ THEN REPLY @136203 GOTO RamollisContact
 IF ~~ THEN REPLY @136204 GOTO IvreCieux
 IF ~~ THEN REPLY @136205 GOTO TetePeur
END

IF ~~ THEN BEGIN RamollisContact
 SAY @1363
 IF ~~ THEN GOTO TailleBarbe
END

IF ~~ THEN BEGIN IvreCieux
 SAY @1364
 IF ~~ THEN GOTO TailleBarbe
END

IF ~~ THEN BEGIN TetePeur
 SAY @1365
 IF ~~ THEN GOTO TailleBarbe
END

// Commun

IF ~~ THEN BEGIN TailleBarbe
 SAY @1369
 IF ~~ THEN REPLY @136900 GOTO Hirsute
 IF ~~ THEN REPLY @136901 GOTO EtatDecevoir
 IF ~~ THEN REPLY @136903 GOTO MoisiIci
 IF ~Global("#SeverAlcoolNuit","GLOBAL",1)~ THEN REPLY @136902 GOTO PousserBoisson
END

IF ~~ THEN BEGIN PousserBoisson
 SAY @1370
 IF ~~ THEN DO ~SetGlobal("#SeverDialogue11","GLOBAL",2)
                IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN MoisiIci
 SAY @1373
  IF ~~ THEN DO ~SetGlobal("#SeverDialogue11","GLOBAL",2)
                 IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                 RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                 SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN EtatDecevoir
 SAY @1372
 IF ~~ THEN DO ~SetGlobal("#SeverDialogue11","GLOBAL",2)
                IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Hirsute
 SAY @1371
 IF ~~ THEN DO ~SetGlobal("#SeverDialogue11","GLOBAL",2)
                IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END


// ROMANCE DIALOGUE 12

IF ~Global("#SeverLoveTlk","LOCALS",24)~ THEN BEGIN Algarade
 SAY @1380 = @1381
 IF ~~ THEN REPLY @138100 GOTO FrontFemme
 IF ~~ THEN REPLY @138101 GOTO FrontFemme
 IF ~~ THEN REPLY @138102 GOTO FrontFemme
END
  
IF ~~ THEN BEGIN FrontFemme
 SAY @1382 = @1383
 IF ~~ THEN REPLY @138300 GOTO Coquard
 IF ~~ THEN REPLY @138301 GOTO Coquard
 IF ~~ THEN REPLY @138302 GOTO MasseMachoire
END

IF ~~ THEN BEGIN MasseMachoire
 SAY @1384
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Coquard
 SAY @1385 = @1386
 IF ~~ THEN REPLY @138600 GOTO MaBiche
 IF ~~ THEN REPLY @138601 GOTO ComparseLapin
 IF ~~ THEN REPLY @138602 GOTO HumeurPlaisanterie
END

IF ~~ THEN BEGIN HumeurPlaisanterie
 SAY @1387
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN MaBiche
 SAY @1389
 IF ~~ THEN GOTO JetteLoin
END

IF ~~ THEN BEGIN ComparseLapin
 SAY @1388
 IF ~~ THEN GOTO JetteLoin
END

IF ~~ THEN BEGIN JetteLoin
 SAY @1390
 IF ~~ THEN REPLY @139000 GOTO CouvertureDos
 IF ~~ THEN REPLY @139001 GOTO CouvertureDos
 IF ~~ THEN REPLY @139002 GOTO QuatreChemin
END

IF ~~ THEN BEGIN QuatreChemin
 SAY @1391
 IF ~~ THEN REPLY @139100 GOTO PromesseEnnemi
 IF ~~ THEN REPLY @139101 GOTO FardeauToi
END

IF ~~ THEN BEGIN FardeauToi
 SAY @1392
 IF ~~ THEN REPLY @139200 GOTO PromesseEnnemi
 IF ~~ THEN REPLY @139201 GOTO DecisionDeux
END

IF ~~ THEN BEGIN DecisionDeux
 SAY @1393
 IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
                SetGlobal("#SClicTalk","GLOBAL",3)
                LeaveParty()
                EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN PromesseEnnemi
 SAY @1400
 IF ~~ THEN GOTO CouvertureDos
END

IF ~~ THEN BEGIN CouvertureDos
 SAY @1401 = @1402 = @1403 = @1404
 IF ~~ THEN REPLY @140400 GOTO Personnalite
 IF ~~ THEN REPLY @140401 GOTO Personnalite
 IF ~~ THEN REPLY @140402 GOTO MaladeFacile
END

IF ~~ THEN BEGIN MaladeFacile
 SAY @1405 = @1406 = @1407
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetDialog("#SeverJ")~ EXIT
END

IF ~~ THEN BEGIN Personnalite
 SAY @1408 = @1409 = @1410 = @1411 = @1412 = @1413
 IF ~~ THEN REPLY @141300 GOTO OsmoseConjuguee
 IF ~~ THEN REPLY @141301 GOTO OsmoseConjuguee
 IF ~~ THEN REPLY @141302 GOTO MeurtrePillage
END

IF ~~ THEN BEGIN MeurtrePillage
 SAY @1414 = @141400
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetGlobal("#SeverianAimeCharname","GLOBAL",1)
                SetDialog("#SeverJ")~ EXIT
END 

IF ~~ THEN BEGIN OsmoseConjuguee
 SAY @1415 = @1416 = @1417
 IF ~~ THEN DO ~IncrementGlobal("#SeverLoveTlk","LOCALS",1)
                RealSetGlobalTimer("#SeverRomance","GLOBAL",3600)
                SetGlobal("#SeverianAimeCharname","GLOBAL",1)
                SetDialog("#SeverJ")~ EXIT
END 


// ROMANCE PARTIE 3 FINAL
// ROMANCE DIALOGUE 12
// SARVAJ

IF ~Global("#SeverLoveTlk","LOCALS",26)~ THEN BEGIN FinQuete 
 SAY @1451
 IF ~~ THEN DO ~PlaySong(0)
                PlaySound("#SMusicV")
                SetGlobal("#SeverLoveTlk","LOCALS",27)
                SetDialog("#SeverJ")
                StartCutSceneMode() 
                StartCutScene("#SCtSar1")~ EXIT
END





APPEND ~#SBlaidd~

    IF ~~ THEN BEGIN Echine
        SAY @352
        IF ~~ THEN REPLY @35200 EXTERN ~#SeverR~ GrosPetrin
        IF ~~ THEN REPLY @35201 EXTERN ~#SeverR~ OursTissu
        IF ~~ THEN REPLY @35202 EXTERN ~#SeverR~ SaleBestiau
    END

    IF ~~ THEN BEGIN PresenceLoup
        SAY @356
        IF ~~ THEN REPLY @35600 EXTERN ~#SeverR~ GrognonExpose
        IF ~~ THEN REPLY @35601 EXTERN ~#SeverR~ GrognonExpose
        IF ~~ THEN REPLY @35602 EXTERN ~#SeverR~ Orties
    END

    IF ~~ THEN BEGIN MuseauHumide
        SAY @359
        IF ~~ THEN REPLY @35900 GOTO Roulade
        IF ~~ THEN REPLY @35901 GOTO Roulade
        IF ~~ THEN REPLY @35902 EXTERN ~#SeverR~ BaveGrouilleux
    END

    IF ~~ THEN BEGIN Roulade
        SAY @361 = @362
        IF ~~ THEN EXTERN ~#SeverR~ ConnaisPas
    END

    IF ~~ THEN BEGIN LapinTerrier
        SAY @132300 = @132301
        IF ~~ THEN EXTERN ~#SeverR~ Jouet
    END

    IF ~~ THEN BEGIN Esquive
        SAY @132303
        IF ~~ THEN EXTERN ~#SeverR~ Ferraille
    END

    IF ~~ THEN BEGIN Museau
        SAY @132305
        IF ~~ THEN EXTERN ~#SeverR~ Poing
    END

END





