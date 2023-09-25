BEGIN ~#SLittle~

IF ~Global("#SJonLittle","GLOBAL",0)~ THEN BEGIN JonLittle1
SAY @200200 = @200201
IF ~~ THEN EXTERN ~#Sev25J~ JonLittle2
END

IF ~~ THEN BEGIN JonLittle3
SAY @200204 
IF ~~ THEN REPLY @200205 GOTO LeurManiere
IF ~~ THEN REPLY @200206 GOTO PasAider
IF ~~ THEN REPLY @200207 GOTO PasAider
END

IF ~~ THEN BEGIN PasAider
SAY @200208 = @250206
IF ~~ THEN REPLY @250207 GOTO Honnete
IF ~~ THEN REPLY @250208 GOTO Legere
IF ~~ THEN REPLY @250209 GOTO FineBouche
END


IF ~~ THEN BEGIN LeurManiere
SAY @200209 = @250205
IF ~~ THEN REPLY @250207 GOTO Honnete
IF ~~ THEN REPLY @250208 GOTO Legere
IF ~~ THEN REPLY @250209 GOTO FineBouche
END

IF ~~ THEN BEGIN Honnete
SAY @250213 = @250214
IF ~~ THEN EXTERN ~#Sev25J~ ScellerSang
END


IF ~~ THEN BEGIN Legere
SAY @250211 = @250214
IF ~~ THEN EXTERN ~#Sev25J~ ScellerSang
END


IF ~~ THEN BEGIN FineBouche
SAY @250212 = @250214
IF ~~ THEN EXTERN ~#Sev25J~ ScellerSang
END

IF ~~ THEN BEGIN Hypocrite
SAY @250216
IF ~~ THEN DO ~SetGlobal("#SJonLittle","GLOBAL",1)
                SetGlobal("#SMarya2","GLOBAL",1)
                SetGlobal("#SAzeem","GLOBAL",2)
                SetGlobal("#SFrereThock","GLOBAL",2)
                SetGlobal("#SWilos2","GLOBAL",2)
                RealSetGlobalTimer("#SeverianRomanceTob","GLOBAL",3)~ EXIT
 END


// APRES MORT YAGA-SHURA

IF ~Global("#SYagaShuraKill","GLOBAL",6)~ THEN BEGIN MortYagaShura1
SAY @280338
IF ~~ THEN REPLY @200339 GOTO Retrouver
IF ~~ THEN REPLY @200340 GOTO EncoreEnvie
IF ~~ THEN REPLY @200341 GOTO Inutile
END

IF ~~ THEN BEGIN EncoreEnvie
SAY @200342
IF ~~ THEN GOTO Valarym1
END

IF ~~ THEN BEGIN Retrouver
SAY @280342
IF ~~ THEN GOTO Valarym1
END

IF ~~ THEN BEGIN Inutile
SAY @200343
IF ~~ THEN GOTO Valarym1
END

IF ~~ THEN BEGIN Valarym1
SAY @200344
IF ~~ THEN EXTERN ~#Sev25J~ ReviendraiPas
END

IF ~~ THEN BEGIN Element
SAY @200346
IF ~~ THEN EXTERN ~#Sev25J~ CausePerdue
END

IF ~~ THEN BEGIN Tombe
SAY @200348
IF ~~ THEN DO ~AddJournalEntry(@900157,INFO)
               SetGlobal("#SYagaShuraKill","GLOBAL",7)
               SetGlobal("#SClicTalkTob","GLOBAL",2)
               EscapeArea()~ EXIT
END



APPEND ~#Sev25J~

 IF ~~ THEN BEGIN JonLittle2
 SAY @200202 = @200203
 IF ~~ THEN EXTERN ~#SLittle~ JonLittle3
 END


 IF ~~ THEN BEGIN ScellerSang
 SAY @250215
 IF ~~ THEN EXTERN ~#SLittle~ Hypocrite
 END
 

 IF ~~ THEN BEGIN ReviendraiPas
  SAY @200345
  IF ~~ THEN EXTERN ~#SLittle~ Element
  END

  IF ~~ THEN BEGIN CausePerdue
  SAY @200347
  IF ~~ THEN EXTERN ~#SLittle~ Tombe
  END

END

