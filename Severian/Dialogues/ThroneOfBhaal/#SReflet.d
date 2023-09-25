BEGIN ~#SReflet~

// MIROIR 1

IF ~Global("#SeverMiroirAme","GLOBAL",1)~ THEN BEGIN MiroirAme1
SAY @200095
IF ~~ THEN EXTERN ~#Sev25J~ DegaineEpee
END

IF ~~ THEN BEGIN EspererFaire
SAY @200097
IF ~~ THEN EXTERN ~#Sev25J~ ConstructionMentale
END

IF ~~ THEN BEGIN Cristalliser
SAY @200798 = @200098 = @200099  = @200101
IF ~~ THEN EXTERN ~#Sev25J~ Epouvante
END

IF ~~ THEN BEGIN GagnerForce
SAY @200103 = @200104
IF ~~ THEN EXTERN ~#Sev25J~ PoisonParoles
END

IF ~~ THEN BEGIN Naivete
SAY @200106 = @200107
IF ~~ THEN DO ~StartCutSceneMode()
               StartCutScene("#SCtMi20")~ EXIT
END


// MIROIR 2

IF ~Global("#SecondMiroirAme","GLOBAL",3)~ THEN BEGIN SecondMiroirAme
SAY @200240
IF ~~ THEN EXTERN ~#Sev25J~ PleinGre
END

IF ~~ THEN BEGIN Imbecile
SAY @200242 = @200243
IF ~~ THEN DO ~SetGlobal("#SecondMiroirAme","GLOBAL",4)
               StartCutSceneMode()
               StartCutScene("#SCtEnf1")~ EXIT
END

IF ~Global("#SecondMiroirAme","GLOBAL",15)~ THEN BEGIN SecondMiroirAme2
SAY @200266 = @200267
IF ~~ THEN DO ~SetGlobal("#SecondMiroirAme","GLOBAL",16)
               StartCutSceneMode()
               StartCutScene("#SCtEnf7")~ EXIT
END

// MIROIR 3

IF ~Global("#STroisiemeMiroirAme","GLOBAL",3)~ THEN BEGIN TroisiemeMiroirAme
SAY @200410
IF ~~ THEN EXTERN ~#Sev25J~ Contrer
END

IF ~~ THEN BEGIN Impossible
SAY @208412 
IF ~~ THEN EXTERN ~#Sev25J~ AgeComprendre
END

IF ~~ THEN BEGIN DonPrescience
SAY @208414 = @208415 = @200413
IF ~~ THEN DO ~SetGlobal("#STroisiemeMiroirAme","GLOBAL",4)
               StartCutSceneMode()
               StartCutScene("#SCtAdo1")~ EXIT
END

IF ~Global("#STroisiemeMiroirAme","GLOBAL",9)~ THEN BEGIN TroisiemeMiroirAme2
SAY @200437 = @200438
IF ~~ THEN EXTERN ~#Sev25J~ FermeYeux
END

IF ~~ THEN BEGIN Contrer
SAY @200440
IF ~~ THEN EXTERN ~#Sev25J~ Maudir
END

IF ~~ THEN BEGIN Faiblesse
SAY @200442 = @200443
IF ~~ THEN DO ~SetGlobal("#STroisiemeMiroirAme","GLOBAL",10)
               StartCutSceneMode()
               StartCutScene("#SCtAdo4")~ EXIT
END

// MIROIR 4

IF ~Global("#SQuatriemeMiroirAme","GLOBAL",2)~ THEN BEGIN Blabla20
SAY @200550
IF ~~ THEN EXTERN ~#Sev25J~ Acharner
END

IF ~~ THEN BEGIN RenierLiberte
SAY @200552 = @200553
IF ~~ THEN DO ~SetGlobal("#SQuatriemeMiroirAme","GLOBAL",3)
               StartCutSceneMode()
               StartCutScene("#SCtPri1")~ EXIT
END


IF ~Global("#SQuatriemeMiroirAme","GLOBAL",13)~ THEN BEGIN Blabla21
SAY @200650
IF ~~ THEN EXTERN ~#Sev25J~ TropRaison
END

IF ~~ THEN BEGIN TuMeResistes
SAY @200653
IF ~~ THEN EXTERN ~#Sev25J~ AccompagnerFin
END

IF ~~ THEN BEGIN JeTeMaudisNon
SAY @210655
IF ~~ THEN DO ~SetGlobal("#SQuatriemeMiroirAme","GLOBAL",14)
               StartCutSceneMode()
               StartCutScene("#SCtPr11")~ EXIT
END



APPEND ~#Sev25J~

 IF ~~ THEN BEGIN DegaineEpee
  SAY @200096
  IF ~~ THEN EXTERN ~#SReflet~ EspererFaire
 END

 IF ~~ THEN BEGIN Epouvante
  SAY @200100
  IF ~~ THEN EXTERN ~#SReflet~ GagnerForce
 END

 IF ~~ THEN BEGIN PoisonParoles
  SAY @200105
  IF ~~ THEN EXTERN ~#SReflet~ Naivete
 END

 IF ~~ THEN BEGIN PleinGre
 SAY @200241
 IF ~~ THEN EXTERN ~#SReflet~ Imbecile
 END

 IF ~~ THEN BEGIN Contrer
 SAY @200411
 IF ~~ THEN EXTERN ~#SReflet~ Impossible
 END

 IF ~~ THEN BEGIN FermeYeux
 SAY @200439
 IF ~~ THEN EXTERN ~#SReflet~ Contrer
 END

 IF ~~ THEN BEGIN Maudir
 SAY @200441
 IF ~~ THEN EXTERN ~#SReflet~ Faiblesse
 END

 IF ~~ THEN BEGIN Acharner
 SAY @200551
 IF ~~ THEN EXTERN ~#SReflet~ RenierLiberte
 END

 IF ~~ THEN BEGIN TropRaison
 SAY @200651 = @200652
 IF ~~ THEN EXTERN ~#SReflet~ TuMeResistes
 END

 IF ~~ THEN BEGIN AccompagnerFin
 SAY @200654
 IF ~~ THEN EXTERN ~#SReflet~ JeTeMaudisNon
 END

 IF ~~ THEN BEGIN ConstructionMentale
 SAY @200797
 IF ~~ THEN EXTERN ~#SReflet~ Cristalliser
 END

 IF ~~ THEN BEGIN AgeComprendre
 SAY @208413
 IF ~~ THEN EXTERN ~#SReflet~ DonPrescience 
 END

END