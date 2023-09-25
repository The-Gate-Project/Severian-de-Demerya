
BEGIN ~#SMalry~

// CHAPITRE 3
// DEVANT L'AUBERGE D'IMNESVALE
// L'INVITATION DE MARIAGE

IF ~Global("#SeverianMailikki","GLOBAL",15)~ THEN BEGIN SilhouetteConnue
  SAY @30 = @31 = @32 = @33
  IF ~~ THEN EXTERN ~#SeverJ~ FlatteEpaule
END

IF ~~ THEN BEGIN Fiancee  
  SAY @35
  IF ~~ THEN EXTERN ~#SeverJ~ Trouble
END

IF ~~ THEN BEGIN Liasses
  SAY @37
  IF ~~ THEN GOTO Distribution
END

IF ~~ THEN BEGIN Mission
  SAY @57 = @58 = @59
  IF ~~ THEN EXTERN ~#SeverJ~ Promesse
END

IF ~~ THEN BEGIN Sautiller
  SAY @61
  IF ~~ THEN DO ~SetGlobal("#SeverianMailikki","GLOBAL",16)
                 ActionOverride(Player1,CreateItem("#SInvCha",0,0,0))
                 ActionOverride(Player2,CreateItem("#SInvit",0,0,0))
                 ActionOverride(Player3,CreateItem("#SInvit",0,0,0))
                 ActionOverride(Player4,CreateItem("#SInvit",0,0,0))
                 ActionOverride(Player5,CreateItem("#SInvit",0,0,0))
                 ActionOverride(Player6,CreateItem("#SInvit",0,0,0))
                 EscapeArea()~ EXIT
END

// DEPART DU VAL

IF ~Global("#SConvivesAppear","GLOBAL",18)~ THEN BEGIN DejaParti
 SAY @62 = @63 = @64
 IF ~~ THEN EXTERN ~#SeverJ~ Rencontre
END

IF ~~ THEN BEGIN Boudeur
 SAY @66
 IF ~~ THEN EXTERN ~#SeverJ~ Prince
END

IF ~~ THEN BEGIN Souvenir
 SAY @68 = @69
 IF ~~ THEN EXTERN ~#SeverJ~ Wendy
END

IF ~~ THEN BEGIN Talisman
 SAY @72
 IF ~~ THEN EXTERN ~#SeverJ~ QuiProtegera
END

IF ~~ THEN BEGIN Image
 SAY @74
 IF ~~ THEN DO ~SetGlobal("#SConvivesAppear","GLOBAL",19)
                ActionOverride("#SMalry",EscapeArea())
                ActionOverride("#SMoust",EscapeArea())~ EXIT
END

// ROMANCE FINAL

// APRES MORT SARVAJ

IF ~Global("#SFinalRomanceSuivantsMailikki","GLOBAL",7)~ THEN BEGIN SauverVillage
SAY @80 = @81
IF ~~ THEN EXTERN ~#SeverJ~ BrasEtrangle
END

IF ~~ THEN BEGIN Boudeuse
 SAY @83
 IF ~~ THEN REPLY @84 EXTERN ~#SeverJ~ RegardePoupee
 IF ~~ THEN REPLY @85 EXTERN ~#SeverJ~ DeTravers
END

IF ~~ THEN BEGIN Ravissement
 SAY @87 = @88
 IF ~~ THEN EXTERN ~#SMoust~ Miaw1
END

IF ~~ THEN BEGIN FlaqueEau
 SAY @90
 IF ~~ THEN DO ~SetGlobal("#SFinalRomanceSuivantsMailikki","GLOBAL",8)
                ActionOverride("#SMalry",EscapeArea())
                ActionOverride("#SMoust",EscapeArea())~ EXIT
END


APPEND ~#SeverJ~
 
    IF ~~ THEN BEGIN Promesse
        SAY @60
        IF ~~ THEN EXTERN ~#SMalry~ Sautiller
    END
 
    IF ~~ THEN BEGIN FlatteEpaule
        SAY @34
        IF ~~ THEN EXTERN ~#SMalry~ Fiancee
    END

    IF ~~ THEN BEGIN Trouble
        SAY @36
        IF ~~ THEN REPLY @360 EXTERN ~#SMalry~ Liasses
        IF ~~ THEN REPLY @361 EXTERN ~#SMalry~ Liasses
    END

    IF ~~ THEN BEGIN Rencontre
        SAY @65
        IF ~~ THEN EXTERN ~#SMalry~ Boudeur
    END

    IF ~~ THEN BEGIN Prince
        SAY @67
        IF ~~ THEN EXTERN ~#SMalry~ Souvenir
    END

    IF ~~ THEN BEGIN Wendy
        SAY @70 = @71
        IF ~~ THEN EXTERN ~#SMalry~ Talisman
    END

    IF ~~ THEN BEGIN QuiProtegera
        SAY @73
        IF ~~ THEN EXTERN ~#SMalry~ Image
    END

  IF ~~ THEN BEGIN BrasEtrangle
   SAY @82
   IF ~~ THEN EXTERN ~#SMalry~ Boudeuse
  END

  IF ~~ THEN BEGIN DeTravers
   SAY @86
   IF ~~ THEN EXTERN ~#SMalry~ Ravissement
  END

 IF ~~ THEN BEGIN RegardePoupee
        SAY @91
        IF ~~ THEN EXTERN ~#SMalry~ Ravissement
    END

   
END


APPEND ~#SMoust~
 
 IF ~~ THEN BEGIN Miaw1
  SAY @89
  IF ~~ THEN EXTERN ~#SMalry~ FlaqueEau
 END

END



CHAIN ~#SMalry~ Distribution
    @38
    == JanJ     IF ~InParty("Jan")~       THEN @39
    == JaheiraJ   IF ~InParty("Jaheira")~   THEN @43
    == MinscJ   IF ~InParty("Minsc")~     THEN @41
    == YoshJ    IF ~InParty("Yoshimo")~   THEN @42
    == AerieJ   IF ~InParty("Aerie")~     THEN @47
    == KorganJ  IF ~InParty("Korgan")~    THEN @52
    == ViconiJ  IF ~InParty("Viconia")~   THEN @40
    == NaliaJ   IF ~InParty("Nalia")~     THEN @53
    == EdwinJ   IF ~InParty("Edwin")~     THEN @50
    == AnomenJ  IF ~InParty("Anomen")~    THEN @51
    == MazzyJ   IF ~InParty("Mazzy")~     THEN @49
    == ValygarJ IF ~InParty("Valygar")~    THEN @54
    == CerndJ   IF ~InParty("Cernd")~     THEN @48
    == Imoen2J   IF ~InParty("Imoen2")~     THEN @46
    == HaerDaJ  IF ~InParty("HaerDalis")~ THEN @45
    == KeldorJ  IF ~InParty("Keldorn")~   THEN @44
END IF ~~ THEN GOTO Mission


