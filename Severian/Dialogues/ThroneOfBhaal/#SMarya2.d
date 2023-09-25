BEGIN ~#SMarya2~

IF ~Global("#SMarya2","GLOBAL",0)~ THEN BEGIN Marya1
SAY @200186
IF ~~ THEN EXIT
END

IF ~Global("#SOpenStore1","GLOBAL",0)
    Global("#SJonLittle","GLOBAL",1)
    Global("#SMarya2","GLOBAL",1)~ THEN BEGIN OpenStore1
SAY @200220
IF ~~ THEN REPLY @250217 DO ~SetGlobal("#SOpenStore1","GLOBAL",1)
                             StartStore("#SMarya2",LastTalkedToBy())~ EXIT
IF ~~ THEN REPLY @250218 DO ~SetGlobal("#SOpenStore1","GLOBAL",1)~ EXIT
IF ~~ THEN REPLY @250219 DO ~SetGlobal("#SOpenStore1","GLOBAL",1)~ EXIT
END

IF ~Global("#SJonLittle","GLOBAL",1)
    Global("#SMarya2","GLOBAL",1)
    Global("#SOpenStore1","GLOBAL",1)~ THEN BEGIN OpenStore2
SAY @250220
IF ~~ THEN REPLY @250217 DO ~StartStore("#SMarya2",LastTalkedToBy())~ EXIT
IF ~~ THEN REPLY @250218 DO ~SetGlobal("#SOpenStore1","GLOBAL",1)~ EXIT
IF ~~ THEN REPLY @250219 DO ~SetGlobal("#SOpenStore1","GLOBAL",1)~ EXIT
END


