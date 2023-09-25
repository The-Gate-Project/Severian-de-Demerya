BEGIN ~#SBourr~

IF ~Global("#SQuatriemeMiroirAme","GLOBAL",7)~ PrisonTiraslyn1
SAY @200622
IF ~~ THEN EXTERN ~#SevTor~ RienDire
END

IF ~~ THEN BEGIN Zebrures
SAY @200626
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtPri5")~ EXIT
END

IF ~Global("#SQuatriemeMiroirAme","GLOBAL",8)~ THEN BEGIN PrisonTiraslyn2
SAY @200628
IF ~~ THEN EXTERN ~#SMord~ Continuer
END

IF ~~ THEN BEGIN Risque
SAY @200631
IF ~~ THEN EXTERN ~#SMord~ Mais
END

IF ~~ THEN BEGIN EtLui
SAY @200635
IF ~~ THEN EXTERN ~#SMord~ TuePas
END



APPEND ~#SevTor~

  IF ~~ THEN BEGIN RienDire
  SAY @200623
  IF ~~ THEN EXTERN ~#SMord~ Habitude
  END

  IF ~~ THEN BEGIN Gemissements
  SAY @200630
  IF ~~ THEN EXTERN ~#SBourr~ Risque
  END

END

APPEND ~#SMord~

  IF ~~ THEN BEGIN Habitude
  SAY @200624 = @200625
  IF ~~ THEN EXTERN ~#SBourr~ Zebrures
  END

  IF ~~ THEN BEGIN Continuer
  SAY @200629
  IF ~~ THEN EXTERN ~#SevTor~ Gemissements
  END

  IF ~~ THEN BEGIN Mais
  SAY @200632
  IF ~~ THEN EXTERN ~#SInq1~ Monseigneur
  END

  IF ~~ THEN BEGIN Oser
  SAY @200634
  IF ~~ THEN EXTERN ~#SBourr~ EtLui
  END

  IF ~~ THEN BEGIN TuePas
  SAY @200636 = @200637
  IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtPri7")~ EXIT
  END
  
END

APPEND ~#SInq1~

  IF ~~ THEN BEGIN Monseigneur
  SAY @200633
  IF ~~ THEN EXTERN ~#SMord~ Oser
  END

END