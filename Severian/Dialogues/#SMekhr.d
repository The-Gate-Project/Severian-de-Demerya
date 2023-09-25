BEGIN ~#SMekhr~
// Chapitre I - La Quête de l'Armure à L'Auberge des Cinq Chopes
// Ilkar, Isabel et le groupe

IF ~Global("#SeverQuest1","GLOBAL", 3)~ THEN BEGIN LeMagicien
SAY @0
IF ~~ THEN EXTERN ~#SIsab~ PasBouger
END

IF ~~ THEN BEGIN Dette
SAY @5 = @6 = @7
IF ~~ THEN EXTERN ~#SeverJ~ Cendreux
END

IF ~~ THEN BEGIN LireAme
SAY @9 = @10 = @11
IF ~~ THEN EXTERN ~#SeverJ~ Duplicite
END

IF ~~ THEN BEGIN Surveiller
SAY @13
IF ~~ THEN EXTERN ~#SeverJ~ Armure
END

IF ~~ THEN BEGIN Etudier
SAY @15
IF ~~ THEN EXTERN ~#SeverJ~ Confusion
END

IF ~~ THEN BEGIN Chute
SAY @17 = @18
IF ~~ THEN REPLY @19 EXTERN ~#SeverJ~ Chemin
IF ~~ THEN REPLY @24 GOTO LaissePartir
END

IF ~~ THEN BEGIN BonCamp
SAY @21 = @22 = @23
IF ~~ THEN DO ~SetGlobal("#SMekhrQuit","AR0511",1)
               GiveItem("#SJourn",Player1)~ EXIT
END

IF ~~ THEN BEGIN Jugeotte
SAY @29
IF ~~ THEN EXTERN ~#SIsab~ Papa
END

IF ~~ THEN BEGIN LaissePartir
SAY @25
IF ~~ THEN EXTERN ~#SeverJ~ JeNe
END


APPEND ~#SIsab~

    IF ~~ THEN BEGIN PasBouger
        SAY @1 = @2
        IF ~~ THEN EXTERN ~#SeverJ~ Pissenlits
    END
  
    IF ~~ THEN BEGIN Papa
        SAY @30
        IF ~~ THEN EXTERN ~#SeverJ~ MaitrisePlus
    END

END

APPEND ~#SeverJ~

    IF ~Global("#SeverQuest1","GLOBAL", 3)
        See("#SMekhr")~ THEN BEGIN Pissenlits
     SAY @4
     IF ~~ THEN EXTERN ~#SMekhr~ Dette
    END

    IF ~~ THEN BEGIN Cendreux
     SAY @8
     IF ~~ THEN EXTERN ~#SMekhr~ LireAme
    END

    IF ~~ THEN BEGIN Duplicite
     SAY @12
     IF ~~ THEN EXTERN ~#SMekhr~ Surveiller
    END

    IF ~~ THEN BEGIN Armure
     SAY @14
     IF ~~ THEN EXTERN ~#SMekhr~ Etudier
    END

    IF ~~ THEN BEGIN Confusion
     SAY @16
     IF ~~ THEN EXTERN ~#SMekhr~ Chute
    END
  
    IF ~~ THEN BEGIN Chemin
     SAY @20
     IF ~~ THEN EXTERN ~#SMekhr~ BonCamp
    END

    IF ~~ THEN BEGIN JeNe
     SAY @26
     IF ~~ THEN REPLY @27 GOTO Chemin
     IF ~~ THEN REPLY @28 EXTERN ~#SMekhr~ Jugeotte
    END

    IF ~~ THEN BEGIN MaitrisePlus
     SAY @31
     IF ~~ THEN DO ~PlaySong(0)
                    PlaySound("#SMusicT")
                    ActionOverride("#SMekhr",Enemy())~ EXIT         // Mekhren devient ennemi, Isabel reste neutre
    END

END