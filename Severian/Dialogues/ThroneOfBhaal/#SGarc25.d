BEGIN ~#SGarc25~

IF ~Global("#SecondMiroirAme","GLOBAL",5)~ THEN BEGIN EnfanceSeverian
 SAY @200250
 IF ~~ THEN EXTERN ~#SChien~ Aboie
END

IF ~Global("#SecondMiroirAme","GLOBAL",7)~ THEN BEGIN Marche
 SAY @200252 = @200253
 IF ~~ THEN DO ~SetGlobal("#SecondMiroirAme","GLOBAL",8)
                StartCutSceneMode()
                StartCutScene("#SCtEnf3")~ EXIT
 END

IF ~Global("#SecondMiroirAme","GLOBAL",11)~ THEN BEGIN EnfanceSeverian2
SAY @200262 = @200263 = @200264 = @200265
IF ~~ THEN DO ~SetGlobal("#SecondMiroirAme","GLOBAL",12)
               StartCutSceneMode()
               StartCutScene("#SCtEnf5")~ EXIT
END


APPEND ~#SChien~ 

 IF ~~ THEN BEGIN Aboie
 SAY @200251
 IF ~~ THEN DO ~SetGlobal("#SecondMiroirAme","GLOBAL",6)
                StartCutSceneMode()
                StartCutScene("#SCtEnf2")~ EXIT
 END

END

