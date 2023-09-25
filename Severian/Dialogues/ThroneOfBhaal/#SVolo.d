BEGIN ~#SVolo~

IF ~Global("#SFeuDeCamp","GLOBAL",2)~ THEN BEGIN VoloAmkethran1
SAY @200470
IF ~~ THEN REPLY @200471 GOTO VoloEscampette
IF ~~ THEN REPLY @200473 GOTO VoloBalthazar
IF ~~ THEN REPLY @200481 GOTO VoloSurprise
IF ~~ THEN REPLY @200472 GOTO VoloHonneur
IF ~~ THEN REPLY @200474 GOTO VoloManieres
END


IF ~~ THEN BEGIN VoloHonneur
SAY @200476 = @200480 = @200483
IF ~~ THEN EXTERN ~#Sev25J~ Attentif
END

IF ~~ THEN BEGIN VoloSurprise
SAY @200479 = @200480 = @200483
IF ~~ THEN EXTERN ~#Sev25J~ Attentif
END


IF ~~ THEN BEGIN VoloManieres
SAY @200478 = @200480 = @200483
IF ~~ THEN EXTERN ~#Sev25J~ Attentif
END

IF ~~ THEN BEGIN VoloBalthazar
SAY @200477 = @200480 = @200483
IF ~~ THEN EXTERN ~#Sev25J~ Attentif
END

IF ~~ THEN BEGIN VoloEscampette
SAY @200475 = @200480 = @200483
IF ~~ THEN EXTERN ~#Sev25J~ Attentif
END


IF ~~ THEN BEGIN Oreilles
SAY @200485
IF ~~ THEN DO ~SetGlobal("#SFeuDeCamp","GLOBAL",3)
               StartCutSceneMode()
               StartCutScene("#SCtAmk1")~ EXIT
END

// FEU DE CAMP

IF ~Global("#SFeuDeCamp","GLOBAL",4)~ THEN BEGIN VoloAmkethran8
SAY @200490 = @200491
IF ~~ THEN DO ~SetGlobal("#SFeuDeCamp","GLOBAL",5)
               StartCutSceneMode()
               StartCutScene("#SCtAmk2")~ EXIT
END

IF ~Global("#SFeuDeCamp","GLOBAL",6)~ THEN BEGIN VoloAmkethran9
SAY @200492
IF ~~ THEN EXTERN ~#Sev25J~ Impatient
END

IF ~~ THEN BEGIN Historien
SAY @200494 = @200495
IF ~~ THEN REPLY @200496 GOTO Trousses
IF ~~ THEN REPLY @200497 GOTO Daccord
IF ~~ THEN REPLY @200498 EXTERN ~#Sev25J~ MouchePique
END

IF ~~ THEN BEGIN SiBienDire
SAY @200500
IF ~~ THEN EXTERN ~#Sev25J~ FixeFlammes
END

IF ~~ THEN BEGIN Trousses
SAY @200502
IF ~~ THEN EXTERN ~#Sev25J~ FixeFlammes
END

IF ~~ THEN BEGIN Daccord
SAY @200501
IF ~~ THEN EXTERN ~#Sev25J~ FixeFlammes
END

IF ~~ THEN BEGIN JusqueLa
SAY @200504 = @200505 = @200506
IF ~~ THEN DO ~SetGlobal("#SFeuDeCamp","GLOBAL",7)
               StartCutSceneMode()
               StartCutScene("#SCtAmk3")~ EXIT
END

// LE RETOUR DE VOLO

IF ~Global("#SQuatriemeMiroirAme","GLOBAL",16)~ THEN RetourVolo
SAY @200700
IF ~~ THEN REPLY @200701 GOTO Biere1
IF ~~ THEN REPLY @200702 GOTO Biere2
IF ~~ THEN REPLY @200703 GOTO Biere3
END

IF ~~ THEN BEGIN Biere1
SAY @200704 = @200707
IF ~~ THEN EXTERN ~#Sev25J~ RegarderEnsemble
END

IF ~~ THEN BEGIN Biere2
SAY @200706 = @200707
IF ~~ THEN EXTERN ~#Sev25J~ RegarderEnsemble
END


IF ~~ THEN BEGIN Biere3
SAY @200705 = @200707
IF ~~ THEN EXTERN ~#Sev25J~ RegarderEnsemble
END





APPEND ~#Sev25J~ 
 
 IF ~~ THEN BEGIN Attentif
 SAY @200484
 IF ~~ THEN EXTERN ~#SVolo~ Oreilles
 END

 IF ~~ THEN BEGIN Impatient
 SAY @200493
 IF ~~ THEN EXTERN ~#SVolo~ Historien
 END

 IF ~~ THEN BEGIN MouchePique
 SAY @200499
 IF ~~ THEN EXTERN ~#SVolo~ SiBienDire
 END

 IF ~~ THEN BEGIN FixeFlammes
 SAY @200503
 IF ~~ THEN EXTERN ~#SVolo~ JusqueLa
 END
 
 IF ~~ THEN BEGIN RegarderEnsemble
 SAY @200708
 IF ~~ THEN REPLY @279708 GOTO Complice
 IF ~~ THEN REPLY @279709 GOTO Distraitement
 IF ~~ THEN REPLY @279710 GOTO EcarterRenferme
END

 IF ~~ THEN BEGIN EcarterRenferme
 SAY @279713
 IF ~~ THEN DO ~
SetGlobal("#SQuatriemeMiroirAme","GLOBAL",17)
               AddJournalEntry(@915163,INFO)
               AddJournalEntry(@915164,INFO)
                ActionOverride("#SVolo",EscapeArea())~ EXIT
 END


 IF ~~ THEN BEGIN Distraitement
 SAY @279712
 IF ~~ THEN DO ~SetGlobal("#SQuatriemeMiroirAme","GLOBAL",17)
               AddJournalEntry(@915163,INFO)
               AddJournalEntry(@915164,INFO)
               ActionOverride("#SVolo",EscapeArea())~ EXIT
 END

 IF ~~ THEN BEGIN Complice
 SAY @279711
 IF ~~ THEN DO ~SetGlobal("#SQuatriemeMiroirAme","GLOBAL",17)
               AddJournalEntry(@915163,INFO)
               AddJournalEntry(@915164,INFO)
                ActionOverride("#SVolo",EscapeArea())~ EXIT
 END

END
