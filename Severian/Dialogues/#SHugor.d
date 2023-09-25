BEGIN ~#SHugor~

IF ~Global("#SHugorCreation","AR0704",4)~ THEN BEGIN HalfShadow
  SAY @1 = @2
  IF ~~ THEN EXTERN ~#Sever~ SerreDents
END

IF ~~ THEN BEGIN RenverseTable
  SAY @5 = @6 
  IF ~Gender(Player1,MALE)~ THEN EXTERN ~#Sever~ Baver
  IF ~Gender(Player1,FEMALE)~ THEN EXTERN ~#Sever~ Galant
END
  
IF ~~ THEN BEGIN Pleutres
  SAY @15
  IF ~~ THEN DO ~ActionOverride("#Severian",EscapeArea())
                 ActionOverride("#SMerc1",EscapeArea())
                 ActionOverride("#SMerc2",EscapeArea())
                 EscapeArea()~ EXIT
END


IF ~~ THEN BEGIN Collier
  SAY @16
  IF ~~ THEN DO ~SetGlobal("#SHugorAttackSeverian","AR0704",1)
                 SetGlobal("#SHugorAttackCharname","AR0704",1)
                 SetGlobal("#SeverianInvisible","AR0704",1)
                 PlaySong(0)
                 PlaySound("#SMusicB")
                 Enemy()
                 ActionOverride("#SMerc2",Enemy())
                 ActionOverride("#SMerc1",Enemy())~ EXIT
END


APPEND ~#Sever~

  IF ~~ THEN BEGIN SerreDents
   SAY @200
   IF ~~ THEN REPLY @201 GOTO Decamper
   IF ~~ THEN REPLY @202 GOTO Affaires
  END

  IF ~~ THEN BEGIN Decamper
   SAY @4
   IF ~~ THEN EXTERN ~#SHugor~ RenverseTable
  END

  IF ~~ THEN BEGIN Affaires
   SAY @3
   IF ~~ THEN EXTERN ~#SHugor~ RenverseTable
  END

  IF ~~ THEN BEGIN Galant
   SAY @8 = @9
   IF ~~ THEN REPLY @10 GOTO Parole
   IF ~~ THEN REPLY @11 GOTO Parole
   IF ~~ THEN REPLY @12 GOTO Argumenter
  END

  IF ~~ THEN BEGIN Baver
   SAY @7 = @9
   IF ~~ THEN REPLY @10 GOTO Parole
   IF ~~ THEN REPLY @11 GOTO Parole
   IF ~~ THEN REPLY @12 GOTO Argumenter
   END

  IF ~~ THEN BEGIN Argumenter
   SAY @14
   IF ~~ THEN DO ~ReallyForceSpell("#Severian",WIZARD_IMPROVED_INVISIBILITY)~ EXTERN ~#SHugor~ Pleutres
  END

  IF ~~ THEN BEGIN Parole
   SAY @13
   IF ~~ THEN  DO ~ReallyForceSpell("#Severian",WIZARD_IMPROVED_INVISIBILITY)~ EXTERN ~#SHugor~ Collier
  END
  

END








