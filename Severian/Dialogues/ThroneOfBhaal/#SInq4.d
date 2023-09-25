BEGIN ~#SInq4~

IF ~Global("#SQuatriemeMiroirAme","GLOBAL",9)~ THEN BEGIN PrisonTiraslyn
SAY @200638
IF ~~ EXTERN ~#SevTor~ Qui
END

IF ~Global("#SQuatriemeMiroirAme","GLOBAL",10)~ THEN BEGIN PrisonTiraslyn2
SAY @200640
IF ~~ THEN EXTERN ~#SevPri~ Pourquoi
END

IF ~~ THEN BEGIN Espoir
SAY @200642 
IF ~~ THEN EXTERN ~#SevPri~ Equipement
END

IF ~~ THEN BEGIN Armurerie
SAY @200644
IF ~~ THEN EXTERN ~#SevPri~ DoisBeaucoup
END

IF ~~ THEN BEGIN PrendEpaules
SAY @229645 = @229646
IF ~~ THEN EXTERN ~#SevPri~ PrinceAdrastar
END


APPEND ~#SevTor~ 

 IF ~~ THEN BEGIN Qui
 SAY @200639
 IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtPri8")~ EXIT
 END

END

APPEND ~#SevPri~


 IF ~~ THEN BEGIN Pourquoi
 SAY @200641
 IF ~~ THEN EXTERN ~#SInq4~ Espoir
 END

 IF ~~ THEN BEGIN Equipement
 SAY @200643
 IF ~~ THEN EXTERN ~#SInq4~ Armurerie
 END

 IF ~~ THEN BEGIN DoisBeaucoup
 SAY @200645
 IF ~~ THEN EXTERN ~#SInq4~ PrendEpaules
 END

 IF ~~ THEN BEGIN PrinceAdrastar
 SAY @229647
 IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtPri9")~ EXIT
END
 
END