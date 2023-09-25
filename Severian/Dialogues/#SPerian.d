
BEGIN ~#SPerian~


// CHAPITRE 3
// AUBERGE D'IMNESVALE
// LE TROPHEE DE BLAIDD

IF ~Global("#SBlaiddTrophee","GLOBAL",0)~ THEN BEGIN PetitHomme
 SAY @40 = @41
 IF ~~ THEN EXTERN ~#SeverJ~ RireFranc
END

IF ~~ THEN BEGIN Lourdement
 SAY @44 = @45
 IF ~~ THEN EXTERN ~#SeverJ~ BalloteAir
END

IF ~~ THEN BEGIN Terrifie
 SAY @47
 IF ~~ THEN EXTERN ~#SeverJ~ AccuseChoc
END

IF ~~ THEN BEGIN Talents
 SAY @49
 IF ~~ THEN EXTERN ~#SeverJ~ Invite
END

IF ~Global("#SBlaiddTrophee","GLOBAL",2)~ THEN BEGIN Curiosite
 SAY @53
 IF ~~ THEN EXTERN ~#SeverJ~ Echarpe
END

IF ~~ THEN BEGIN Caisse
 SAY @56
 IF ~~ THEN EXTERN ~#SeverJ~ Nom
END

IF ~~ THEN BEGIN Emprunts
 SAY @58 = @66
 IF ~~ THEN EXTERN ~#SBlaidd~ Grogne
END

IF ~~ THEN BEGIN Messager
 SAY @60
 IF ~~ THEN EXTERN ~#SBlaidd~ Suivre
END

IF ~~ THEN BEGIN Regarder
 SAY @69
 IF ~~ THEN EXTERN ~#SeverJ~ Enigmes
END

IF ~~ THEN BEGIN Saute
 SAY @64
 IF ~~ THEN EXTERN ~#SBlaidd~ Grognement
END             

IF ~~ THEN BEGIN BattreMains
 SAY @71
 IF ~~ THEN DO ~SetGlobal("#SBlaiddTrophee","GLOBAL",3)
                SetGlobal("#SeverianMailikki","GLOBAL",0)
                DestroySelf()
                ActionOverride("#SBlaidd",DestroySelf())
                StartCutSceneMode()
                StartCutScene("#SCutMa3")~ EXIT
END

// CHAPITRE 3
// AU COEUR DU VAL
// RENCONTRE AVEC LES ADEPTES DE MAILIKKI

IF ~Global("#SeverianMailikki","GLOBAL",2)~ THEN BEGIN CoeurVal
 SAY @80 = @81 = @82 
 IF ~~ THEN DO ~PlaySong(0)
                PlaySound("#SMusicS")
                SetGlobal("#SeverianMailikki","GLOBAL",3)~ EXIT
END


// CHAPITRE 3
// AU COEUR DU VAL
// LA CONVALESCENCE DE SEVERIAN

IF ~Global("#SeverianMailikki","GLOBAL",11)~ THEN BEGIN FourreProche
 SAY @100
 IF ~~ THEN GOTO DrowParti
END

IF ~~ THEN BEGIN Mariage
 SAY @105
 IF ~~ THEN REPLY @1050 EXTERN ~#SDuorok~ Invitation
END

IF ~~ THEN BEGIN RenifleMepris
 SAY @108
 IF ~~ THEN EXTERN ~#SDuorok~ GrandCoeur
END

IF ~~ THEN BEGIN AuRevoir
 SAY @110
 IF ~~ THEN EXTERN ~#SDuorok~ ViensDonc
END

IF ~~ THEN BEGIN Joie
 SAY @113
 IF ~~ THEN EXTERN ~#SBlaidd~ Rappel
END

IF ~~ THEN BEGIN Rate
 SAY @115
 IF ~~ THEN EXTERN ~#SDuorok~ Entendu
END


// CHAPITRE 3
// MINI QUETE : LA BIERE DE DUOROK, LES CULOTTES DE PERIAN

