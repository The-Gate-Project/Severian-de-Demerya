BEGIN ~#SGarde1~

IF ~Global("#SJolentaSeverian","GLOBAL",4)~ THEN BEGIN GardesAuberge1
SAY @207000
IF ~~ THEN EXTERN ~#SGarde2~ Robbie1
END

IF ~~ THEN BEGIN Jikk1
SAY @207003
IF ~~ THEN EXTERN ~#SGarde2~ Robbie2
END

IF ~~ THEN BEGIN Moquer
SAY @207006
IF ~~ THEN EXTERN ~#SGarde2~ Biere
END


APPEND ~#SGarde2~

IF ~~ THEN BEGIN Robbie1
SAY @207001 = @207002
IF ~~ THEN EXTERN ~#SGarde1~ Jikk1
END

IF ~~ THEN BEGIN Robbie2
SAY @207004
IF ~~ THEN EXTERN ~#Sev25J~ Gibier
END

IF ~~ THEN BEGIN Biere
SAY @207007
IF ~~ THEN EXTERN ~#Sev25J~ Tete
END

END


APPEND ~#Sev25J~

IF ~~ THEN BEGIN Gibier
SAY @207005
IF ~~ THEN EXTERN ~#SGarde1~ Moquer
END


IF ~~ THEN BEGIN Tete
SAY @207008
IF ~~ THEN REPLY @207009 GOTO Silence
IF ~~ THEN REPLY @207010 GOTO Silence
IF ~~ THEN REPLY @207011 GOTO Silence
END

IF ~~ THEN BEGIN Silence
SAY @207012
IF ~~ THEN DO ~SetGlobal("#SJolentaSeverian","GLOBAL",5)
               StartCutSceneMode()
               StartCutScene("#SCtGro2")~ EXIT
END

END



