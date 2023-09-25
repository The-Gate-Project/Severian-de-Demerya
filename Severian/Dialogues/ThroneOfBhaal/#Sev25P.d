
BEGIN ~#Sev25P~

IF ~Global("#SeverJoined","GLOBAL",1)
    OR(2) 
    Global("#SeverRomanceActive","GLOBAL",3)
    Global("#SeverRomanceActive","GLOBAL",1)
    Gender(Protagonist,FEMALE)~ THEN BEGIN KickOutTob1
  SAY @210000
  IF ~~ THEN REPLY @210008 DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @210007 DO ~SetGlobal("#SeverJoined","GLOBAL",0)~ GOTO KickOutTob4
END

IF ~Global("#SeverJoined","GLOBAL",1)
    Gender(Protagonist,MALE)~ THEN BEGIN KickOutTob2
  SAY @210001
  IF ~~ THEN REPLY @210008 DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @210007 DO ~SetGlobal("#SeverJoined","GLOBAL",0)~ GOTO KickOutTob4
END


IF ~Global("#SeverJoined","GLOBAL",1)
    Global("#SeverRomanceActive","GLOBAL",2)
    Gender(Protagonist,FEMALE)~ THEN BEGIN KickOutTob3
SAY @210002
  IF ~~ THEN REPLY @210003 DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @210004 DO ~SetGlobal("#SeverJoined","GLOBAL",0)~ GOTO KickOutTob5
END



IF ~~ THEN BEGIN KickOutTob4
  SAY @210009
  IF ~~ THEN DO ~EscapeAreaMove("AR4500",2072,1303,4)~ EXIT
END

IF ~~ THEN BEGIN KickOutTob5
  SAY @210005 = @210006
  IF ~~ THEN DO ~EscapeAreaMove("AR4500",2072,1303,4)~ EXIT
END

// APRES KICK OUT TOB, ANTICHAMBRE

IF ~Global("#SeverJoined","GLOBAL",0)
OR(2) 
    Global("#SeverRomanceActive","GLOBAL",3)
    Global("#SeverRomanceActive","GLOBAL",1)
    Gender(Protagonist,FEMALE)~ THEN BEGIN KickOutTob6
  SAY @210010
  IF ~~ THEN REPLY @210011 DO ~SetGlobal("#SeverJoined","GLOBAL",1)
  JoinParty()~ EXIT
  IF ~~ THEN REPLY @210012 EXIT
END

IF ~Global("#SeverJoined","GLOBAL",0)
    Gender(Protagonist,MALE)~ THEN BEGIN KickOutTob7
  SAY @210013
  IF ~~ THEN REPLY @210014 DO ~SetGlobal("#SeverJoined","GLOBAL",1)
  JoinParty()~ EXIT
  IF ~~ THEN REPLY @210012 EXIT
END


IF ~Global("#SeverJoined","GLOBAL",0)
    Global("#SeverRomanceActive","GLOBAL",2)
    Gender(Protagonist,FEMALE)~ THEN BEGIN KickOutTob8
SAY @210015
  IF ~~ THEN REPLY @210016 DO ~SetGlobal("#SeverJoined","GLOBAL",1) JoinParty()~ EXIT
  IF ~~ THEN REPLY @210017 EXIT
END

