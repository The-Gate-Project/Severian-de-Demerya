BEGIN ~#SPetit2~

IF ~Global("#SeverYohnLeBronze","GLOBAL",9)~ THEN BEGIN RencontrePetitLoup1
SAY @252135 = @252136
IF ~~ THEN EXTERN ~#Sev25J~ RencontrePetitLoup2
END

IF ~~ THEN BEGIN RencontrePetitLoup3
SAY @252138 = @252139
IF ~~ THEN EXTERN ~#Sev25J~ ClinDoeil
END

IF ~~ THEN BEGIN Admiratif
SAY @252141
IF ~~ THEN DO ~SetName(@400036)~ EXTERN ~#Sev25J~ Siecles
END

IF ~~ THEN BEGIN NouvelArc
SAY @252143
IF ~~ THEN EXTERN ~#Sev25J~ Raidir
END


IF ~Global("#SPetitLoup","GLOBAL",0)~ THEN BEGIN PetitLoup1
SAY @200225
IF ~~ THEN EXIT 
END

IF ~Global("#SecondMiroirAme","GLOBAL",19)
    Global("#SPetitLoup","GLOBAL",1)
    Global("#STeleportation","GLOBAL",1)
    !Global("#SDepartCamp","GLOBAL",1)~ THEN BEGIN PetitLoup1
SAY @200273
IF ~~ THEN REPLY @200274 DO ~SetGlobal("#SecondMiroirAme","GLOBAL",20)
                             ClearAllActions()
                             StartCutSceneMode()
                             StartCutScene("#SCtTel1")~ EXIT
IF ~~ THEN REPLY @200275 DO ~SetGlobal("#SecondMiroirAme","GLOBAL",20)
                             ClearAllActions()
                             StartCutSceneMode()
                             StartCutScene("#SCtTel1")~ EXIT
IF ~~ THEN REPLY @200276 GOTO PetitLoup2
END

IF ~~ THEN BEGIN PetitLoup2
SAY @250225
IF ~~ THEN DO ~SetGlobal("#SDepartCamp","GLOBAL",1)~ EXIT 
END

IF ~Global("#SecondMiroirAme","GLOBAL",19)
    Global("#SPetitLoup","GLOBAL",1)
    Global("#SDepartCamp","GLOBAL",1)~ THEN BEGIN PetitLoup3
SAY @250226                           
IF ~~ THEN REPLY @200274 DO ~SetGlobal("#SecondMiroirAme","GLOBAL",20)
                             ClearAllActions()
                             StartCutSceneMode()
                             StartCutScene("#SCtTel1")~ EXIT
IF ~~ THEN REPLY @200276 EXIT
END


// APRES CAMP BANDIT
// AVANT MORT YAGA SHURA
// PETIT-LOUP RAMENE LE GROUPE DANS LA FORET

IF ~Global("#SecondMiroirAme","GLOBAL",21)~ THEN BEGIN RetourForetPetitLoup
SAY @200280 = @270584
IF ~~ THEN EXTERN ~#Sev25J~ DeuxJambes
END
IF ~~ THEN BEGIN BonneHeure
SAY @270586
IF ~~ THEN DO ~SetGlobal("#SecondMiroirAme","GLOBAL",22)
               SetGlobal("#SMontsMarcheRomance","GLOBAL",1)
               SetGlobal("#SYagaShuraKill","GLOBAL",1)~ EXIT
END

IF ~Global("#SYagaShuraKill","GLOBAL",1)
    !Global("#SRetourCamp","GLOBAL",2)~ THEN BEGIN MortYagaShura
SAY @200283
IF ~~ THEN REPLY @200284 DO ~ClearAllActions()
                             SetGlobal("#SRetourCamp","GLOBAL",1)
                             StartCutSceneMode()
                             StartCutScene("#SCtTel4")~ EXIT
IF ~~ THEN REPLY @200285 GOTO YeuxNoirs
IF ~~ THEN REPLY @200286 EXIT
END

IF ~~ THEN BEGIN YeuxNoirs
SAY @200287
IF ~~ THEN DO ~ClearAllActions()
               SetGlobal("#SRetourCamp","GLOBAL",1)
               StartCutSceneMode()
               StartCutScene("#SCtTel4")~ EXIT
END

IF ~Global("#SRetourCamp","GLOBAL",2)
    Global("#SYagaShuraKill","GLOBAL",1)~ THEN BEGIN MortYagaShura10
SAY @200283
IF ~~ THEN REPLY @200284 DO ~ClearAllActions()
                             StartCutSceneMode()
                             StartCutScene("#SCtTel6")~ EXIT
IF ~~ THEN REPLY @200285 GOTO YeuxNoirs1
IF ~~ THEN REPLY @200286 EXIT
END

IF ~~ THEN BEGIN YeuxNoirs1
SAY @200287
IF ~~ THEN DO ~ClearAllActions()
               StartCutSceneMode()
               StartCutScene("#SCtTel6")~ EXIT
END

// APRES MORT YAGA SHURA

IF ~Global("#SYagaShuraKill","GLOBAL",3)~ THEN BEGIN Adieux
SAY @280350
IF ~~ THEN EXTERN ~#Sev25J~ Chagrin
END

IF ~~ THEN BEGIN MieuxFaire
SAY @280352 = @280353 = @280354
IF ~~ THEN EXTERN ~#Sev25J~ Epaules
END

IF ~~ THEN BEGIN Adolescent
SAY @280356 = @280357
IF ~~ THEN DO ~AddJournalEntry(@915157,INFO)
               SetGlobal("#SYagaShuraKill","GLOBAL",4)  
               EscapeArea()~ EXIT
END


APPEND ~#Sev25J~

 IF ~~ THEN BEGIN RencontrePetitLoup2
 SAY @252137
 IF ~~ THEN EXTERN ~#SPetit2~ RencontrePetitLoup3
 END

 IF ~~ THEN BEGIN ClinDoeil
 SAY @252140
 IF ~~ THEN EXTERN ~#SPetit2~ Admiratif
 END

 IF ~~ THEN BEGIN Siecles
 SAY @252142
 IF ~~ THEN EXTERN ~#SPetit2~ NouvelArc
 END

 IF ~~ THEN BEGIN Raidir
 SAY @252144
 IF ~~ THEN DO ~SetGlobal("#SeverYohnLeBronze","GLOBAL",10)~ EXIT
 END

 IF ~~ THEN BEGIN DeuxJambes
 SAY @270585
 IF ~~ THEN EXTERN ~#SPetit2~ BonneHeure
 END

 IF ~~ THEN BEGIN Chagrin
 SAY @280351
 IF ~~ THEN EXTERN ~#SPetit2~ MieuxFaire
 END

 IF ~~ THEN BEGIN Epaules
 SAY @280355
 IF ~~ THEN EXTERN ~#SPetit2~ Adolescent
 END

END
