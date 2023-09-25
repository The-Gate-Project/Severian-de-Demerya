BEGIN ~#SJolent~

IF ~Global("#SJolentaSeverian","GLOBAL",2)~ THEN BEGIN CatinsAuberge1
SAY @206000
IF ~~ THEN EXTERN ~#Sev25J~ JolentaFahmiya1
END

IF ~~ THEN BEGIN Souillon
SAY @206005
IF ~~ THEN EXTERN ~#SFahmi~ Jalousie
END

IF ~~ THEN BEGIN ThranPrevenir
SAY @206007
IF ~~ THEN EXTERN ~#SFahmi~ Mage
END

IF ~~ THEN BEGIN Blablater
SAY @206013
IF ~~ THEN DO ~SetGlobal("#SJolentaSeverian","GLOBAL",3)
               StartCutSceneMode()
               StartCutScene("#SCtGro1")~ EXIT
END

IF ~Global("#SJolentaSeverian","GLOBAL",6)~ THEN BEGIN CatinsAuberge2
SAY @207016 
IF ~~ THEN EXTERN ~#SGarde2~ JourChance
END



APPEND ~#SFahmi~

IF ~~ THEN BEGIN Jalousie
SAY @206006
IF ~~ THEN EXTERN ~#SJolent~ ThranPrevenir
END

IF ~~ THEN BEGIN Mage
SAY @206008
IF ~~ THEN EXTERN ~#Sev25J~ Agace
END

END


APPEND ~#Sev25J~

IF ~~ THEN BEGIN JolentaFahmiya1
SAY @206001 
IF ~~ THEN REPLY @206002 EXTERN ~#SJolent~ Souillon
IF ~~ THEN REPLY @206003 EXTERN ~#SJolent~ Souillon
IF ~~ THEN REPLY @206004 EXTERN ~#SJolent~ Souillon
END


IF ~~ THEN BEGIN Agace
SAY @206009
IF ~~ THEN REPLY @206010 GOTO Ecoute
IF ~~ THEN REPLY @206011 GOTO Ecoute
END

IF ~~ THEN BEGIN Ecoute
SAY @206012
IF ~~ THEN EXTERN ~#SJolent~ Blablater
END

END

APPEND ~#SGarde2~

IF ~~ THEN BEGIN JourChance
SAY @207017
IF ~~ THEN DO ~SetGlobal("#SJolentaSeverian","GLOBAL",7)
               StartCutSceneMode()
               StartCutScene("#SCtGro5")~ EXIT
END

END