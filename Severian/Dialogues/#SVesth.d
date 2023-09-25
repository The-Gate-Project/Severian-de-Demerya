
BEGIN ~#SVesth~

IF ~Global("#SeverChapDeux","GLOBAL",8)~ THEN BEGIN FinTraque
  SAY @0
  IF ~~ THEN GOTO LeVoila
END


// APRES CUTRV1

IF ~Global("#SeverChapDeux","GLOBAL",10)~ THEN BEGIN OmbreTemple
  SAY @9
  IF ~~ THEN GOTO ParfumCapiteux
END

IF ~~ THEN BEGIN HausseSourcil
  SAY @11
  IF ~~ THEN GOTO BasMasque
END

IF ~~ THEN BEGIN Distrayante
  SAY @15
  IF ~~ THEN GOTO BasMasque2
END

IF ~~ THEN BEGIN BasPattes
  SAY @14
  IF ~~ THEN GOTO BasMasque2
END

IF ~~ THEN BEGIN Vainqueur
  SAY @31 
  IF ~~ THEN EXTERN ~#SRasth~ DomineChienne
END


// AVANT CUTRV1

CHAIN
IF ~~ THEN ~#SVesth~ LeVoila
    @50
    == ~#SRasth~ @1
    == ~#SeverJ~ @2 = @3
    == ~#SVesth~ @4 = @5
    == ~#SRasth~ @6 = @7
    == ~#SeverJ~ @8
END IF ~~ THEN DO ~StartCutSceneMode()
                   StartCutScene("#SCutRV1")~ EXIT


CHAIN
IF ~~ THEN ~#SVesth~ ParfumCapiteux
    @52
    == ~#SRasth~ @51
    == ~#SVesth~ @10
    == ~#SeverJ~ @1003
END IF ~~ THEN REPLY @1000 GOTO Distrayante
    IF ~~ THEN REPLY @1001 GOTO BasPattes
    IF ~~ THEN REPLY @1002 GOTO HausseSourcil


CHAIN
IF ~~ THEN ~#SVesth~ BasMasque
    @12
    == ~#SRasth~ @13
    == ~#SVesth~ @16
    == ~#SeverJ~ @17
    == ~#SRasth~ @18
    == ~#SeverJ~ @19
    == ~#SRasth~ @20 = @21
    == ~#SVesth~ @22
    == ~#SRasth~ @23
    == ~#SVesth~ @24 = @25
    == ~#SeverJ~ @26
    == ~#SRasth~ @27
END IF ~~ THEN REPLY @2700 GOTO Vainqueur
    IF ~~ THEN REPLY @2701 GOTO Vainqueur
    IF ~~ THEN REPLY @2702 EXTERN ~#SeverJ~ Abandonne

CHAIN
IF ~~ THEN ~#SVesth~ BasMasque2
    @16
    == ~#SeverJ~ @17
    == ~#SRasth~ @18
    == ~#SeverJ~ @19
    == ~#SRasth~ @20 = @21
    == ~#SVesth~ @22
    == ~#SRasth~ @23
    == ~#SVesth~ @24 = @25
    == ~#SeverJ~ @26
    == ~#SRasth~ @27
END IF ~~ THEN REPLY @2700 GOTO Vainqueur
    IF ~~ THEN REPLY @2701 GOTO Vainqueur
    IF ~~ THEN REPLY @2702 EXTERN ~#SeverJ~ Abandonne





APPEND ~#SeverJ~

    IF ~~ THEN BEGIN Abandonne
     SAY @28
     IF ~~ THEN EXTERN ~#SRasth~ SertRien
    END

    IF ~~ THEN BEGIN Reveille
     SAY @34 = @35 = @36 = @37
     IF ~~ THEN EXTERN ~#SVesth~ MaitreBouffon
    END

END

APPEND ~#SRasth~

    IF ~~ THEN BEGIN SertRien
     SAY @29
     IF ~~ THEN EXTERN ~#SVesth~ Chasse
    END

    IF ~~ THEN BEGIN DomineChienne
     SAY @32
     IF ~~ THEN REPLY @3200 EXTERN ~#SVesth~ Perchoir
     IF ~~ THEN REPLY @3201 EXTERN ~#SVesth~ Perchoir
    END

    IF ~~ THEN BEGIN Rageux
     SAY @39
    IF ~~ THEN DO ~PlaySong(0)
                   PlaySound("#SMusicM")
                   SetGlobal("#SeverChapDeux","GLOBAL",12)
                   ActionOverride("#SRasth",Enemy())
                   ActionOverride("#SVesth",Enemy())~ EXIT
    END

END


APPEND ~#SVesth~

    IF ~~ THEN BEGIN Chasse
     SAY @30
     IF ~~ THEN DO ~SetGlobal("#SeverChapDeux","GLOBAL",-1)
                    ActionOverride("#Severian",LeaveParty())
                    ActionOverride("#Severian",EscapeArea())
                    ActionOverride("#SRasth",EscapeArea())
                    ActionOverride("#SVesth",EscapeArea())
                    ActionOverride("#SMaelys",DestroySelf())
                    SetGlobal("#SeverTranstriggerActivation","GLOBAL",1)~ EXIT
    END

    IF ~~ THEN BEGIN Perchoir
     SAY @33
     IF ~~ THEN EXTERN ~#SeverJ~ Reveille
    END

    IF ~~ THEN BEGIN MaitreBouffon
     SAY @38
     IF ~~ THEN EXTERN ~#SRasth~ Rageux
    END

END







