BEGIN ~#SevPri~

IF ~Global("#SQuatriemeMiroirAme","GLOBAL",5)~ THEN BEGIN PrisonTiraslyn1
SAY @200602
IF ~~ THEN EXTERN ~#SRhyad~ Economise
END

IF ~~ THEN BEGIN Reperer
SAY @200604
IF ~~ THEN EXTERN ~#SRhyad~ SansVisage
END

IF ~~ THEN BEGIN Heresie
SAY @200606
IF ~~ THEN EXTERN ~#SRhyad~ SeMoquer
END

IF ~~ THEN BEGIN Halfshade
SAY @200608
IF ~~ THEN EXTERN ~#SRhyad~ ToutDoux
END

IF ~~ THEN BEGIN Desemparer
SAY @227609
IF ~~ THEN EXTERN ~#SRhyad~ Annees
END

IF ~~ THEN BEGIN Inspecter
SAY @200610
IF ~~ THEN EXTERN ~#SRhyad~ Annees2
END

IF ~~ THEN BEGIN SoudaineMefiance
SAY @227611
IF ~~ THEN EXTERN ~#SRhyad~ Sourire
END

IF ~~ THEN BEGIN Barreaux
SAY @200612
IF ~~ THEN EXTERN ~#SRhyad~ Extorquer
END

IF ~~ THEN BEGIN Semblables
SAY @200614
IF ~~ THEN EXTERN ~#SRhyad~ Escrimer
END

IF ~~ THEN BEGIN BonSang
SAY @200616
IF ~~ THEN EXTERN ~#SRhyad~ Epaules
END


APPEND ~#SRhyad~

  IF ~~ THEN BEGIN Economise
  SAY @200603
  IF ~~ THEN EXTERN ~#SevPri~ Reperer
  END

  IF ~~ THEN BEGIN SansVisage
  SAY @200605
  IF ~~ THEN EXTERN ~#SevPri~ Heresie
  END

  IF ~~ THEN BEGIN SeMoquer
  SAY @200607
  IF ~~ THEN EXTERN ~#SevPri~ Halfshade
  END

  IF ~~ THEN BEGIN ToutDoux
  SAY @227608
  IF ~~ THEN EXTERN ~#SevPri~ Desemparer
  END

  IF ~~ THEN BEGIN Annees
  SAY @200609
  IF ~~ THEN EXTERN ~#SevPri~ Inspecter
  END

  IF ~~ THEN BEGIN Annees2
  SAY @200611
  IF ~~ THEN EXTERN ~#SevPri~ SoudaineMefiance
  END

  IF ~~ THEN BEGIN Sourire
  SAY @227612
  IF ~~ THEN EXTERN ~#SevPri~ Barreaux
  END

  IF ~~ THEN BEGIN Extorquer
  SAY @200613
  IF ~~ THEN EXTERN ~#SevPri~ Semblables
  END

  IF ~~ THEN BEGIN Escrimer
  SAY @200615
  IF ~~ THEN EXTERN ~#SevPri~ BonSang
  END

  IF ~~ THEN BEGIN Epaules
  SAY @200617
  IF ~~ THEN DO ~StartCutSceneMode()
                 StartCutScene("#SCtPri3")~ EXIT
  END

END