BEGIN ~#SKikOut~

IF ~InParty("#Severian")~ THEN BEGIN MeVoici
  SAY @1000
  IF ~~ THEN EXTERN ~#SeverJ~ RenvoiBlaiddJ
END

APPEND ~#SeverJ~
  IF ~~ THEN BEGIN RenvoiBlaiddJ
    SAY @1002
    IF ~~ THEN DO ~ActionOverride("#SBlaidd",ForceSpellRES("#SUnSumB",Myself)~ EXIT
  END
END
