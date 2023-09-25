
BEGIN ~#SValy~

// CHAPITRE 2
// AU COEUR DU VAL
// LA BENEDICTION DE MAILIKKI

IF ~Global("#SeverianMailikki","GLOBAL",3)~ THEN BEGIN Adeptes
 SAY @83 = @84
 IF ~~ THEN GOTO Exploits
END


IF ~Global("#SeverianMailikki","GLOBAL",5)~ THEN BEGIN Benediction
 SAY @1000 = @10220
 IF ~~ THEN GOTO Enfant
END

// DEPART D'IMNESVALE

IF ~Global("#SConvivesAppear","GLOBAL",14)~ THEN BEGIN HeureDepart
  SAY @1022 = @1023
  IF ~~ THEN GOTO AmesSolitaires
END

// ROMANCE FINAL
// SARVAJ

IF ~Global("#SFinalRomance","GLOBAL",3)~ THEN BEGIN Sarvaj2
 SAY @1050
 IF ~~ THEN EXTERN ~#SKalas~ PayerPrix
END

IF ~~ THEN BEGIN Paralyser
 SAY @1053
 IF ~~ THEN REPLY @2001 EXTERN ~#SDorra~ ProtegerVillage
 IF ~~ THEN REPLY @2000 EXTERN ~#SKalas~ Developper
END
  


IF ~~ THEN BEGIN Assister
 SAY @1058
 IF ~~ THEN EXTERN ~#SeverJ~ BelleDame
END

// CABANE DE MERELLA
// IMPLANTATION SUIVANTS DE MAILIKKI
// LE CHOIX DE CHARNAME

IF ~Global("#SRomanceFinalCouronne","GLOBAL",26)~ THEN BEGIN LeChoix
 SAY @1030 = @1031 = @1032 = @1033 = @1034 = @1035 = @1036
 IF ~~ THEN REPLY @103600 GOTO VoieSentiments
 IF ~~ THEN REPLY @103601 GOTO SageDecision
END

// Après mort de Sarvaj

IF ~Global("#SFinalRomanceSuivantsMailikki","GLOBAL",3)~ THEN BEGIN SainSauf
 SAY @4000
 IF ~~ THEN EXTERN ~#SPerian~ IlMort
END

IF ~~ THEN BEGIN Accomplir
 SAY @4013
 IF ~~ THEN EXTERN ~#SPerian~ TrembleJambes
END

IF ~~ THEN BEGIN Messager
 SAY @4018
 IF ~~ THEN EXTERN ~#SeverJ~ Remerciements
END

IF ~~ THEN BEGIN PleineCourage
 SAY @4020
 IF ~~ THEN EXTERN ~#SKalas~ EnAvant
END

IF ~~ THEN BEGIN EnRouteAmis
 SAY @4026
 IF ~~ THEN DO ~PlaySong(0)
                PlaySound("#SMusicY")
                SetGlobal("#SFinalRomanceSuivantsMailikki","GLOBAL",4)
                ActionOverride("#SValyria",EscapeArea())
                ActionOverride("#SNaenia",EscapeArea())
                ActionOverride("#SKalas",EscapeArea())
                ActionOverride("#SDorrana",EscapeArea())
                ActionOverride("#SDuorok",EscapeArea())
                ActionOverride("#SPerian",EscapeArea())~ EXIT

 END

IF ~~ THEN BEGIN AvecPeine
 SAY @4030
 IF ~~ THEN REPLY @4031 EXTERN ~#SValy~ PleineCourage
 IF ~~ THEN REPLY @4032 EXTERN ~#SeverJ~ MiColere
END 

IF ~~ THEN BEGIN TuEsBienvenu
 SAY @4035
 IF ~~ THEN EXTERN ~#SPerian~ ViensNous
END



APPEND ~#SKalas~

 IF ~~ THEN BEGIN PayerPrix
   SAY @1051
   IF ~~ THEN EXTERN ~#SeverJ~ PasIntention
 END

 IF ~~ THEN BEGIN BonneChance
   SAY @1061
   IF ~~ THEN EXTERN ~#SeverJ~ CommencerTraque 
 END

 IF ~~ THEN BEGIN Developper
   SAY @2002
    IF ~~ THEN EXTERN ~#SDorra~ ProtegerVillage
 END

 IF ~~ THEN BEGIN PeuProbable
   SAY @4008
   IF ~~ THEN EXTERN ~#SeverJ~ Mesurer
 END

 IF ~~ THEN BEGIN RaisonAmi
   SAY @4012
   IF ~~ THEN EXTERN ~#SValy~ Accomplir
 END

 IF ~~ THEN BEGIN EnAvant
   SAY @4021
   IF ~~ THEN EXTERN ~#SPerian~ CoudeGeignard
 END

 IF ~~ THEN BEGIN MalCroire
   SAY @4027
   IF ~~ THEN EXTERN ~#SeverJ~ MonAmour
 END

END

