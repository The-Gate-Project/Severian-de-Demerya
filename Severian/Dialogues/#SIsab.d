BEGIN ~#SIsab~

// Isabel, fille de Mekhren
// Après la mort de son père

IF ~Global("#SeverQuest1","GLOBAL", 11)~ THEN BEGIN MonPere
SAY @0 = @1 = @2
IF ~~ THEN REPLY @3 GOTO PresMort
IF ~~ THEN REPLY @4 GOTO PlusParler
END

IF ~~ THEN BEGIN PresMort
SAY @5
IF ~~ THEN GOTO  PlusParler
END

IF ~~ THEN BEGIN PlusParler
SAY @6
IF ~~ THEN DO ~SetGlobal("#SeverQuest1","GLOBAL", 12)~ EXIT // Ici Isabel meurt
END