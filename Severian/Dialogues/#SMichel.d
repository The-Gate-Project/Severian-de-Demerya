
BEGIN ~#SMichel~


// CHAPITRE 3
// LA MERE MICHELE A PERDU SON CHAT

IF ~Global("#SMalloQuete","GLOBAL",5)~ THEN BEGIN Sacredie
 SAY @0 = @1 
 IF ~~ THEN EXTERN ~#SeverJ~ Epaules
END


IF ~Global("#SMalloQuete","GLOBAL",7)~ THEN BEGIN FourMoulin
 SAY @3
 IF ~~ THEN REPLY @4 GOTO Chaumiere
END

IF ~~ THEN BEGIN Chaumiere
 SAY @5
 IF ~~ THEN EXTERN ~#SMallo~ DisAuRevoir
END


APPEND ~#SeverJ~

    IF ~~ THEN BEGIN Epaules
      SAY @2
      IF ~~ THEN DO ~SetGlobal("#SMalloQuete","GLOBAL",6)
                     StartCutSceneMode()
                     StartCutScene("#SCutMQ2")~ EXIT
    END

    IF ~~ THEN BEGIN Mariage
      SAY @7
      IF ~~ THEN EXTERN ~#SMallo~ PrisSoin
    END

    IF ~~ THEN BEGIN Doigt
      SAY @9 = @10
      IF ~~ THEN EXTERN ~#SMallo~ OccupeToi
    END

    IF ~~ THEN BEGIN Interesse
      SAY @12
      IF ~~ THEN DO ~SetGlobal("#SMalloQuete","GLOBAL",8)
                     ActionOverride("#SMichel",EscapeArea())
                     ActionOverride("#SMallory",EscapeArea())
                     TakePartyItem("#SMoust")
                     DestroyItem("#SMoust")
                     TakePartyItem("#SPoup")
                     DestroyItem("#SPoup")
                     TakePartyItem("#SMallo")
                     DestroyItem("#SMallo")
                     AddJournalEntry(@5000, QUEST_DONE)
                     AddexperienceParty(6000)~ EXIT
    END
                    
END

APPEND ~#SMallo~
 
    IF ~~ THEN BEGIN DisAuRevoir
      SAY @6
      IF ~~ THEN EXTERN ~#SeverJ~ Mariage
    END

    IF ~~ THEN BEGIN PrisSoin
      SAY @8
      IF ~~ THEN EXTERN ~#SeverJ~ Doigt
    END

    IF ~~ THEN BEGIN OccupeToi
      SAY @11
      IF ~~ THEN EXTERN ~#SeverJ~ Interesse
    END

END
