APPEND ~#SBlaidd~

// Chapitre I - La Rencontre (2ème partie) - Le Recrutement au Cimetière

IF ~See(Player1) Global("#SCimetiere", "GLOBAL",2)~ THEN BEGIN OnyxRencontre
SAY @0 = @1 = @2
IF ~~ THEN REPLY @3 GOTO Patte
IF ~~ THEN REPLY @6 GOTO Patte
IF ~~ THEN REPLY @5 GOTO Depart
END

IF ~~ THEN BEGIN Patte
SAY @4
IF ~~ THEN DO ~SetGlobal("#Scut800","AR0800", 1)~ EXIT
END

IF ~~ THEN BEGIN Depart
SAY @500
IF ~~ THEN DO ~SetGlobal("#SCimetiere", "GLOBAL", 10) EscapeArea()~ EXIT
END

// DEVANT CRYPTE

IF ~Global("#SCimetiere", "GLOBAL",3)~ THEN BEGIN OnyxCrypte
SAY @8
IF ~~ THEN REPLY @10 DO ~SetGlobal("#SCimetiere", "GLOBAL", 4)~ EXIT
IF ~~ THEN REPLY @9 GOTO Lecher
IF ~~ THEN REPLY @13 GOTO DepartCrypte
END

IF ~~ THEN BEGIN DepartCrypte
SAY @1300
IF ~~ THEN DO ~SetGlobal("#SCimetiere", "GLOBAL", 10) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN Lecher
SAY @11
IF ~~ THEN REPLY @10 DO ~SetGlobal("#SCimetiere", "GLOBAL", 4)~ EXIT
IF ~~ THEN REPLY @13 GOTO DepartCrypte
END



// CHAPITRE 2
// MINI QUETE : L'ESCAPADE D'ONYX

IF ~Global("#SeverianMailikki","GLOBAL",13)~ THEN BEGIN Escapade
 SAY @130
 IF ~~ THEN EXTERN ~#SeverJ~ SalesDraps
END

IF ~~ THEN BEGIN RemueQueue
 SAY @132
 IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",14)
                AddJournalEntry(@2000,QUEST)
                TakeItemReplace("#SRingF","#SRingB","#Severian")
                EscapeArea()~ EXIT
END

// CHAPITRE 2
// L'ESCAPADE D'ONYX
// L'AMOUREUSE D'ONYX

IF ~Global("#SBlaiddQuete","GLOBAL",2)~ THEN BEGIN Louve
 SAY @139 = @140
 IF ~~ THEN EXTERN ~#SLouve~ ViePassionnante
END

IF ~~ THEN BEGIN PasPeur
 SAY @142
 IF ~~ THEN REPLY @14200 EXTERN ~#SeverJ~ PommeCape
 IF ~~ THEN REPLY @14201 EXTERN ~#SeverJ~ PommeCape
END

IF ~~ THEN BEGIN MonVieux
 SAY @149
 IF ~~ THEN EXTERN ~#SLouve~ Grognement
END

IF ~~ THEN BEGIN MomentPartir
 SAY @152
 IF ~~ THEN EXTERN ~#SeverJ~ BonneCompagnie
END

IF ~~ THEN BEGIN RouteEnsemble
 SAY @154
 IF ~~ THEN EXTERN ~#SeverJ~ RouteLongue
END

IF ~~ THEN BEGIN SurLit
 SAY @156
 IF ~~ THEN EXTERN ~#SeverJ~ ABientot
END

IF ~~ THEN BEGIN Enthousiaste
 SAY @158
 IF ~~ THEN EXTERN ~#SeverJ~ PaisibleJour
END

// CHAPITRE 2
// LE RETOUR D'ONYX

IF ~Global("#SeverianMailikki","GLOBAL",21)~ THEN EntreeBlaidd
 SAY @200
 IF ~~ THEN EXTERN ~#SeverJ~ SeparerCompagnon
END

IF ~~ THEN BEGIN RoulerDraps
 SAY @202
 IF ~~ THEN EXTERN ~#SeverJ~ Sabote
END



