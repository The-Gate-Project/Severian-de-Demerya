
BEGIN ~#SevBles~


// CHAPITRE 3
// LA BLESSURE DE SEVERIAN


IF ~Global("#SeverianBlessure","GLOBAL",1)~ THEN BEGIN Blessure
 SAY @0 = @1 = @2 = @3
 IF ~~ THEN REPLY @300 GOTO Delicatesse
 IF ~~ THEN REPLY @301 GOTO Expertes
END

IF ~~ THEN BEGIN Delicatesse
 SAY @8
 IF ~~ THEN GOTO Enfoui
END

IF ~~ THEN BEGIN Expertes
 SAY @4 = @5 = @6
 IF ~~ THEN REPLY @600 GOTO Tendu
 IF ~~ THEN REPLY @601 GOTO PesteDifficile
END

IF ~~ THEN BEGIN PesteDifficile
 SAY @700
 IF ~~ THEN GOTO Enfoui
END

IF ~~ THEN BEGIN Tendu
 SAY @7
 IF ~~ THEN GOTO Enfoui
END

IF ~~ THEN BEGIN Enfoui
 SAY @9 = @10 = @11
 IF ~~ THEN REPLY @1100 GOTO Amants
 IF ~~ THEN REPLY @1101 GOTO Jalousie
 IF ~~ THEN REPLY @1102 GOTO Malvenue
END

IF ~~ THEN BEGIN Malvenue
 SAY @17
 IF ~~ THEN REPLY @1200 GOTO Cataplasme
END

IF ~~ THEN BEGIN Jalousie
 SAY @1201
 IF ~~ THEN REPLY @1200 GOTO Cataplasme
END

IF ~~ THEN BEGIN Amants
 SAY @12
 IF ~~ THEN REPLY @1200 GOTO Cataplasme
END

IF ~~ THEN BEGIN Cataplasme
 SAY @13 = @14 = @15 = @16
 IF ~~ THEN DO ~PlaySong(0)
                PlaySound("#SMusicV")
                StartCutSceneMode() 
                StartCutScene("#SCutMa")~ EXIT // Entrée d'Onyx
END




