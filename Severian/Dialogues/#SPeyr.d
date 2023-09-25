BEGIN ~#SPeyr~

IF ~Global("#SFinalRomance","GLOBAL",6)~ THEN BEGIN Sarvaj3
 SAY @0 = @1 = @2 
 IF ~~ THEN EXTERN ~#SeverJ~ MainEpee
END

IF ~~ THEN BEGIN Rimer
 SAY @6
 IF ~~ THEN EXTERN ~#SeverJ~ Cyric
END

IF ~~ THEN BEGIN PlusMalin
 SAY @8 = @9 = @10
 IF ~~ THEN REPLY @14 GOTO Commencer
 IF ~~ THEN REPLY @15 GOTO PerdreTemps
END

IF ~~ THEN BEGIN PerdreTemps
 SAY @19 = @17
 IF ~~ THEN EXTERN ~#SAlyo~ Ssss
END

IF ~~ THEN BEGIN Commencer
 SAY @16 = @17
 IF ~~ THEN EXTERN ~#SAlyo~ Ssss
END

IF ~~ THEN BEGIN Remercier
 SAY @11
 IF ~~ THEN EXTERN ~#SeverJ~ Seconde
END

IF ~~ THEN BEGIN Acere
 SAY @13
 IF ~~ THEN EXTERN ~#SeverJ~ Cyric
END



// TRANSFORMATION DRAGON

IF ~Global("#SFinalRomance","GLOBAL",16)
    Global("#STransfoDragon","GLOBAL",1)~ THEN BEGIN TransfoDragon
SAY @30
IF ~~ THEN DO ~PlaySong(0)
               PlaySound("#SMusicP")
               SetGlobal("#SFinalRomance","GLOBAL",17)
               SetGlobal("#STransfoDragon","GLOBAL",2)
               TakeItemReplace("#SNoImun","#SImun","#SPeyr")
               ClearAllActions()
               StartCutSceneMode()
               StartCutScene("#SCtSar2")~ EXIT
END
 


APPEND ~#SeverJ~
 
 IF ~~ THEN BEGIN MainEpee
  SAY @3
  IF ~~ THEN REPLY @4 EXTERN ~#SPeyr~ Rimer
  IF ~~ THEN REPLY @5 EXTERN ~#SPeyr~ Remercier
 END

 IF ~~ THEN BEGIN Cyric
  SAY @7
  IF ~~ THEN EXTERN ~#SPeyr~ PlusMalin
 END

 IF ~~ THEN BEGIN Seconde
  SAY @12
  IF ~~ THEN EXTERN ~#SPeyr~ Acere
 END

END

APPEND ~#SAlyo~
 
  IF ~~ THEN BEGIN Ssss
   SAY @18
   IF ~~ THEN DO ~PlaySong(0)
                  PlaySound("#SMusicP")
                  ActionOverride("#SZhorin",Enemy())
                  ActionOverride("#SAlyo",Enemy())
                  ActionOverride("#SThor",Enemy())
                  ActionOverride("#SDilyn",Enemy())
                  ActionOverride("#SPeyr",Enemy())
                  SetGlobal("#SFinalRomance","GLOBAL",7)~ EXIT
  END

END