IF ~Global("#SeverianMailikki","GLOBAL",19)~ THEN BEGIN Gigue
 SAY @120
 IF ~~ THEN GOTO Complique
END

// CHAPITRE 3
// MINI QUETE : LA BIERE DE DUOROK, LES CULOTTES DE PERIAN

IF ~Global("#SDuoPypEnter","GLOBAL",2)~ THEN BEGIN Scandale
 SAY @130
 IF ~~ THEN EXTERN ~#SDuorok~ Pantalon
END

// CHAPITRE 3
// FIN DE LA MINI QUETE

IF ~Global("#SPinkieQuete","GLOBAL",6)~ THEN BEGIN QuellesNouvelles
  SAY @146
  IF ~~ THEN GOTO Nouvelles
END

IF ~~ THEN BEGIN Ravi
  SAY @137
  IF ~~ THEN EXTERN ~#SDuorok~ Rosir
END

IF ~~ THEN BEGIN Seyantes
  SAY @140
  IF ~~ THEN REPLY @1400 EXTERN ~#SDuorok~ Suivants
  IF ~~ THEN REPLY @1401 EXTERN ~#SDuorok~ GratteTete
END

IF ~~ THEN BEGIN Radin
  SAY @142
  IF ~~ THEN EXTERN ~#SDuorok~ Attrape
END

IF ~~ THEN BEGIN AuSecours
  SAY @144
  IF ~~ THEN DO ~TakePartyItem("#SPants")
                 DestroyItem("#SPants")
                 TakePartyItem("#SBiere")
                 DestroyItem("#SBiere")
                 AddJournalEntry(@4003,QUEST_DONE)
                 SetGlobal("#SPinkieQuete","GLOBAL",7)
                 ActionOverride("#SDuorok",EscapeArea())
                 ActionOverride("#SPerian",EscapeArea())
                 AddexperienceParty(6000)~ EXIT
END

// CHAPITRE 2
// LE RETOUR D'ONYX

IF ~Global("#SeverianMailikki","GLOBAL",23)~ THEN BEGIN SalutToi
 SAY @200
 IF ~~ THEN EXTERN ~#SeverJ~ VoileDeception
END

IF ~~ THEN BEGIN Tournicoter
 SAY @202
 IF ~~ THEN REPLY @20200 EXTERN ~#SeverJ~ PommeMain
 IF ~~ THEN REPLY @20201 EXTERN ~#SeverJ~ PetitJeu
END


// DEPART DU VAL

IF ~Global("#SConvivesAppear","GLOBAL",16)~ THEN BEGIN Partir
 SAY @210
 IF ~~ THEN EXTERN ~#SDuorok~ Presentation
END

IF ~~ THEN BEGIN Jespere
 SAY @213
 IF ~~ THEN EXTERN ~#SDuorok~ AutresFile
END

IF ~~ THEN BEGIN Mais
 SAY @215
 IF ~~ THEN DO ~PlaySong(0)
                PlaySound("#SMusicW")
                SetGlobal("#SConvivesAppear","GLOBAL",17)
                ActionOverride("#SDuorok",EscapeArea())
                ActionOverride("#SPerian",EscapeArea())~ EXIT
END

// ROMANCE FINAL
// SARVAJ

IF ~Global("#SFinalRomance","GLOBAL",1)~ THEN BEGIN Sarvaj1
SAY @300
IF ~~ THEN EXTERN ~#SDuorok~ GrosEnnuis
END

IF ~~ THEN BEGIN FeuSang
SAY @318
IF ~~ THEN EXTERN ~#SDuorok~ BourradePied
END


// ROMANCE, FINAL
// APPARITION PYP ET DUOROK DANS L'ARENE

IF ~Global("#SRomanceFinalCouronne","GLOBAL",23)~ THEN BEGIN Teleportation
 SAY @220
 IF ~~ THEN EXTERN ~#SDuorok~ Braises
END

IF ~~ THEN BEGIN Mal
 SAY @223
 IF ~~ THEN REPLY @22300 EXTERN ~#SDuorok~ RienImpossible
 IF ~~ THEN REPLY @22301 GOTO Confiance
 IF ~~ THEN REPLY @22302 EXTERN ~#SDuorok~ Souffrance
