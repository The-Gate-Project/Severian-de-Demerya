BEGIN ~#SAzeem~

IF ~Global("#SAzeem","GLOBAL",0)~ THEN BEGIN Azeem1
SAY @200190
IF ~~ THEN EXTERN ~#Sev25J~ Azeem2
END

IF ~~ THEN BEGIN Azeem3
SAY @200193
IF ~~ THEN DO ~SetGlobal("#SAzeem","GLOBAL",1)~ EXIT
END

IF ~Global("#SAzeem","GLOBAL",1)~ THEN BEGIN Azeem4
SAY @200198
IF ~~ THEN EXIT
END

IF ~Global("#SJonLittle","GLOBAL",1)
    Global("#SAzeem","GLOBAL",2)~ THEN BEGIN Azeem5
SAY @200223
IF ~~ THEN EXIT 
END

APPEND ~#Sev25J~ 

  IF ~~ THEN BEGIN Azeem2
  SAY @200191 = @200192
  IF ~~ THEN EXTERN ~#SAzeem~ Azeem3
  END

END