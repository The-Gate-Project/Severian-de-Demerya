BEGIN ~#SevRess~

// ROMANCE FINAL
// CABANE DE MERELLA
// SEVERIAN EST RESSUCITE, ALLONGE SUR LE LIT
// PRISE DE CONSCIENCE

IF ~Global("#SRomanceFinalCouronne","GLOBAL",30)~ THEN BEGIN Sommeil
 SAY @0
IF ~~ THEN REPLY @1 GOTO Veille
IF ~~ THEN REPLY @2 GOTO SansBruit
END 

IF ~~ THEN BEGIN SansBruit
 SAY @3 = @4
 IF ~~ THEN DO ~SetGlobal("#SRomanceFinalAdieu","GLOBAL",1)
                SetGlobal("#SRomanceFinalCouronne","GLOBAL",60)
                DestroySelf()
                ActionOverride(Player1,LeaveAreaLUA("AR1100","",[543.3164],2))~ EXIT
END

IF ~~ THEN BEGIN Veille
 SAY @5
 IF ~~ THEN DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",31)
                RestParty()~ EXIT
END

// ROMANCE FINAL
// CABANE DE MERELLA
// SEVERIAN EST RESSUCITE, ALLONGE SUR LE LIT 
// L'OMBRE S'EST REVELEE

IF ~Global("#SRomanceFinalCouronne","GLOBAL",31)~ THEN BEGIN OmbreRevelee
 SAY @6 = @7 = @8 = @9 = @10 = @11 = @12
 IF ~~ THEN REPLY @13 DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",32)~ EXIT
 IF ~~ THEN REPLY @14 DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",32)~ EXIT
 IF ~~ THEN REPLY @15 DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",32)~ EXIT
END

// ROMANCE FINAL 
// CABANE DE MERELLA
// DERNIERE NUIT D'AMOUR AVANT LA BATAILLE
// FIN DE LA ROMANCE

