BEGIN ~#SValy3~


// RETOUR ANTICHAMBRE
// SI SEVERIAN EST EN VIE

IF ~Global("#SDeadDarkhan","GLOBAL",2)~ THEN BEGIN RetourAntichambre1
SAY @203220
IF ~~ THEN EXTERN ~#Sev25J~ ChoseAccomplir
END

IF ~~ THEN BEGIN CoeurBon
SAY @233221
IF ~~ THEN EXTERN ~#Sev25J~ PretATout
END


// RETOUR ANTICHAMBRE
// SI SEVERIAN EST MORT

IF ~Global("#SDeadSeverian","GLOBAL",2)~ THEN BEGIN RetourAntichambre2
SAY @203221
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtDa10")~ EXIT
END
   



APPEND ~#Sev25J~

 IF ~~ THEN BEGIN ChoseAccomplir
 SAY @233220
 IF ~~ THEN EXTERN ~#SValy3~ CoeurBon
 END

 IF ~~ THEN BEGIN PretATout
 SAY @233222
 IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtDar7")~ EXIT
 END
   


END