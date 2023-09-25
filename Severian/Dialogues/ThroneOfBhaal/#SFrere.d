BEGIN ~#SFrere~

IF ~Global("#SFrereThock","GLOBAL",0)~ THEN BEGIN FrereThock1
SAY @200187
IF ~~ THEN EXTERN ~#Sev25J~ FrereThock2
END

IF ~~ THEN BEGIN FrereThock3
SAY @200189
IF ~~ THEN DO ~SetGlobal("#SFrereThock","GLOBAL",1)~ EXIT
END

IF ~Global("#SFrereThock","GLOBAL",1)~ THEN BEGIN FrereThock4
SAY @200197
IF ~~ THEN EXIT
END

IF ~Global("#SJonLittle","GLOBAL",1)
    Global("#SFrereThock","GLOBAL",2)~ THEN BEGIN FrereThock5
SAY @200221
IF ~~ THEN REPLY @250222 DO ~StartStore("#SFrere1",LastTalkedToBy())~ EXIT
IF ~~ THEN REPLY @250223 DO ~StartStore("#SFrere2",LastTalkedToBy())~ EXIT
IF ~~ THEN REPLY @250224 EXIT

END



APPEND ~#Sev25J~

 IF ~~ THEN BEGIN FrereThock2
  SAY @200188
  IF ~~ THEN EXTERN ~#SFrere~ FrereThock3
 END

END