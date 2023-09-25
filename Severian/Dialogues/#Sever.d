BEGIN ~#Sever~

// Chapitre I - La Rencontre (1ère partie) - Avant Grutt le Demi-Ogre

IF ~NumTimesTalkedTo(0) Global("#SCimetiere", "GLOBAL", 0)~ THEN BEGIN Meeting1
SAY @0 = @133331 = @133332 =@133333
IF ~~ THEN REPLY @1 GOTO Apparence
IF ~~ THEN REPLY @2 GOTO Ennuis
IF ~~ THEN REPLY @3 GOTO Semblables
IF ~~ THEN REPLY @4 GOTO Derange
END

IF ~~ THEN BEGIN Derange
SAY @5
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN Semblables
SAY @6
IF ~~ THEN REPLY @700444 DO ~SetGlobal("#SHugorCreation","AR0704",2) ActionOverride(Player1,StartDialogNoName("#SNoName",Player1))~ EXIT
IF ~~ THEN REPLY @700445 DO ~SetGlobal("#SHugorCreation","AR0704",2) ActionOverride(Player1,StartDialogNoName("#SNoName",Player1))~ EXIT
IF ~~ THEN REPLY @700446 GOTO Derange
END

IF ~~ THEN BEGIN Ennuis
SAY @700447
IF ~~ THEN REPLY @700448 GOTO AlouerServices
IF ~~ THEN REPLY @700449 GOTO Insultes
END

IF ~~ THEN BEGIN Insultes
SAY @700450
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN AlouerServices
SAY @700451
IF ~~ THEN DO ~SetGlobal("#SHugorCreation","AR0704",2) ActionOverride(Player1,StartDialogNoName("#SNoName",Player1))~ EXIT
END

IF ~~ THEN BEGIN Apparence
SAY @700452
IF ~~ THEN REPLY @700453 GOTO RetireJambes
IF ~~ THEN REPLY @700449 GOTO Insultes
END

IF ~~ THEN BEGIN RetireJambes
SAY @700454
IF ~~ THEN DO ~SetGlobal("#SHugorCreation","AR0704",2) ActionOverride(Player1,StartDialogNoName("#SNoName",Player1))~ EXIT
END

//Après la bagarre au Mithrest

IF ~Global("#SDeadHugor","GLOBAL",1)
Dead("#SHugor")
Dead("#SMerc1")
Dead("#SMerc2")
Global("#SCimetiere", "GLOBAL", 0)
~ THEN BEGIN Thanks
SAY @7
IF ~~ THEN REPLY @8 GOTO RendezVousCimetiere
IF ~~ THEN REPLY @9 GOTO ChangeTon
IF ~~ THEN REPLY @10 GOTO PasNet
END

IF ~~ THEN BEGIN RendezVousCimetiere
SAY @130004
IF ~~ THEN DO ~SetGlobal("#SCimetiere", "GLOBAL", 1) SetGlobalTimer("#STmCimetiere","GLOBAL",TWO_DAYS) SetGlobal("#SDeadHugor","GLOBAL",2) ReallyForceSpell("#Severian",WIZARD_IMPROVED_INVISIBILITY) AddJournalEntry(@71006,INFO)
               SetGlobal("#SReplaceClients","GLOBAL",1) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN ChangeTon
SAY @130002 = @130003
IF ~~ THEN DO ~SetGlobal("#SCimetiere", "GLOBAL", 1) SetGlobalTimer("#STmCimetiere","GLOBAL",TWO_DAYS) SetGlobal("#SDeadHugor","GLOBAL",2) ReallyForceSpell("#Severian",WIZARD_IMPROVED_INVISIBILITY) AddJournalEntry(@71006,INFO) 
               SetGlobal("#SReplaceClients","GLOBAL",1) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN PasNet
SAY @13 = @130001
IF ~~ THEN DO ~SetGlobal("#SCimetiere", "GLOBAL", 1) SetGlobalTimer("#STmCimetiere","GLOBAL",TWO_DAYS) SetGlobal("#SDeadHugor","GLOBAL",2) ReallyForceSpell("#Severian",WIZARD_IMPROVED_INVISIBILITY) AddJournalEntry(@71006,INFO) 
               SetGlobal("#SReplaceClients","GLOBAL",1) EscapeArea()~ EXIT
END