END

IF ~~ THEN BEGIN Conjure
 SAY @228 = @230
 IF ~~ THEN DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",24)
                StartCutSceneMode()
                StartCutScene("#SCutCab")~ EXIT
END

IF ~~ THEN BEGIN Confiance
 SAY @231 = @230
 IF ~~ THEN DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",24)
                StartCutSceneMode()
                StartCutScene("#SCutCab")~ EXIT
END

// Après mort de Sarvaj

IF ~Global("#SFinalRomanceSuivantsMailikki","GLOBAL",1)~ THEN BEGIN SarvajMort
 SAY @500
 IF ~~ THEN EXTERN ~#SDuorok~ PasJeu
END

IF ~~ THEN BEGIN MaisAhEuh
 SAY @503
 IF ~~ THEN DO ~SetGlobal("#SFinalRomanceSuivantsMailikki","GLOBAL",2)
                ActionOverride("#SDuorok",EscapeArea())
                ActionOverride("#SPerian",EscapeArea())
                AddJournalEntry(@1001,QUEST_DONE)~ EXIT
END


CHAIN
IF ~~ THEN ~#SPerian~ Nouvelles
    @132
    == ~#SDuorok~ @133
    == ~#SPerian~ @134
    == ~#SeverJ~ @135
    == ~#SDuorok~ @136
END IF ~~ THEN REPLY @1360 GOTO Ravi


CHAIN
IF ~~ THEN ~#SPerian~ Complique
    @129
    == ~#SDuorok~ @121 = @122 = @123
    == ~#SPerian~ @124
    == ~#SDuorok~ @125
    == ~#SPerian~ @126
    == ~#SDuorok~ @127
    == ~#SPerian~ @128
END IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",20)
                   SetGlobal("#SDuoPypEnter","GLOBAL",1)
                   SetGlobal("#SMalloQuete","GLOBAL",1)
                   SetGlobal("#SPinkieQuete","GLOBAL",1)
                   ActionOverride("#SDuorok",EscapeArea())
                   ActionOverride("#SPerian",EscapeArea())
                   AddJournalEntry(@4001,QUEST)
                   AddJournalEntry(@4002,QUEST)~ EXIT


CHAIN
IF ~~ THEN ~#SPerian~ DrowParti
    @101
    == ~#SDuorok~ @102
    == ~#SPerian~ @103
END IF ~~ THEN REPLY @1030 EXTERN ~#SeverJ~ ParlesTu