APPEND ~#SeverJ~

 IF ~~ THEN BEGIN PasIntention
  SAY @1052
  IF ~~ THEN EXTERN ~#SValy~ Paralyser
 END

 IF ~~ THEN BEGIN BelleDame
  SAY @1059 = @1063
  IF ~~ THEN EXTERN ~#SNaenia~ Collines
 END

 IF ~~ THEN BEGIN CommencerTraque
  SAY @1064
  IF ~~ THEN DO ~SetGlobal("#SFinalRomance","GLOBAL",4)
                 SetGlobal("#SPypDuorok","GLOBAL",1)
                 ActionOverride(Player1,CreateItem("Book59",0,0,0))
                 AddJournalEntry(@3000,QUEST)
                 ActionOverride("#SValyria",EscapeArea())
                 ActionOverride("#SNaenia",EscapeArea())
                 ActionOverride("#SKalas",EscapeArea())
                 ActionOverride("#SDorrana",EscapeArea())~ EXIT

 END

 IF ~~ THEN BEGIN AutresPlans
 SAY @4004
 IF ~~ THEN REPLY @4005 EXTERN ~#SKalas~ PeuProbable
 IF ~~ THEN REPLY @4006 EXTERN ~#SKalas~ MalCroire
 IF ~~ THEN REPLY @4007 EXTERN ~#SKalas~ MalCroire
 END

 IF ~~ THEN BEGIN Mesurer
 SAY @4009
 IF ~~ THEN REPLY @4010 EXTERN ~#SKalas~ RaisonAmi
 IF ~~ THEN REPLY @4011 EXTERN ~#SKalas~ RaisonAmi
 END

 IF ~~ THEN BEGIN Remerciements
 SAY @4019
 IF ~~ THEN EXTERN ~#SValy~ PleineCourage
 END

 IF ~~ THEN BEGIN MonAmour
 SAY @4039
 IF ~~ THEN REPLY @4010 EXTERN ~#SKalas~ RaisonAmi
 IF ~~ THEN REPLY @4011 EXTERN ~#SKalas~ RaisonAmi
 END

 IF ~~ THEN BEGIN Intensite
 SAY @4028
 IF ~~ THEN EXTERN ~#SPerian~ Chouette
 END

 IF ~~ THEN BEGIN MiColere
 SAY @4033 = @4034
 IF ~~ THEN EXTERN ~#SValy~ TuEsBienvenu
 END

 IF ~~ THEN BEGIN DernierRegard
 SAY @4038
 IF ~~ THEN DO ~SetGlobal("#SFinalRomanceSuivantsMailikki","GLOBAL",-1)
                ActionOverride("#SValyria",EscapeArea())
                ActionOverride("#SNaenia",EscapeArea())
                ActionOverride("#SKalas",EscapeArea())
                ActionOverride("#SDorrana",EscapeArea())
                ActionOverride("#SDuorok",EscapeArea())
                ActionOverride("#SPerian",EscapeArea())
                ActionOverride("#Severian",EscapeArea())
                ActionOverride("#Severian",LeaveParty())~ EXIT
 END


END



APPEND ~#SNaenia~

  IF ~~ THEN BEGIN Collines
   SAY @1060
   IF ~~ THEN EXTERN ~#SKalas~ BonneChance
  END

  IF ~~ THEN BEGIN VousDeux
   SAY @4003
   IF ~~ THEN EXTERN ~#SeverJ~ AutresPlans
  END

  IF ~~ THEN BEGIN Malseant
   SAY @4025
   IF ~~ THEN EXTERN ~#SValy~ EnRouteAmis
  END

END

APPEND ~#SDuorok~

  IF ~~ THEN BEGIN HacheBaffe
   SAY @1054
   IF ~~ THEN EXTERN ~#SPerian~ QuiNous
  END

  IF ~~ THEN BEGIN BougreAne
   SAY @1056
   IF ~~ THEN EXTERN ~#SPerian~ Scenario
  END

  IF ~~ THEN BEGIN RajouterPeine
   SAY @4002
   IF ~~ THEN EXTERN ~#SNaenia~ VousDeux
  END

  IF ~~ THEN BEGIN Bourrade
   SAY @4015
   IF ~~ THEN REPLY @4016 EXTERN ~#SValy~ Messager
   IF ~~ THEN REPLY @4017 EXTERN ~#SeverJ~ Intensite
  END 

  IF ~~ THEN BEGIN GratteTete
   SAY @4023
   IF ~~ THEN EXTERN ~#SDorra~ DerniereFois
  END

  IF ~~ THEN BEGIN BeteToril
   SAY @4037
   IF ~~ THEN EXTERN ~#SeverJ~ DernierRegard
  END


END

APPEND ~#SDorra~

  IF ~~ THEN BEGIN ProtegerVillage
    SAY @1062
    IF ~~ THEN EXTERN ~#SDuorok~ HacheBaffe
  END

  IF ~~ THEN BEGIN DerniereFois
    SAY @4024
    IF ~~ THEN EXTERN ~#SNaenia~ Malseant
  END