// Chapitre I - La Rencontre (Après dialogue télépathique avec Onyx au Cimetière)

IF ~See(Player1) Global("#SCimetiere", "GLOBAL", 5)~
THEN BEGIN DansLaCrypte
  SAY @14 = @15 = @15000 = @16
  IF ~~ THEN REPLY @17 DO ~SetName(@50000)~ GOTO Masque
  IF ~~ THEN REPLY @18 DO ~SetName(@50000)~ GOTO Nerveux
  IF ~~ THEN REPLY @19 DO ~SetName(@50000)~ GOTO TempsEcouter
END

IF ~~ THEN BEGIN TempsEcouter
  SAY @20
  IF ~~ THEN REPLY @25 GOTO Chevaliere
  IF ~~ THEN REPLY @26 GOTO CrypteAbandonnee
  IF ~~ THEN REPLY @27 GOTO Planaire
  IF ~~ THEN REPLY @22 GOTO Magnanime
END

IF ~~ THEN BEGIN Magnanime
  SAY @23
  IF ~~ THEN DO ~SetGlobal("#SCimetiere", "GLOBAL", -1) ActionOverride("#SBlaidd",EscapeArea()) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN Nerveux
  SAY @21
  IF ~~ THEN REPLY @25 GOTO Chevaliere
  IF ~~ THEN REPLY @26 GOTO CrypteAbandonnee
  IF ~~ THEN REPLY @27 GOTO Planaire
END

IF ~~ THEN BEGIN Masque
  SAY @24
  IF ~~ THEN REPLY @25 GOTO Chevaliere
  IF ~~ THEN REPLY @26 GOTO CrypteAbandonnee
  IF ~~ THEN REPLY @27 GOTO Planaire
END
  
IF ~~ THEN BEGIN Planaire
  SAY @30
  IF ~~ THEN REPLY @25 GOTO Chevaliere1
  IF ~~ THEN REPLY @26 GOTO CrypteAbandonnee1
END

IF ~~ THEN BEGIN Chevaliere1
  SAY @28
  IF ~~ THEN REPLY @26 GOTO CrypteAbandonnee2
END

IF ~~ THEN BEGIN CrypteAbandonnee2
  SAY @29
   IF ~~ THEN REPLY @31 GOTO RunePourpre
  IF ~~ THEN REPLY @32 GOTO Meprisant
END

IF ~~ THEN BEGIN CrypteAbandonnee1
  SAY @29
  IF ~~ THEN REPLY @25 GOTO Chevaliere2
END

IF ~~ THEN BEGIN Chevaliere2
  SAY @28
   IF ~~ THEN REPLY @31 GOTO RunePourpre
  IF ~~ THEN REPLY @32 GOTO Meprisant
END

/////////

IF ~~ THEN BEGIN CrypteAbandonnee
  SAY @29
  IF ~~ THEN REPLY @25 GOTO Chevaliere3
  IF ~~ THEN REPLY @27 GOTO Planaire1
END
  
IF ~~ THEN BEGIN Chevaliere3
  SAY @28
  IF ~~ THEN REPLY @27 GOTO Planaire2
END

IF ~~ THEN BEGIN Planaire2
  SAY @30
  IF ~~ THEN REPLY @31 GOTO RunePourpre
  IF ~~ THEN REPLY @32 GOTO Meprisant
END
 

IF ~~ THEN BEGIN Planaire1
  SAY @30
  IF ~~ THEN REPLY @25 GOTO Chevaliere4
END

IF ~~ THEN BEGIN Chevaliere4
  SAY @28
  IF ~~ THEN REPLY @31 GOTO RunePourpre
  IF ~~ THEN REPLY @32 GOTO Meprisant
END

///////////

IF ~~ THEN BEGIN Chevaliere
  SAY @28
  IF ~~ THEN REPLY @26 GOTO CrypteAbandonnee3
  IF ~~ THEN REPLY @27 GOTO Planaire3
END

IF ~~ THEN BEGIN CrypteAbandonnee3
  SAY @29
  IF ~~ THEN REPLY @27 GOTO Planaire4
END

IF ~~ THEN BEGIN Planaire4
  SAY @30
  IF ~~ THEN REPLY @31 GOTO RunePourpre
  IF ~~ THEN REPLY @32 GOTO Meprisant
END

