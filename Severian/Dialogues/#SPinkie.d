
BEGIN ~#SPinkie~

IF ~Global("#SPinkieQuete","GLOBAL",2)~ THEN BEGIN Scandale
  SAY @1
  IF ~~ THEN REPLY @100 GOTO Confondre
  IF ~~ THEN REPLY @101 GOTO PasPavee
END

IF ~~ THEN BEGIN Confondre
  SAY @7
  IF ~~ THEN REPLY @700 GOTO Aimable
  IF ~~ THEN REPLY @701 GOTO Brutaliser
END

IF ~~ THEN BEGIN Aimable
  SAY @6
  IF ~~ THEN DO ~SetGlobal("#SPinkieQuete","GLOBAL",3)
                 StartCutSceneMode()
                 StartCutScene("#SCutPi1")~ EXIT
END

IF ~~ THEN BEGIN Brutaliser
  SAY @8
  IF ~~ THEN EXTERN ~#SeverJ~ Services
END

IF ~~ THEN BEGIN Plomb
  SAY @5
  IF ~~ THEN DO ~SetGlobal("#SPinkieQuete","GLOBAL",3)
                 StartCutSceneMode()
                 StartCutScene("#SCutPi1")~ EXIT
END

IF ~~ THEN BEGIN PasPavee
  SAY @2
  IF ~~ THEN REPLY @200 GOTO Aimable
  IF ~~ THEN REPLY @201 GOTO Aigu
END

IF ~~ THEN BEGIN Aigu
  SAY @3
  IF ~~ THEN EXTERN ~#SeverJ~ Services
END

IF ~Global("#SPinkieQuete","GLOBAL",4)~ THEN Village
  SAY @10 = @11
  IF ~~ THEN REPLY @110 GOTO Poules
END

IF ~~ THEN BEGIN Poules
  SAY @12
  IF ~~ THEN REPLY @120 GOTO Aider
  IF ~~ THEN REPLY @121 GOTO Aider
END

IF ~~ THEN BEGIN Aider
  SAY @13
  IF ~~ THEN EXTERN ~#SeverJ~ Tant
END

IF ~~ THEN BEGIN Oripaux
  SAY @15 = @16
  IF ~~ THEN REPLY @17 DO ~SetGlobal("#SPinkieQuete","GLOBAL",5)
                           ActionOverride(Player1,CreateItem("#SBiere",0,0,0))
                           ActionOverride(Player1,CreateItem("#SPants",0,0,0))
                           AddJournalEntry(@4000,QUEST)
                           TakePartyGold(200)
                           EscapeArea()~ EXIT
END

// CHAPITRE 3
// LE BAL 

IF ~Global("#SConvivesAppear","GLOBAL",2)~ THEN BEGIN Impoli
  SAY @30
  IF ~~ THEN REPLY @31 GOTO TrouBoueux
  IF ~~ THEN REPLY @32 GOTO AuSecours
END

IF ~~ THEN BEGIN AuSecours
  SAY @33
  IF ~~ THEN DO ~PlaySong(0)
                 PlaySound("#SMusicO")
                 SetGlobal("#SConvivesAppear","GLOBAL",3)
                 TakePartyItem("#SInvCha")
                 DestroyItem("#SInvCha")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvSev")
                 DestroyItem("#SInvSev")
                 DestroySelf()
                 StartCutSceneMode()
                 StartCutScene("#SCutWe2")~ EXIT
END

IF ~~ THEN BEGIN TrouBoueux
  SAY @34
  IF ~~ THEN REPLY @35 GOTO Bastonnade
  IF ~~ THEN REPLY @36 GOTO SaisGre
END

IF ~~ THEN BEGIN SaisGre
  SAY @37
  IF ~~ THEN DO ~PlaySong(0)
                 PlaySound("#SMusicO")
                 SetGlobal("#SConvivesAppear","GLOBAL",3)
                 TakePartyItem("#SInvCha")
                 DestroyItem("#SInvCha")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvSev")
                 DestroyItem("#SInvSev")
                 DestroySelf()
                 StartCutSceneMode()
                 StartCutScene("#SCutWe2")~ EXIT
END

IF ~~ THEN BEGIN Bastonnade
  SAY @38
  IF ~~ THEN DO ~PlaySong(0)
                 PlaySound("#SMusicO")
                 SetGlobal("#SConvivesAppear","GLOBAL",3)
                 TakePartyItem("#SInvCha")
                 DestroyItem("#SInvCha")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvit")
                 DestroyItem("#SInvit")
                 TakePartyItem("#SInvSev")
                 DestroyItem("#SInvSev")
                 DestroySelf()
                 StartCutSceneMode()
                 StartCutScene("#SCutWe2")~ EXIT
END


APPEND ~#SeverJ~ 

   IF ~~ THEN BEGIN Services
     SAY @4
     IF ~~ THEN EXTERN ~#SPinkie~ Plomb
   END

   IF ~~ THEN BEGIN Tant
     SAY @14
     IF ~~ THEN EXTERN ~#SPinkie~ Oripaux
   END

END