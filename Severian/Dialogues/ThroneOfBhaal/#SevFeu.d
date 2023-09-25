BEGIN ~#SevFeu~

IF ~Global("#SFeuDeCamp","GLOBAL",8)~ THEN BEGIN Blabla1
SAY @222504
IF ~~ THEN REPLY @222505 GOTO DemeureSilencieux
IF ~~ THEN REPLY @222507 GOTO DemeureSilencieux
IF ~~ THEN REPLY @222508 GOTO DemeureSilencieux
END

IF ~~ THEN BEGIN DemeureSilencieux
SAY @222509 = @222510 = @222511 = @222515
IF ~~ THEN REPLY @222516 GOTO Dordinaire
IF ~~ THEN REPLY @222517 GOTO AvecFranchise
IF ~~ THEN REPLY @222518 GOTO PreterConfusion
END

IF ~~ THEN BEGIN PreterConfusion
SAY @222524 = @222521 = @222522 = @222523
IF ~~ THEN REPLY @222525 GOTO SerreContreLui
IF ~~ THEN REPLY @222526 GOTO SerreContreLui
IF ~~ THEN REPLY @222527 GOTO AveugleCertitudes
END

IF ~~ THEN BEGIN AveugleCertitudes
SAY @222528 = @222529
IF ~~ THEN DO ~SetGlobal("#SFeuDeCamp","GLOBAL",9)
               StartCutSceneMode()
               StartCutScene("#SCtAmk4")~ EXIT
END

IF ~~ THEN BEGIN Dordinaire
SAY @222519 = @222522 = @222523 
IF ~~ THEN REPLY @222525 GOTO SerreContreLui
IF ~~ THEN REPLY @222526 GOTO SerreContreLui
IF ~~ THEN REPLY @222527 GOTO AveugleCertitudes
END

IF ~~ THEN BEGIN AvecFranchise
SAY @222520 = @222521 = @222522 = @222523
IF ~~ THEN REPLY @222525 GOTO SerreContreLui
IF ~~ THEN REPLY @222526 GOTO SerreContreLui
IF ~~ THEN REPLY @222527 GOTO AveugleCertitudes
END

IF ~~ THEN BEGIN SerreContreLui
SAY @222530 = @222531
IF ~~ THEN DO ~SetGlobal("#SFeuDeCamp","GLOBAL",9)
               StartCutSceneMode()
               StartCutScene("#SCtAmk4")~ EXIT
END



IF ~Global("#SFeuDeCamp","GLOBAL",10)~ THEN BEGIN Cauchemare
SAY @200533
IF ~~ THEN DO ~SetGlobal("#SFeuDeCamp","GLOBAL",11)
               SetGlobal("#SQuatriemeMiroirAme","GLOBAL",1)
               StartCutSceneMode()
               StartCutScene("#SCutMi4")~ EXIT
END

IF ~Global("#SQuatriemeMiroirAme","GLOBAL",15)~ Blabla4
SAY @200655
IF ~~ THEN REPLY @287655 GOTO Reveil1
IF ~~ THEN REPLY @287656 GOTO Reveil2
IF ~~ THEN REPLY @287657 GOTO Reveil3
END

IF ~~ THEN BEGIN Reveil3
SAY @287658 
IF ~~ THEN REPLY @288661 GOTO DesoleSecret1
IF ~~ THEN REPLY @288662 GOTO DesoleSecret2
IF ~~ THEN REPLY @288663 GOTO DesoleSecret3
END

IF ~~ THEN BEGIN Reveil2
SAY @287660 
IF ~~ THEN REPLY @288661 GOTO DesoleSecret1
IF ~~ THEN REPLY @288662 GOTO DesoleSecret2
IF ~~ THEN REPLY @288663 GOTO DesoleSecret3
END

IF ~~ THEN BEGIN Reveil1
SAY @287659 
IF ~~ THEN REPLY @288661 GOTO DesoleSecret1
IF ~~ THEN REPLY @288662 GOTO DesoleSecret2
IF ~~ THEN REPLY @288663 GOTO DesoleSecret3
END

IF ~~ THEN BEGIN DesoleSecret1
SAY @288666
IF ~~ THEN REPLY @287662 GOTO LaTienne
IF ~~ THEN REPLY @287663 GOTO SourireDesir
IF ~~ THEN REPLY @287664 GOTO PasPenserCela
END


IF ~~ THEN BEGIN DesoleSecret2
SAY @288665
IF ~~ THEN REPLY @287662 GOTO LaTienne
IF ~~ THEN REPLY @287663 GOTO SourireDesir
IF ~~ THEN REPLY @287664 GOTO PasPenserCela
END



IF ~~ THEN BEGIN DesoleSecret3
SAY @288664
IF ~~ THEN REPLY @287662 GOTO LaTienne
IF ~~ THEN REPLY @287663 GOTO SourireDesir
IF ~~ THEN REPLY @287664 GOTO PasPenserCela
END


IF ~~ THEN BEGIN SourireDesir
SAY @287674
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtPr12")~ EXIT
END

IF ~~ THEN BEGIN LaTienne
SAY @287672 = @287673
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtPr12")~ EXIT
END


IF ~~ THEN BEGIN PasPenserCela
SAY @287665
IF ~~ THEN REPLY @287666 GOTO AmeGenereuse
IF ~~ THEN REPLY @287667 GOTO GacherMatinee
END

IF ~~ THEN BEGIN GacherMatinee
SAY @287668 = @287669
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtPr12")~ EXIT
END

IF ~~ THEN BEGIN AmeGenereuse
SAY @287670 = @287671
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtPr12")~ EXIT
END




