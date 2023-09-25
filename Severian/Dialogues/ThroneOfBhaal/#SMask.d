BEGIN ~#SMask~

IF ~Global("#SeverianMask","GLOBAL",2)~ THEN BEGIN RencontreMask1
SAY @200050 = @200051
IF ~~ THEN EXTERN ~#Sev25J~ Malade
END

IF ~~ THEN BEGIN Malade2
SAY @200053 = @200069
IF ~~ THEN EXTERN ~#Sev25J~ MiserableSoitIl
END

IF ~~ THEN BEGIN Malade5
SAY @200071 = @200059
IF ~~ THEN EXTERN ~#Sev25J~ Malade6
END

IF ~~ THEN BEGIN Malade7
SAY @200061
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtMask")~ EXIT
END

// FIN THRONE OF BHAAL
// APPARITION CHIEN NOIR DANS ANTICHAMBRE

IF ~Global("#SDernierMiroirAme","GLOBAL",6)~ THEN BEGIN SequenceFinTob1
SAY @201300
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCutFi8")~ EXIT
END


// EMPRISONNEMENT SEVERIAN

// DERNIER MIROIR

IF ~Global("#SDernierMiroirAme","GLOBAL",4)~ THEN BEGIN DernierMiroirAme
SAY @200910
IF ~~ THEN EXTERN ~#Sev25J~ LeveEpee
END

IF ~~ THEN BEGIN JouerConscience
SAY @200912
IF ~~ THEN EXTERN ~#Sev25J~ ApprendreFaux
END

IF ~~ THEN BEGIN MoindreImage
SAY @200923
IF ~~ THEN EXTERN ~#Sev25J~ EnvoyeLegion
END

IF ~~ THEN BEGIN SaisirImportance
SAY @200925 = @288925
IF ~~ THEN EXTERN ~#Sev25J~ VoudraitDire
END


IF ~~ THEN BEGIN PlusImportance
SAY @215927
IF ~~ THEN EXTERN ~#Sev25J~ InterditMal
END

APPEND ~#Sev25J~ 

  IF ~~ THEN BEGIN MiserableSoitIl
  SAY @200070
  IF ~~ THEN REPLY @200054 EXTERN ~#Sev25J~ Malade3
  IF ~~ THEN REPLY @200055 EXTERN ~#Sev25J~ Malade3
  IF ~~ THEN REPLY @200056 EXTERN ~#Sev25J~ Malade4
  END

  IF ~~ THEN BEGIN Malade
   SAY @200052
  IF ~~ THEN EXTERN ~#SMask~ Malade2
  END

  IF ~~ THEN BEGIN Malade3
   SAY @200058
   IF ~~ THEN EXTERN ~#SMask~ Malade5
  END

  IF ~~ THEN BEGIN Malade4
   SAY @200057
   IF ~~ THEN EXTERN ~#SMask~ Malade5
  END

  IF ~~ THEN BEGIN Malade6
   SAY @200060
   IF ~~ THEN EXTERN ~#SMask~ Malade7
  END

   IF ~~ THEN BEGIN LeveEpee
   SAY @200911
   IF ~~ THEN EXTERN ~#SMask~ JouerConscience
   END

   IF ~~ THEN BEGIN ApprendreFaux
   SAY @200922
   IF ~~ THEN EXTERN ~#SMask~ MoindreImage
   END

   IF ~~ THEN BEGIN EnvoyeLegion
   SAY @200924
   IF ~~ THEN EXTERN ~#SMask~ SaisirImportance
   END

   IF ~~ THEN BEGIN VoudraitDire
   SAY @215926
   IF ~~ THEN EXTERN ~#SMask~ PlusImportance
   END

   IF ~~ THEN BEGIN InterditMal
   SAY @215928
   IF ~~ THEN DO ~StartCutSceneMode()
                  StartCutScene("#SCutFi4")~ EXIT
 END

END




