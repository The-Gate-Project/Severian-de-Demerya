
BEGIN ~#SMaelys~

IF ~Global("#SeverEnterrement","GLOBAL",3)~ THEN BEGIN MortElfe
SAY @0
IF ~~ THEN DO ~SetGlobal("#SeverEnterrement","GLOBAL",4)
               SetGlobal("#SeverChapDeux","GLOBAL",17)
               StartCutSceneMode()
               StartCutScene("#SCutRV2")~ EXIT
END

IF ~Global("#SeverEnterrement","GLOBAL",6)~ THEN BEGIN DansBras
SAY @1
IF ~~ THEN EXTERN ~#SeverJ~ Elfe
END

APPEND ~#SeverJ~ 

   IF ~~ THEN BEGIN Elfe
    SAY @2 = @3 = @4 = @5 = @6 = @7
    IF ~~ THEN DO ~SetGlobal("#SeverEnterrement","GLOBAL",7)
                   AddJournalEntry(@300,INFO)
                   SetDialog("#SeverR")~ EXIT
   END
END