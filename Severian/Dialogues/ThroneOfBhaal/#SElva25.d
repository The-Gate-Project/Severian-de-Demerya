BEGIN ~#SElva25~

IF ~Global("#STroisiemeMiroirAme","GLOBAL",5)~ THEN BEGIN AdolescenceSeverian
SAY @200415 = @200416
IF ~~ THEN EXTERN ~#SAdo25~ MondeNuit
END

IF ~~ THEN BEGIN Lecon
SAY @200418
IF ~~ THEN EXTERN ~#SAdo25~ Magicien
END

IF ~~ THEN BEGIN Instant
SAY @200420 
IF ~~ THEN EXTERN ~#SAdo25~ MereMorte
END

IF ~~ THEN BEGIN Vouloir
SAY @200425 = @200426
IF ~~ THEN EXTERN ~#SAdo25~ FaireMal
END

IF ~~ THEN BEGIN ExpressionBlessee
SAY @200421 = @200422 = @200423 
IF ~~ THEN EXTERN ~#SAdo25~ SeBattre
END

IF ~~ THEN BEGIN Ordonner
SAY @200428
IF ~~ THEN EXTERN ~#SAdo25~ Pere
END

IF ~Global("#STroisiemeMiroirAme","GLOBAL",7)~ THEN BEGIN EnfantOmbres
SAY @200430
IF ~~ THEN EXTERN ~#SRas25~ Regretter
END

IF ~~ THEN BEGIN Limbes
SAY @200434
IF ~~ THEN EXTERN ~#SRas25~ Opposer
END

IF ~~ THEN BEGIN TresLoin
SAY @220436
IF ~~ THEN DO ~SetGlobal("#STroisiemeMiroirAme","GLOBAL",8)
                StartCutSceneMode()
                StartCutScene("#SCtAdo3")~ EXIT
END


APPEND ~#SAdo25~

IF ~~ THEN BEGIN MondeNuit
SAY @200417
IF ~~ THEN EXTERN ~#SElva25~ Lecon
END

IF ~~ THEN BEGIN Magicien
SAY @200419
IF ~~ THEN EXTERN ~#SElva25~ Instant
END

IF ~~ THEN BEGIN SeBattre
SAY @200424
IF ~~ THEN EXTERN ~#SElva25~ Vouloir
END

IF ~~ THEN BEGIN FaireMal
SAY @200427
IF ~~ THEN EXTERN ~#SElva25~ Ordonner
END

IF ~~ THEN BEGIN Pere
SAY @200429
IF ~~ THEN DO ~ActionOverride("#SAdo25",DestroySelf())
               ActionOverride("#SBlaidd",DestroySelf())
               SetGlobal("#STroisiemeMiroirAme","GLOBAL",6)  
               StartCutSceneMode()
               StartCutScene("#SCtAdo2")~ EXIT
END

IF ~~ THEN BEGIN MereMorte
SAY @220420
IF ~~ THEN EXTERN ~#SElva25~ ExpressionBlessee
END

END

APPEND ~#SRas25~

 IF ~~ THEN BEGIN Regretter
 SAY @200431
 IF ~~ THEN EXTERN ~#SVes25~ Miserable
 END

 IF ~~ THEN BEGIN Pointer
 SAY @200433
 IF ~~ THEN EXTERN ~#SElva25~ Limbes
 END

 IF ~~ THEN BEGIN Opposer
 SAY @200435
 IF ~~ THEN EXTERN ~#SVes25~ Danser
 END

END

APPEND ~#SVes25~ 
 
 IF ~~ THEN BEGIN Miserable
 SAY @200432
 IF ~~ THEN EXTERN ~#SRas25~ Pointer
 END

 IF ~~ THEN BEGIN Danser
 SAY @200436
 IF ~~ THEN EXTERN ~#SElva25~ TresLoin
END

END
