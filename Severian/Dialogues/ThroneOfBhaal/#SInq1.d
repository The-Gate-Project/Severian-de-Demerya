BEGIN ~#SInq1~

IF ~Global("#SQuatriemeMiroirAme","GLOBAL",4)~ THEN BEGIN PrisonTiraslyn1
SAY @200601
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtPri2")~ EXIT
END

IF ~Global("#SQuatriemeMiroirAme","GLOBAL",6)~ THEN BEGIN PrisonTiraslyn2
SAY @200618
IF ~~ THEN EXTERN ~#SRhyad~ Prudent
END

IF ~~ THEN BEGIN Meler
SAY @200620 = @200621
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtPri4")~ EXIT
END


APPEND ~#SRhyad~

 IF ~~ THEN BEGIN Prudent
 SAY @200619
 IF ~~ THEN EXTERN ~#SInq1~ Meler
 END

END
