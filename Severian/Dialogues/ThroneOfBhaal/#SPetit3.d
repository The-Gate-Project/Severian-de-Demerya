BEGIN ~#SPetit3~

IF ~Global("#SRetourCamp","GLOBAL",1)~ THEN BEGIN RetourCamp
SAY @250227
IF ~~ THEN REPLY @200274 DO ~SetGlobal("#SRetourCamp","GLOBAL",2)
                             ClearAllActions()
                             StartCutSceneMode()
                             StartCutScene("#SCtTel5")~ EXIT
IF ~~ THEN REPLY @200276 EXIT
END

IF ~Global("#SRetourCamp","GLOBAL",2)~ THEN BEGIN RetourCamp
SAY @250227
IF ~~ THEN REPLY @200274 DO ~ClearAllActions()
                             StartCutSceneMode()
                             StartCutScene("#SCtTel5")~ EXIT
IF ~~ THEN REPLY @200276 EXIT
END