APPEND ~#SeverJ~

    IF ~~ THEN BEGIN ParlesTu
          SAY @104
          IF ~~ THEN EXTERN ~#SPerian~ Mariage
    END

    IF ~~ THEN BEGIN Retablir
          SAY @112
          IF ~~ THEN EXTERN ~#SPerian~ Joie
    END

    IF ~~ THEN BEGIN RireFranc
       SAY @42
       IF ~~ THEN EXTERN ~#SBlaidd~ RegretAmuse
    END

    IF ~~ THEN BEGIN BalloteAir
       SAY @46
       IF ~~ THEN EXTERN ~#SPerian~ Terrifie
    END

    IF ~~ THEN BEGIN AccuseChoc
       SAY @48
       IF ~~ THEN EXTERN ~#SPerian~ Talents
    END

    IF ~~ THEN BEGIN Invite
       SAY @50
       IF ~~ THEN DO ~SetGlobal("#SBlaiddTrophee","GLOBAL",1)
                      StartCutSceneMode()
                      StartCutScene("#SCutMa2")~ EXIT
    END

    IF ~~ THEN BEGIN Echarpe
       SAY @54 = @55
       IF ~~ THEN EXTERN ~#SPerian~ Caisse
    END

    IF ~~ THEN BEGIN Nom
       SAY @57
       IF ~~ THEN REPLY @570 EXTERN ~#SPerian~ Emprunts
    END

    IF ~~ THEN BEGIN Enigmes
       SAY @59
       IF ~~ THEN EXTERN ~#SPerian~ Messager
    END

    IF ~~ THEN BEGIN Echange
       SAY @62
       IF ~~ THEN REPLY @620 GOTO Traquenard
       IF ~~ THEN REPLY @621 GOTO Confiance
    END

    IF ~~ THEN BEGIN Confiance
       SAY @63
       IF ~~ THEN EXTERN ~#SPerian~ Saute
    END

    IF ~~ THEN BEGIN Traquenard
       SAY @65
       IF ~~ THEN EXTERN ~#SPerian~ Saute
    END

    IF ~~ THEN BEGIN VoileDeception
       SAY @201
       IF ~~ THEN EXTERN ~#SPerian~ Tournicoter
    END

    IF ~~ THEN BEGIN PommeMain
       SAY @203
       IF ~~ THEN REPLY @206 GOTO NousAttend
    END

    IF ~~ THEN BEGIN PetitJeu
       SAY @205
       IF ~~ THEN REPLY @206 GOTO NousAttend
    END

    IF ~~ THEN BEGIN NousAttend
       SAY @204
       IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",24)
                      StartCutSceneMode()
                      StartCutScene("#SCutWe1")~ EXIT
    END


    IF ~~ THEN BEGIN SorteEnnuis
       SAY @302
       IF ~~ THEN EXTERN ~#SDuorok~ Separation
    END


    IF ~~ THEN BEGIN FronceSourcils
       SAY @304
       IF ~~ THEN EXTERN ~#SDuorok~ Zentharim
    END

    IF ~~ THEN BEGIN Quoi
       SAY @351 = @352
       IF ~~ THEN REPLY @305 GOTO OuRien
       IF ~~ THEN REPLY @306 GOTO VisageMain
       IF ~~ THEN REPLY @307 GOTO GoutteVase
    END


    IF ~~ THEN BEGIN OuRien
       SAY @317
       IF ~~ THEN EXTERN ~#SPerian~ FeuSang
    END

    IF ~~ THEN BEGIN GoutteVase
       SAY @308
       IF ~~ THEN REPLY @309 GOTO VisageMain
       IF ~~ THEN REPLY @310 GOTO ChoqueCroire
    END

    IF ~~ THEN BEGIN ChoqueCroire
       SAY @311 = @312
       IF ~~ THEN DO ~SetGlobal("#SFinalRomance","GLOBAL",-1)
                      ActionOverride("#SDuorok",EscapeArea())
                      ActionOverride("#SPerian",EscapeArea())
                      ActionOverride("#Severian",EscapeArea())
                      ActionOverride("#Severian",LeaveParty())~ EXIT

    END

    IF ~~ THEN BEGIN VisageMain
       SAY @313
       IF ~~ THEN REPLY @315 GOTO Abattement
       IF ~~ THEN REPLY @314 GOTO ChoqueCroire
    END

    IF ~~ THEN BEGIN Abattement
       SAY @316
       IF ~~ THEN EXTERN ~#SPerian~ FeuSang
    END

END



