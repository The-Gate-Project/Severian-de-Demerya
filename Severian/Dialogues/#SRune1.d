BEGIN ~#SRune1~

IF ~Global("#SRomanceFinalCouronne","GLOBAL",6)~ THEN BEGIN Blabla
 SAY @0
 IF ~~ THEN EXTERN ~#SRune2~ Lupanar 
END

// ROMANCE PARTIE 3
// COURONNE DE CUIVRE
// LES MERCENAIRES DE LA RUNE POURPRE
// SEVERIAN DANS L'ARENE

IF ~Global("#SRomanceFinalCouronne","GLOBAL",12)~ THEN BEGIN Arene
 SAY @13
 IF ~~ THEN EXTERN ~#SeverJ~ Exorciser
END

// MORT DE PEYRALION

IF ~Global("#SRomanceFinalCouronne","GLOBAL",20)~ THEN BEGIN Damnation
 SAY @30
 IF ~~ THEN DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",21)
                ActionOverride("#SRune2",EscapeArea())
                EscapeArea()
                StartCutSceneMode()
                StartCutScene("#SCutAre")~ EXIT
END


APPEND ~#SRune2~

 IF ~~ THEN BEGIN Lupanar
  SAY @1 = @2
  IF ~~ THEN EXTERN ~#SPeyr~ Pouliche 
 END

END

APPEND ~#SPeyr~

 IF ~~ THEN BEGIN Pouliche
  SAY @3 = @4 = @5 = @6 = @7
  IF ~~ THEN REPLY @800 GOTO Aplomb
  IF ~~ THEN REPLY @801 GOTO Echo
END

IF ~~ THEN BEGIN Echo
  SAY @9 = @10
  IF ~~ THEN DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",7)
        StartCutSceneMode()
        StartCutScene("#SCutSau")~ EXIT
END

IF ~~ THEN BEGIN Aplomb
  SAY @11 = @12
  IF ~~ THEN DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",7)
                 StartCutSceneMode()
                 StartCutScene("#SCutSau")~ EXIT
END

IF ~~ THEN BEGIN AgitePoing
 SAY @16
 IF ~~ THEN EXTERN ~#SeverJ~ Agilite
END

IF ~~ THEN BEGIN Charge
 SAY @18 = @19 = @20
 IF ~~ THEN REPLY @21 EXTERN ~#SeverJ~ Douleur
END

IF ~~ THEN BEGIN Terrible
 SAY @23
 IF ~~ THEN EXTERN ~#SeverJ~ Masse
END

IF ~~ THEN BEGIN Brute
 SAY @25 = @26
 IF ~~ THEN DO ~SetGlobal("#SRomanceFinalCouronne","GLOBAL",13)
                StartCutSceneMode()
                StartCutScene("#SCutPey")~ EXIT
END

END

APPEND ~#SeverJ~

IF ~~ THEN BEGIN Exorciser
 SAY @14 = @15
 IF ~~ THEN EXTERN ~#SPeyr~ AgitePoing
END

IF ~~ THEN BEGIN Agilite
 SAY @17
 IF ~~ THEN EXTERN ~#SPeyr~ Charge
END

IF ~~ THEN BEGIN Douleur
 SAY @22
 IF ~~ THEN EXTERN ~#SPeyr~ Terrible
END

IF ~~ THEN BEGIN Masse
 SAY @24
 IF ~~ THEN EXTERN ~#SPeyr~ Brute
END

END