IF ~~ THEN BEGIN Planaire3
  SAY @30
  IF ~~ THEN REPLY @26 GOTO CrypteAbandonnee4
END

IF ~~ THEN BEGIN CrypteAbandonnee4
  SAY @29
  IF ~~ THEN REPLY @31 GOTO RunePourpre
  IF ~~ THEN REPLY @32 GOTO Meprisant
END

IF ~~ THEN BEGIN Meprisant
  SAY @33
  IF ~~ THEN DO ~SetGlobal("#SCimetiere", "GLOBAL", -1) ActionOverride("#SBlaidd",EscapeArea()) EscapeArea()~ EXIT
END


//////////

// RUNE POURPRE

IF ~~ THEN BEGIN RunePourpre
 SAY @34 = @35 = @36 = @37 = @38 = @39
 IF ~~ THEN REPLY @40 GOTO Domaine
 IF ~~ THEN REPLY @41 GOTO OrganisationSournoise
 IF ~~ THEN REPLY @42 GOTO SousEstimer
END

IF ~~ THEN BEGIN SousEstimer
 SAY @43
  IF ~~ THEN DO ~SetGlobal("#SCimetiere", "GLOBAL", -1) ActionOverride("#SBlaidd",EscapeArea()) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN OrganisationSournoise
 SAY @44
 IF ~~ THEN REPLY @45 GOTO Domaine
 IF ~~ THEN REPLY @46 GOTO SacDor
 IF ~~ THEN REPLY @47 GOTO Reverence
END

IF ~~ THEN BEGIN Reverence
 SAY @48
 IF ~~ THEN DO ~SetGlobal("#SCimetiere", "GLOBAL", -1) ActionOverride("#SBlaidd",EscapeArea()) EscapeArea()~ EXIT
END
 
IF ~~ THEN BEGIN SacDor
 SAY @49
 IF ~~ THEN REPLY @45 GOTO Domaine
 IF ~~ THEN REPLY @47 GOTO Reverence
END

IF ~~ THEN BEGIN DevonsPartir
 SAY @53
 IF ~~ THEN DO ~//SetGlobal("#SCimetiere", "GLOBAL", -1)
                 SetGlobal("#SeverJoined","GLOBAL",2)
                 //SetGlobal("#SeverQuest1","GLOBAL",1)
                 AddJournalEntry(@71010,QUEST)
                 JoinParty()~ EXIT
END




BEGIN ~#SeverP~

IF ~Global("#SeverJoined","GLOBAL",1)~ THEN BEGIN KickOut
  SAY @44444
  IF ~~ THEN REPLY @44441 DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @44442 DO ~SetGlobal("#SeverJoined","GLOBAL",0)~ GOTO KickOut1
END

IF ~~ THEN BEGIN KickOut1
  SAY @44443
  IF ~~ THEN DO ~EscapeAreaMove("AR0811",338,363,0)~ EXIT
END

// Ce bloc fait suite au KickOut1, où Severian quitte la zone pour se rendre à la crypte du cimetière:

IF ~Global("#SeverJoined","GLOBAL",0)~ THEN BEGIN KickOut2
  SAY @44447
  IF ~~ THEN REPLY @44446 DO ~SetGlobal("#SeverJoined","GLOBAL",1)
  JoinParty()~ EXIT
  IF ~~ THEN REPLY @44445 EXIT
END


CHAIN
IF ~~ THEN ~#Sever~ Domaine
    @50456 = @51 = @52 
    == JaheiraJ IF ~InParty("Jaheira")~   THEN @54
    == MinscJ   IF ~InParty("Minsc")~     THEN @56
    == AerieJ   IF ~InParty("Aerie")~     THEN @57
    == KorganJ  IF ~InParty("Korgan")~    THEN @55
    == ViconiJ  IF ~InParty("Viconia")
                    Gender(Player1, MALE)~   THEN @58
    == ViconiJ  IF ~InParty("Viconia")
                    Gender(Player1, FEMALE)~ THEN @59
    == YoshJ    IF ~InParty("Yoshimo")~   THEN @60
    == EdwinJ   IF ~InParty("Edwin")~     THEN @61
    == AnomenJ  IF ~InParty("Anomen")~    THEN @62
    == NaliaJ   IF ~InParty("Nalia")~     THEN @63
END IF ~~ THEN GOTO DevonsPartir













