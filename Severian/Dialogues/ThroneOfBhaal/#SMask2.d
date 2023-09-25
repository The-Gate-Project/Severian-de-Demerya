BEGIN ~#SMask2~


// AVANT BATAILLE

IF ~Global("#SDernierMiroirAme","GLOBAL",7)~ THEN BEGIN Bataille
SAY @201400
IF ~~ THEN EXTERN ~#Sev25J~ DuperChercher
END

IF ~Global("#SDernierMiroirAme","GLOBAL",8)~ THEN BEGIN Bataille2
SAY @201412
IF ~~ THEN DO ~SetGlobal("#SDernierMiroirAme","GLOBAL",9)
               SetGlobal("#SCombatFinalMod","GLOBAL",1)
               Enemy()
               ActionOverride("#SRasEnd",Enemy())
               ActionOverride("#SVesEnd",Enemy())
               ActionOverride("#Sarev",Enemy())
  
               ActionOverride("#Sarvaj",Enemy())
               ActionOverride("#SIren",Enemy())
               ActionOverride("#SBodhi",Enemy())~ EXIT
END

IF ~~ THEN BEGIN BienPlusPuissant
SAY @201408
IF ~~ THEN EXTERN ~#Sev25J~ TenirEcart
END

IF ~~ THEN BEGIN ArroganteFemelle
SAY @201409
IF ~~ THEN EXTERN ~#Sev25J~ TenirEcart
END






// MORT DE DARKHAN
// SI SEVERIAN EN VIE

IF ~Global("#SDeadDarkhan","GLOBAL",1)~ THEN BEGIN MortDarkhan
SAY @203200
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtDar5")~ EXIT
END


// MORT DE DARKHAN
// SI SEVERIAN MORT

IF ~Global("#SDeadSeverian","GLOBAL",1)~ THEN BEGIN MortDarkhan2
SAY @203209
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtDar5")~ EXIT
END


          
APPEND ~#Sev25J~

 
IF ~~ THEN BEGIN DuperChercher
SAY @201401 = @201402 = @201403
IF ~~ THEN REPLY @201404 EXTERN ~#SMask2~ BienPlusPuissant
IF ~~ THEN REPLY @201405 EXTERN ~#SMask2~ BienPlusPuissant
IF ~~ THEN REPLY @201407 EXTERN ~#SMask2~ ArroganteFemelle
END

IF ~~ THEN BEGIN TenirEcart
SAY @201411
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtDar2")~ EXIT
END


END