APPEND ~#SDuorok~

    IF ~~ THEN BEGIN Invitation
          SAY @106
          IF ~~ THEN REPLY @1070 DO ~SetGlobal("#SeverianMailikki","GLOBAL",11)~ EXTERN ~#SeverJ~ Retablir
          IF ~~ THEN REPLY @1071 DO ~SetGlobal("#SeverianMailikki","GLOBAL",-1)~ EXTERN ~#SPerian~ RenifleMepris
    END

    IF ~~ THEN BEGIN GrandCoeur
          SAY @109
          IF ~~ THEN EXTERN ~#SPerian~ AuRevoir
    END

    IF ~~ THEN BEGIN ViensDonc
          SAY @111 = @118
          IF ~Global("#SeverianMailikki","GLOBAL",11)~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",12)
                                                                ActionOverride("#SDuorok",EscapeArea())
                                                                ActionOverride("#SPerian",EscapeArea())
                                                                AddJournalEntry(@4000,INFO)~ EXIT
          IF ~Global("#SeverianMailikki","GLOBAL",-1)~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",-2)
                                                                ActionOverride("#SDuorok",EscapeArea())
                                                                ActionOverride("#SPerian",EscapeArea())
                                                                ActionOverride("#SBlaidd",DestroySelf())~ EXIT
    END

    IF ~~ THEN BEGIN Entendu
          SAY @116 = @117
          IF ~~ THEN EXTERN ~#SPerian~ AuRevoir
    END

    IF ~~ THEN BEGIN Pantalon
          SAY @131
          IF ~~ THEN DO ~SetGlobal("#SDuoPypEnter","GLOBAL",3)~ EXIT
    END

    IF ~~ THEN BEGIN Rosir
          SAY @138 = @139
          IF ~~ THEN EXTERN ~#SPerian~ Seyantes
    END

    IF ~~ THEN BEGIN Suivants
          SAY @145
          IF ~~ THEN EXTERN ~#SPerian~ Radin
    END
  
    IF ~~ THEN BEGIN GratteTete
          SAY @141
          IF ~~ THEN EXTERN ~#SPerian~ Radin
    END

    IF ~~ THEN BEGIN Attrape
          SAY @143
          IF ~~ THEN EXTERN ~#SPerian~ AuSecours
    END

    IF ~~ THEN BEGIN Presentation
          SAY @211 = @212
          IF ~~ THEN EXTERN ~#SPerian~ Jespere
    END
          
    IF ~~ THEN BEGIN AutresFile
          SAY @214
          IF ~~ THEN EXTERN ~#SPerian~ Mais
    END

    IF ~~ THEN BEGIN Braises
          SAY @221 = @222
          IF ~~ THEN EXTERN ~#SPerian~ Mal
    END

    IF ~~ THEN BEGIN RienImpossible
          SAY @229
          IF ~~ THEN EXTERN ~#SPerian~ Conjure
    END

    IF ~~ THEN BEGIN Souffrance
          SAY @227
          IF ~~ THEN EXTERN ~#SPerian~ Conjure
    END

    IF ~~ THEN BEGIN GrosEnnuis
          SAY @301
          IF ~~ THEN EXTERN ~#SeverJ~ SorteEnnuis
    END 

    IF ~~ THEN BEGIN Separation
          SAY @303
          IF ~~ THEN EXTERN ~#SeverJ~ FronceSourcils
    END 

    IF ~~ THEN BEGIN BourradePied
          SAY @319
          IF ~~ THEN DO ~SetGlobal("#SFinalRomance","GLOBAL",2)
                         SetGlobal("#SClicTalk","GLOBAL",3)
                         AddJournalEntry(@1000,QUEST)
                         ActionOverride("#SDuorok",EscapeArea())
                         ActionOverride("#SPerian",EscapeArea())~ EXIT
    END

   IF ~~ THEN BEGIN Zentharim
     SAY @350
     IF ~~ THEN EXTERN ~#SeverJ~ Quoi
   END

   IF ~~ THEN BEGIN PasJeu
     SAY @501 = @502
     IF ~~ THEN EXTERN ~#SPerian~ MaisAhEuh
   END

END


APPEND ~#SBlaidd~

    IF ~~ THEN BEGIN RegretAmuse
         SAY @43
         IF ~~ THEN EXTERN ~#SPerian~ Lourdement
    END
        
    IF ~~ THEN BEGIN Suivre
         SAY @61
         IF ~~ THEN EXTERN ~#SeverJ~ Echange
    END

    IF ~~ THEN BEGIN Grogne
         SAY @67
         IF ~~ THEN EXTERN ~#SPerian~ Regarder
    END

    IF ~~ THEN BEGIN Grognement
         SAY @70
         IF ~~ THEN EXTERN ~#SPerian~ BattreMains
    END

    IF ~~ THEN BEGIN Rappel
         SAY @114
         IF ~~ THEN EXTERN ~#SPerian~ Rate
    END

END


