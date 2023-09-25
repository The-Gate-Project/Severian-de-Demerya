
BEGIN ~#SNovice~

IF ~Detect("#Severian")
    Global("#SeverChapDeux","GLOBAL",4)~ THEN BEGIN Fuyez
SAY @0 = @1
IF ~~ THEN EXTERN ~#SeverJ~ DuCalme
END

IF ~~ THEN BEGIN DoisPartir
SAY @3
IF ~~ THEN EXTERN ~#SeverJ~ VousLacher
END

IF ~~ THEN BEGIN LongVoyage
SAY @5 = @6
IF ~~ THEN EXTERN ~#SeverJ~ Comptes
END

IF ~~ THEN BEGIN MalFagottes
SAY @8
IF ~~ THEN EXTERN ~#SeverJ~ PoussePorte
END

IF ~~ THEN BEGIN MenAller
SAY @16
IF ~~ THEN DO ~SetGlobal("#SeverChapDeux","GLOBAL",6)
               EscapeArea()~ EXIT
END


APPEND ~#SeverJ~ 

    IF ~~ THEN BEGIN DuCalme
       SAY @2
       IF ~~ THEN EXTERN ~#SNovice~ DoisPartir
    END

    IF ~~ THEN BEGIN VousLacher
       SAY @4
       IF ~~ THEN EXTERN ~#SNovice~ LongVoyage
    END

    IF ~~ THEN BEGIN Comptes
       SAY @7
       IF ~~ THEN EXTERN ~#SNovice~ MalFagottes
    END

    IF ~~ THEN BEGIN PoussePorte
       SAY @9
       IF ~~ THEN REPLY @900 GOTO Exactement
    END

    IF ~~ THEN BEGIN Exactement
       SAY @10
       IF ~~ THEN REPLY @1000 GOTO Degaine
       IF ~~ THEN REPLY @1001 GOTO Degaine
       IF ~~ THEN REPLY @1002 GOTO PiedsDevant
    END

    IF ~~ THEN BEGIN PiedsDevant
       SAY @11
       IF ~~ THEN REPLY @1100 GOTO Degaine
       IF ~~ THEN REPLY @1101 GOTO BelleFemme
    END

    IF ~~ THEN BEGIN BelleFemme
       SAY @12 = @13
       IF ~~ THEN DO ~SetGlobal("#SeverChapDeux","GLOBAL",-1)
                      LeaveParty()
                      EscapeArea()~ EXIT
    END


    IF ~~ THEN BEGIN Degaine
       SAY @14
       IF ~~ THEN EXTERN ~#SNovice~ MenAller
    END

END
