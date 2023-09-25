BEGIN ~#SAlys~

IF ~Global("#SecondMiroirAme","GLOBAL",9)~ THEN BEGIN EnfanceSeverian
SAY @200254
IF ~~ THEN EXTERN ~#SElva25~ PremiersNes
END

IF ~~ THEN BEGIN CourirBois
 SAY @200256
 IF ~~ THEN EXTERN ~#SGarc25~ Epeiste
END

IF ~~ THEN BEGIN Diner
 SAY @200261
 IF ~~ THEN DO ~SetGlobal("#SecondMiroirAme","GLOBAL",10)
                StartCutSceneMode()
                StartCutScene("#SCtEnf4")~ EXIT
END

APPEND ~#SElva25~

 IF ~~ THEN BEGIN PremiersNes
 SAY @200255
 IF ~~ THEN EXTERN ~#SAlys~ CourirBois
 END

 IF ~~ THEN BEGIN Soucis
 SAY @200258
 IF ~~ THEN EXTERN ~#SGarc25~ Errant
 END

 IF ~~ THEN BEGIN Aventurier
 SAY @200260
 IF ~~ THEN EXTERN ~#SAlys~ Diner

END

END

APPEND ~#SGarc25~

 IF ~~ THEN BEGIN Epeiste
 SAY @200257
 IF ~~ THEN EXTERN ~#SChien~ Aboie1
 END

 IF ~~ THEN BEGIN Errant
 SAY @200259
 IF ~~ THEN EXTERN ~#SElva25~ Aventurier
 END

END


APPEND ~#SChien~ 

 IF ~~ THEN BEGIN Aboie1
 SAY @200251
 IF ~~ THEN EXTERN ~#SElva25~ Soucis
 END

END