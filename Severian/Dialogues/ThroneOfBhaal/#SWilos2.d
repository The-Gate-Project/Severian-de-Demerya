BEGIN ~#SWilos2~

IF ~Global("#SWilos2","GLOBAL",0)~ THEN BEGIN Wilos1
SAY @200194
IF ~~ THEN EXTERN ~#Sev25J~ Wilos2
END

IF ~~ THEN BEGIN Wilos3
SAY @200196
IF ~~ THEN DO ~SetGlobal("#SWilos2","GLOBAL",1)~ EXIT
END

IF ~Global("#SWilos2","GLOBAL",1)~ THEN BEGIN Wilos4
SAY @200199
IF ~~ THEN EXIT
END

IF ~Global("#SJonLittle","GLOBAL",1)
    Global("#SWilos2","GLOBAL",2)~ THEN BEGIN Wilos5
SAY @200224
IF ~~ THEN EXIT
END


APPEND ~#Sev25J~

  IF ~~ THEN BEGIN Wilos2
  SAY @200195
  IF ~~ THEN EXTERN ~#SWilos2~ Wilos3
  END

END