/******** Le bloc ci-dessous doit rester en dernière position ********/
// Renvoi d'Onyx avant la fin normale de la convocation
IF ~Name("#Severian",LastTalkedToBy)~ THEN BEGIN Renvoi
SAY @1000
IF ~~ THEN REPLY @1001 EXIT
IF ~~ THEN REPLY @1002 DO ~ForceSpellRES("#SUnSumB",Myself)~ EXIT
END

END

// Présentation d'Onyx aux membres du groupe

CHAIN
IF ~Global("#Summon1","GLOBAL",1)
    !Global("#SBlaiddAubergeImnesvale","GLOBAL",1)~ THEN ~#SBlaidd~ Presentations
    @20
    == ~#SeverJ~ @21
    == JaheiraJ IF ~InParty("Jaheira")~   THEN @22
    == MinscJ   IF ~InParty("Minsc")~     THEN @23
    == YoshJ    IF ~InParty("Yoshimo")~   THEN @24
    == AerieJ   IF ~InParty("Aerie")~     THEN @25
    == KorganJ  IF ~InParty("Korgan")~    THEN @26
    == ViconiJ  IF ~InParty("Viconia")~   THEN @33
    == NaliaJ   IF ~InParty("Nalia")~     THEN @34
    == EdwinJ   IF ~InParty("Edwin")~     THEN @35
    == AnomenJ  IF ~InParty("Anomen")~    THEN @36
    == KeldorJ  IF ~InParty("Keldorn")~   THEN @37
    == JanJ  IF ~InParty("Jan")~          THEN @38
    == ValygarJ IF ~InParty("Valygar")~   THEN @39
    == CerndJ   IF ~InParty("Cernd")~     THEN @40
    == MazzyJ   IF ~InParty("Mazzy")~     THEN @41
    == HaerDaJ  IF ~InParty("HaerDalis")~ THEN @42
    == Imoen2J   IF ~InParty("Imoen2")~   THEN @43

END IF ~~ THEN EXIT 

// #SeverJ.d

APPEND ~#SeverJ~

  
    IF ~~ THEN BEGIN SalesDraps
       SAY @131
       IF ~~ THEN EXTERN ~#SBlaidd~ RemueQueue
    END

    IF ~~ THEN BEGIN PommeCape
       SAY @143 = @144 = @145
       IF ~~ THEN REPLY @14500 GOTO Realiser
       IF ~~ THEN REPLY @14501 GOTO Realiser
    END

    IF ~~ THEN BEGIN Realiser
       SAY @146 = @147
       IF ~~ THEN EXTERN ~#SBlaidd~ MonVieux
    END

    IF ~~ THEN BEGIN Malaise
       SAY @151
       IF ~~ THEN EXTERN ~#SBlaidd~ MomentPartir
    END
    
    IF ~~ THEN BEGIN BonneCompagnie
       SAY @153
       IF ~~ THEN EXTERN ~#SBlaidd~ RouteEnsemble
    END

    IF ~~ THEN BEGIN RouteLongue
       SAY @155
       IF ~~ THEN EXTERN ~#SBlaidd~ SurLit
    END

    IF ~~ THEN BEGIN ABientot
       SAY @157
       IF ~~ THEN EXTERN ~#SBlaidd~ Enthousiaste
    END

    IF ~~ THEN BEGIN PaisibleJour
       SAY @159
       IF ~~ THEN DO ~SetGlobal("#SBlaiddQuete","GLOBAL",3)
                      SetGlobal("#SClicTalk","GLOBAL",3)
                      AddexperienceParty(6000)
                      StartCutSceneMode()
                      StartCutScene("#SCutLou")~ EXIT 
    END

    IF ~~ THEN BEGIN SeparerCompagnon
       SAY @201
       IF ~~ THEN EXTERN ~#SBlaidd~ RoulerDraps
    END

    IF ~~ THEN BEGIN Sabote
       SAY @203
       IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",22)
                      StartCutSceneMode() 
                      StartCutScene("#SCutAp2")~ EXIT
    END
       

END

APPEND ~#SLouve~
  
    IF ~~ THEN BEGIN ViePassionnante
       SAY @141
       IF ~~ THEN EXTERN ~#SBlaidd~ PasPeur
    END

    IF ~~ THEN BEGIN Grognement
       SAY @150
       IF ~~ THEN EXTERN ~#SeverJ~ Malaise
    END

END
