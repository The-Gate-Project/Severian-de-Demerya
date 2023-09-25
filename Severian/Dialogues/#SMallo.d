BEGIN ~#SMallo~


// CHAPITRE 2 : LES OMBRES DU PASSE
// PARTIE 1 : IMNESVALE, AU SORTIR DE L'AUBERGE
// SCENE 1 : UNE PETITE FILLE, MALLORY, ABORDE LE GROUPE
// CONDITIONS DE DECLENCHEMENT : ROMANCE REUSSIE (DIALOGUE 8)


IF ~Global("#SeverChapDeux","GLOBAL",2)~ THEN BEGIN MalloVisite
  SAY @0
  IF ~~ THEN EXTERN ~#SeverJ~ EbouriffeCheveux
END

IF ~~ THEN BEGIN DameLettre
  SAY @2 = @3
  IF ~~ THEN EXTERN ~#SeverJ~ SceauParchemin
END

IF ~~ THEN BEGIN CheveuxRouge
  SAY @5
  IF ~~ THEN EXTERN ~#SeverJ~ Livide
END

IF ~~ THEN BEGIN PieceDor
  SAY @7
  IF ~~ THEN EXTERN ~#SeverJ~ Particulier
END

IF ~~ THEN BEGIN CapeRouge
  SAY @9
  IF ~~ THEN EXTERN ~#SeverJ~ FaireNuit
END

IF ~~ THEN BEGIN Lucioles
  SAY @11 = @12
  IF ~~ THEN REPLY @1200 GOTO AuVol
  IF ~~ THEN REPLY @1201 GOTO AuVol
  IF ~~ THEN REPLY @1202 GOTO Troll
END

IF ~~ THEN BEGIN Troll
  SAY @13
  IF ~~ THEN EXTERN ~#SeverJ~ Gateau
END

IF ~~ THEN BEGIN Ascendant
  SAY @15 = @16
  IF ~~ THEN DO ~EscapeArea()
                 SetGlobal("#SeverMallo","GLOBAL",1)
                 SetDialog("#SeverJ")~ EXIT // Mallory quitte la zone. Retourner dans #SherJ.d, Scène 2.
END

IF ~~ THEN BEGIN AuVol
  SAY @17
  IF ~~ THEN REPLY @1700 GOTO Aventuriere
  IF ~~ THEN REPLY @1701 GOTO PorteEpee
  IF ~~ THEN REPLY @1702 GOTO JaiCompris
END

IF ~~ THEN BEGIN JaiCompris
  SAY @18
  IF ~~ THEN EXTERN ~#SeverJ~ Gateau
END

IF ~~ THEN BEGIN Aventuriere
  SAY @19 = @20
  IF ~~ THEN EXTERN ~#SeverJ~ Gateau
END

IF ~~ THEN BEGIN PorteEpee
  SAY @21 = @20
  IF ~~ THEN EXTERN ~#SeverJ~ Gateau
END

// CHAPITRE 3
// MINI QUETE - RETROUVER MALLORY


IF ~Global("#SMalloQuete","GLOBAL",2)~ THEN BEGIN MenMoque
  SAY @1000 = @1010
  IF ~~ THEN GOTO Presente
END

IF ~~ THEN BEGIN Rassuree
  SAY @112
  IF ~~ THEN EXTERN ~#SeverJ~ MaReine
END

CHAIN
IF ~~ THEN ~#SMallo~ Presente
    @102
    == ~#SMoust~ @103
    == ~#SeverJ~ @104
    == ~#SMallo~ @105
    == ~#SeverJ~ @106
    == ~#SMallo~ @107
    == ~#SeverJ~ @108
    == ~#SMallo~ @110
END IF ~~ THEN REPLY @180 EXTERN ~#SMoust~ BonnePate
    IF ~~ THEN REPLY @1800 EXTERN ~#SeverJ~ Retarde

APPEND ~#SeverJ~

    IF ~~ THEN BEGIN EbouriffeCheveux
        SAY @1
        IF ~~ THEN EXTERN ~#SMallo~ DameLettre
    END

    IF ~~ THEN BEGIN SceauParchemin
        SAY @4
        IF ~~ THEN EXTERN ~#SMallo~ CheveuxRouge
    END

    IF ~~ THEN BEGIN Livide
        SAY @6
        IF ~~ THEN EXTERN ~#SMallo~ PieceDor
    END

    IF ~~ THEN BEGIN Particulier
        SAY @8
        IF ~~ THEN EXTERN ~#SMallo~ CapeRouge
    END

    IF ~~ THEN BEGIN FaireNuit
        SAY @10
        IF ~~ THEN EXTERN ~#SMallo~ Lucioles
    END

    IF ~~ THEN BEGIN Gateau
        SAY @14
        IF ~~ THEN EXTERN ~#SMallo~ Ascendant
    END

    IF ~~ THEN BEGIN MaReine
        SAY @113
        IF ~~ THEN REPLY @114 DO ~SetGlobal("#SMalloQuete","GLOBAL",3)
                                  StartCutSceneMode()
                                  StartCutScene("#SCutMaQ")~ EXIT
    END

    IF ~~ THEN BEGIN Retarde
        SAY @185
        IF ~~ THEN EXTERN ~#SMoust~ Griffes
    END

END

APPEND ~#SMoust~

    IF ~~ THEN BEGIN BonnePate
        SAY @111
        IF ~~ THEN EXTERN ~#SMallo~ Rassuree
    END

    IF ~~ THEN BEGIN Griffes
        SAY @186
        IF ~~ THEN EXTERN ~#SMallo~ Rassuree
    END

END






    