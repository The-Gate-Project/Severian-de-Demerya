BEGIN ~#SPetit~

IF ~Global("#SeverYohnLeBronze","GLOBAL",4)~ THEN BEGIN RencontrePetitLoup1
SAY @251100
IF ~~ THEN EXTERN ~#SMaryan~ SeptPieces
END

IF ~~ THEN BEGIN DixPieces
SAY @251102
IF ~~ THEN EXTERN ~#SWilos~ Mulot
END

IF ~~ THEN BEGIN LaBas
SAY @251104
IF ~~ THEN EXTERN ~#SMaryan~ RienDuTout
END


IF ~~ THEN BEGIN JeVousDis
SAY @251106
IF ~~ THEN EXTERN ~#SWilos~ FermeLa
END


IF ~Global("#SeverYohnLeBronze","GLOBAL",6)~ THEN BEGIN RencontrePetitLoup2
SAY @251108
IF ~~ THEN EXTERN ~#SWilos~ TeTaire
END

IF ~~ THEN BEGIN Frotter
SAY @251111
IF ~~ THEN EXTERN ~#Sev25J~ Parlementer
END

IF ~~ THEN BEGIN YeuxBrillants
SAY @251116
IF ~~ THEN EXTERN ~#Sev25J~ LeMulot
END

IF ~~ THEN BEGIN Complicite
SAY @251129
 IF ~~ THEN DO ~SetGlobal("#SeverYohnLeBronze","GLOBAL",7)
                ClearAllActions()
                StartCutSceneMode()
                StartCutScene("#SCutCa1")~ EXIT
END


APPEND ~#SWilos~

 IF ~~ THEN BEGIN Mulot
 SAY @251103
 IF ~~ THEN EXTERN ~#SPetit~ LaBas
 END

 IF ~~ THEN BEGIN FermeLa
 SAY @251107
 IF ~~ THEN DO ~SetGlobal("#SeverYohnLeBronze","GLOBAL",5)~ EXIT
END

  IF ~~ THEN BEGIN TeTaire
 SAY @251109
 IF ~~ THEN EXTERN ~#SMaryan~ MilieuRuines
 END

 IF ~~ THEN BEGIN Baratineur
 SAY @251115
 IF ~~ THEN EXTERN ~#SPetit~ YeuxBrillants
 END

 IF ~~ THEN BEGIN ProvoquerChute
 SAY @251124
 IF ~~ THEN EXTERN ~#SMaryan~ LaFerme
 END

 IF ~~ THEN BEGIN AucuneConfiance
 SAY @251126
 IF ~~ THEN EXTERN ~#Sev25J~ Ironique
 END

END

APPEND ~#SMaryan~

 IF ~~ THEN BEGIN SeptPieces
 SAY @251101
 IF ~~ THEN EXTERN ~#SPetit~ DixPieces
 END

 IF ~~ THEN BEGIN RienDuTout
 SAY @251105
 IF ~~ THEN EXTERN ~#SPetit~ JeVousDis
 END

 IF ~~ THEN BEGIN MilieuRuines
 SAY @251110
 IF ~~ THEN EXTERN ~#SPetit~ Frotter
 END
 
 IF ~~ THEN BEGIN TeteFourres
 SAY @251113
 IF ~~ THEN EXTERN ~#Sev25J~ Desarme
 END

 IF ~~ THEN BEGIN Mefiance
 SAY @251118
 IF ~~ THEN EXTERN ~#Sev25J~ Bruisser
 END

 IF ~~ THEN BEGIN Incredule
 SAY @251120
 IF ~~ THEN REPLY @251121 EXTERN ~#SWilos~ ProvoquerChute
 IF ~~ THEN REPLY @251122 EXTERN ~#SWilos~ ProvoquerChute
 IF ~~ THEN REPLY @251123 EXTERN ~#SWilos~ ProvoquerChute
 END

 IF ~~ THEN BEGIN LaFerme
 SAY @251125
 IF ~~ THEN EXTERN ~#SWilos~ AucuneConfiance
 END

 IF ~~ THEN BEGIN Silence
 SAY @251128
 IF ~~ THEN EXTERN ~#SPetit~ Complicite
 END

END


APPEND ~#Sev25J~

  IF ~~ THEN BEGIN Parlementer
  SAY @251112
  IF ~~ THEN EXTERN ~#SMaryan~ TeteFourres
  END

  IF ~~ THEN BEGIN Desarme
  SAY @251114
  IF ~~ THEN EXTERN ~#SWilos~ Baratineur
  END

  IF ~~ THEN BEGIN LeMulot
  SAY @251117
  IF ~~ THEN EXTERN ~#SMaryan~ Mefiance
  END

  IF ~~ THEN BEGIN Bruisser
  SAY @251119
  IF ~~ THEN EXTERN ~#SMaryan~ Incredule
  END

  IF ~~ THEN BEGIN Ironique
  SAY @251127
  IF ~~ THEN EXTERN ~#SMaryan~ Silence
  END


END
 