END


APPEND ~#SPerian~

  IF ~~ THEN BEGIN QuiNous
   SAY @1055 
   IF ~~ THEN EXTERN ~#SDuorok~ BougreAne
  END

  IF ~~ THEN BEGIN Scenario
   SAY @1057
   IF ~~ THEN EXTERN ~#SValy~ Assister
  END

  IF ~~ THEN BEGIN IlMort
   SAY @4001
   IF ~~ THEN EXTERN ~#SDuorok~ RajouterPeine
  END
 
  IF ~~ THEN BEGIN TrembleJambes
   SAY @4014
   IF ~~ THEN EXTERN ~#SDuorok~ Bourrade
  END

  IF ~~ THEN BEGIN CoudeGeignard
   SAY @4022
   IF ~~ THEN EXTERN ~#SDuorok~ GratteTete
  END
 
  IF ~~ THEN BEGIN Chouette
   SAY @4029
   IF ~~ THEN EXTERN ~#SValy~ AvecPeine
  END

  IF ~~ THEN BEGIN ViensNous
   SAY @4036
   IF ~~ THEN EXTERN ~#SDuorok~ BeteToril
  END


END

CHAIN
IF ~~ THEN ~#SValy~ Exploits
    @85
    == ~#SPerian~ @86
    == ~#SDuorok~ @87
    == ~#SPerian~ @88
    == ~#SKalas~ @89
    == ~#SValy~ @90
    == ~#SeverJ~ @91
    == ~#SValy~ @92
    == ~#SeverJ~ @93
    == ~#SValy~ @94 = @95
    == ~#SeverJ~ @96 = @97
    == ~#SDorra~ @98
    == ~#SNaenia~ @99
    == ~#SValy~ @100
    == ~#SeverJ~ @101 = @102 = @103 = @104 = @105
    == ~#SValy~ @106
END IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",4)
                   StartCutSceneMode()
                   StartCutScene("#SCutMa4")~ EXIT


CHAIN
IF ~~ THEN ~#SValy~ Enfant
    @1001
    == ~#SKalas~ @1002
    == ~#SDuorok~ @1003
    == ~#SPerian~ @1004
    == ~#SNaenia~ @1005
    == ~#SValy~ @1006 = @1007
    == ~#SNaenia~ @1008
    == ~#SDorra~ @1009
    == ~#SNaenia~ @10230
    == ~#SPerian~ @1010
    == ~#SDuorok~ @1011
    == ~#SeverJ~ @1012
    == ~#SValy~ @1013
    == ~#SKalas~ @1014
    == ~#SValy~ @1015 = @1016
    == ~#SPerian~ @1017
    == ~#SDuorok~ @1018
    == ~#SKalas~ @1019
    == ~#SPerian~ @1020
    == ~#SDuorok~ @1021

END IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",6)
                   StartCutSceneMode()
                   StartCutScene("#SCutMa5")~ EXIT


CHAIN
IF ~~ THEN ~#SValy~ AmesSolitaires
    @1024
    == ~#SDorra~ @1025
    == ~#SNaenia~ @10250
    == ~#SDorra~ @1026
    == ~#SNaenia~ @10260
    == ~#SKalas~ @1027
END IF ~~ THEN DO ~SetGlobal("#SConvivesAppear","GLOBAL",15)
                   ActionOverride("#SValyria",EscapeArea())
                   
ActionOverride("#SNaenia",EscapeArea())
     
              ActionOverride("#SKalas",EscapeArea())
                   
ActionOverride("#SDorrana",EscapeArea())
                   ActionOverride(Player1,CreateItem("#SCollie",0,0,0))~ EXIT

    
CHAIN
IF ~~ THEN ~#SValy~ SageDecision
    @1037 = @1038
    == ~#SDuorok~ @1039
    == ~#SPerian~ @1040
END IF ~~ THEN DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",27)
                   ActionOverride("#SValyria",DestroySelf())

ActionOverride("#SNaenia",DestroySelf())

              ActionOverride("#SKalas",DestroySelf())

ActionOverride("#SDorrana",DestroySelf())
                   ActionOverride("#SPerian",DestroySelf())

ActionOverride("#SDuorok",DestroySelf())~ EXIT

CHAIN
IF ~~ THEN ~#SValy~ VoieSentiments
    @1041 = @1042
    == ~#SPerian~ @1043
    == ~#SDuorok~ @1044
    == ~#SPerian~ @1045
END IF ~~ THEN DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",29)
                   ActionOverride("#SValyria",DestroySelf())

ActionOverride("#SNaenia",DestroySelf())

              ActionOverride("#SKalas",DestroySelf())

ActionOverride("#SDorrana",DestroySelf())
                   ActionOverride("#SPerian",DestroySelf())

ActionOverride("#SDuorok",DestroySelf())
                   ActionOverride(Player1,LeaveAreaLUA("#SACab","",[473.348],10))~ EXIT






