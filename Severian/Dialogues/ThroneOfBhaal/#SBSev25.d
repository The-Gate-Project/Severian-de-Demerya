BEGIN ~#SBSev25~

// BANTERS EDWIN

IF ~~ THEN BEGIN HistoiresNaturelles1
SAY @800221
IF ~~ THEN REPLY @800222 GOTO HistoiresNaturelles2
IF ~~ THEN REPLY @800223 GOTO HistoiresNaturelles2
IF ~~ THEN REPLY @800224 GOTO HistoiresNaturelles2
END

IF ~~ THEN BEGIN HistoiresNaturelles2
SAY @800225
IF ~~ THEN EXTERN ~BEDWIN25~ HistoiresNaturelles3
END

// BANTERS KORGAN

IF ~~ THEN BEGIN Confisque1
SAY @800180
IF ~~ THEN EXTERN ~BKORGA25~ Confisque2
END

IF ~~ THEN BEGIN Confisque6
SAY @800177
IF ~~ THEN EXTERN ~BKORGA25~ Confisque2
END

// BANTERS JAN

IF ~~ THEN BEGIN PoilAGratter
SAY @800138
IF ~~ THEN REPLY @800139 EXIT
IF ~~ THEN REPLY @800140 EXIT
IF ~~ THEN REPLY @800141 EXIT
END


// BANTERS SAREVOK

IF ~~ THEN BEGIN BordFureur
SAY @800019
IF ~~ THEN EXTERN ~BSAREV25~ Bouillant
END

IF ~~ THEN BEGIN FaireCotes
 SAY @210125
 IF ~~ THEN EXTERN ~BSAREV25~ TrahirRevis
END

IF ~~ THEN BEGIN FaireCotes1
 SAY @210125
 IF ~~ THEN EXTERN ~BSAREV25~ TrahirRevis1
END


IF ~~ THEN BEGIN PasMeler
 SAY @800023
 IF ~~ THEN EXTERN ~BSAREV25~ TrompeMort
END

IF ~~ THEN BEGIN PasMeler1
 SAY @800023
 IF ~~ THEN EXTERN ~BSAREV25~ TrompeMort1
END


IF ~~ THEN BEGIN Chatier
 SAY @800025
 IF ~~ THEN EXTERN ~BSAREV25~ TrompeMort
END

IF ~~ THEN BEGIN Chatier1
 SAY @800025
 IF ~~ THEN EXTERN ~BSAREV25~ TrompeMort1
END

// BANTERS VICONIA

IF ~~ THEN BEGIN CourbesViconia
SAY @800056
IF ~~ THEN REPLY @800057 EXTERN ~BVICON25~ Jouet
IF ~~ THEN REPLY @800058 EXTERN ~BVICON25~ Conviction
IF ~~ THEN REPLY @800059 EXTERN ~#SBSev25~ Confiance
IF ~~ THEN REPLY @800060 EXTERN ~#SBSev25~ Confiance
IF ~~ THEN REPLY @800061 EXTERN ~#SBSev25~ Bannir
END

IF ~~ THEN BEGIN Bannir
SAY @800062
IF ~~ THEN EXTERN ~BVICON25~ Disparaitre
END

IF ~~ THEN BEGIN Coeur
SAY @800064
IF ~~ THEN DO ~SetGlobal("#SeverTalkViconiaToB","GLOBAL",4)
               ActionOverride("#Severian",LeaveParty()) 
               ActionOverride("#Severian",EscapeArea())
               ActionOverride("Viconia",LeaveParty())
               ActionOverride("Viconia",EscapeArea())~ EXIT
END


IF ~~ THEN BEGIN Foudroyer
SAY @800066 = @800067
IF ~~ THEN DO ~SetGlobal("#SeverTalkViconiaToB","GLOBAL",4)~ EXIT
END

IF ~~ THEN BEGIN Repousser
SAY @800069 = @800067
IF ~~ THEN DO ~SetGlobal("#SeverTalkViconiaToB","GLOBAL",4)~ EXIT
END

IF ~~ THEN BEGIN Confiance
SAY @800062
IF ~~ THEN EXTERN ~BVICON25~ Confiance2
END

IF ~~ THEN BEGIN Confiance3
SAY @800070
IF ~~ THEN DO ~SetGlobal("#SeverRomanceActive","GLOBAL",3)
               SetGlobal("#SeverTalkViconiaToB","GLOBAL",4)~ EXIT
END

APPEND ~BEDWIN25~

 IF ~~ THEN BEGIN LePresent1
  SAY @800209
  IF ~~ THEN REPLY @800210 GOTO LePresent2
  IF ~~ THEN REPLY @800211 GOTO LePresent3
  IF ~~ THEN REPLY @800212 GOTO LePresent4
 END

 IF ~~ THEN BEGIN LePresent3
  SAY @800213
  IF ~~ THEN EXIT 
 END

 IF ~~ THEN BEGIN LePresent2
  SAY @800215
  IF ~~ THEN EXIT 
 END

  IF ~~ THEN BEGIN LePresent4
  SAY @800214
  IF ~~ THEN EXIT 
 END

  IF ~~ THEN BEGIN HistoiresNaturelles3
  SAY @800226
  IF ~~ THEN EXIT
  END

END

APPEND ~BKORGA25~

 IF ~~ THEN BEGIN TordBoyau
  SAY @800171
  IF ~~ THEN REPLY @800172 GOTO Confisque
  IF ~~ THEN REPLY @800173 GOTO Ivres
  IF ~~ THEN REPLY @800174 GOTO Tyran
 END

 IF ~~ THEN BEGIN Tyran
  SAY @800175
  IF ~~ THEN EXIT
 END

 IF ~~ THEN BEGIN Ivres
  SAY @800181
  IF ~~ THEN EXIT 
 END

 IF ~~ THEN BEGIN Confisque
  SAY @800178 = @800179
  IF ~~ THEN EXTERN ~#SBSev25~ Confisque1
 END

 IF ~~ THEN BEGIN Confisque2
  SAY @800178
  IF ~~ THEN EXIT 
 END

 IF ~~ THEN BEGIN TordBoyau1
  SAY @800171
  IF ~~ THEN REPLY @800172 GOTO Confisque5
  IF ~~ THEN REPLY @800173 GOTO Ivres
  IF ~~ THEN REPLY @800174 GOTO Tyran
 END

 IF ~~ THEN BEGIN Confisque5
 SAY @800178 = @800176
 IF ~~ THEN EXTERN ~#SBSev25~ Confisque6
 END

END

APPEND ~BVICON25~ 

  IF ~~ THEN BEGIN Disparaitre
  SAY @800063
  IF ~~ THEN EXTERN ~#SBSev25~ Coeur
  END

  IF ~~ THEN BEGIN Jouet
  SAY @800065
  IF ~~ THEN EXTERN ~#SBSev25~ Foudroyer
  END

  IF ~~ THEN BEGIN Conviction
  SAY @800068
  IF ~~ THEN EXTERN ~#SBSev25~ Repousser
  END

  IF ~~ THEN BEGIN Confiance2
  SAY @800063
  IF ~~ THEN EXTERN ~#SBSev25~ Confiance3
  END

END

APPEND ~BSAREV25~

 IF ~~ THEN BEGIN Bouillant
  SAY @800020
  IF ~RandomNum(2,1)~ THEN REPLY @210124 EXTERN ~#SBSev25~ FaireCotes
  IF ~RandomNum(2,2)~ THEN REPLY @210124 EXTERN ~#SBSev25~ FaireCotes1
  IF ~RandomNum(2,1)~ THEN REPLY @800021 EXTERN ~#SBSev25~ PasMeler
  IF ~RandomNum(2,2)~ THEN REPLY @800021 EXTERN ~#SBSev25~ PasMeler1
  IF ~RandomNum(2,1)~ THEN REPLY @800022 EXTERN ~#SBSev25~ Chatier
  IF ~RandomNum(2,2)~ THEN REPLY @800022 EXTERN ~#SBSev25~ Chatier1
  END


  IF ~~ THEN BEGIN TrahirRevis
   SAY @210126
   IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",3)
                  ClearAllActions()
                  StartCutSceneMode()
                  StartCutScene("#SCtVok1")~ EXIT
  END

  IF ~~ THEN BEGIN TrahirRevis1
   SAY @210126
   IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",3)
                  ClearAllActions()
                  StartCutSceneMode()
                  StartCutScene("#SCtVok2")~ EXIT
  END



  IF ~~ THEN BEGIN TrompeMort
   SAY @800024
   IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",3)
                  ClearAllActions()
                  StartCutSceneMode()
                  StartCutScene("#SCtVok1")~ EXIT
  END

  IF ~~ THEN BEGIN TrompeMort1
   SAY @800024
   IF ~~ THEN DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",3)
                  ClearAllActions()
                  StartCutSceneMode()
                  StartCutScene("#SCtVok2")~ EXIT
  END

END



// CRIMES ET CHATIMENTS

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkSarevokToB","GLOBAL",0)
                 Gender(Protagonist,FEMALE)
                 InParty("Sarevok")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Sarevok",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkSarevokToB1
@800000
DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",1)~
== BSAREV25 @800001
== "#SBSev25" @800002
== BSAREV25 @800003
== "#SBSev25" @800005
== BSAREV25 @800006
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkSarevokToB","GLOBAL",0)
                 Gender(Protagonist,MALE)
                 InParty("Sarevok")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Sarevok",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkSarevokToB2
@800000
DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",1)~
== BSAREV25 @800001
== "#SBSev25" @800002
== BSAREV25 @800003
== "#SBSev25" @800004
== BSAREV25 @800006
EXIT

// L'IRONIE DU SORT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkSarevokToB","GLOBAL",1)
                 InParty("Sarevok")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Sarevok",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkSarevokToB3
@800007
DO ~SetGlobal("#SeverTalkSarevokToB","GLOBAL",2)~
== BSAREV25 @800008
== "#SBSev25" @800009
== BSAREV25 @800010 = @800011
== "#SBSev25" @800012
EXIT

// POUR L'AMOUR D'UNE FEMME

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkSarevokToB","GLOBAL",2)
                 Gender(Protagonist,FEMALE)
                 Global("#SeverRomanceActive","GLOBAL",2)
                 InParty("Sarevok")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Sarevok",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BSAREV25 SeverTalkSarevokToB4
@800013 = @800014 = @800015
== "#SBSev25" @800016
== BSAREV25 @800017 = @800018
END IF ~~ THEN EXTERN ~#SBSev25~ BordFureur


// JUSQU'A LA MORT 1

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkSarevokToB","GLOBAL",2)
                 InParty("Sarevok")
                 InParty("#Severian")
                 Gender(Protagonist,FEMALE)
                 !Global("#SeverRomanceActive","GLOBAL",2)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Sarevok",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BSAREV25 SeverTalkSarevokToB5
@800026 = @800027 = @800028
== "#SBSev25" @800029
== BSAREV25 @800030
END IF ~~ THEN EXTERN ~#SBSev25~ BordFureur



// JUSQU'A LA MORT 2

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkSarevokToB","GLOBAL",2)
                 InParty("Sarevok")
                 InParty("#Severian")
                 Gender(Protagonist,MALE)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Sarevok",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BSAREV25 SeverTalkSarevokToB6
@800026 = @800027 = @800028
== "#SBSev25" @800029
== BSAREV25 @800031
END IF ~~ THEN EXTERN ~#SBSev25~ BordFureur


// BANTERS VICONIA

// PROJETS

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkViconiaToB","GLOBAL",0)
                 InParty("Viconia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Viconia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVICON25 SeverTalkViconiaToB1
@800032
DO ~SetGlobal("#SeverTalkViconiaToB","GLOBAL",1)~
== "#SBSev25" @800033
== BVICON25 @800034
== "#SBSev25" @800035
== BVICON25 @800036
== "#SBSev25" @800037
== BVICON25 @800038
EXIT

// UNE ANCIENNE BLESSURE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkViconiaToB","GLOBAL",1)
                 InParty("Viconia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Viconia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkViconiaToB2
@800039
DO ~SetGlobal("#SeverTalkViconiaToB","GLOBAL",2)~
== BVICON25 @800040
== "#SBSev25" @800041
== BVICON25 @800042
== "#SBSev25" @800043
== BVICON25 @800044
== "#SBSev25" @800045
== BVICON25 @800048
EXIT

// L'ELG KARESS


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkViconiaToB","GLOBAL",2)
                 InParty("Viconia")
                 InParty("#Severian")
                 Gender(Protagonist,FEMALE)
                 Global("#SeverRomanceActive","GLOBAL",2)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Viconia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVICON25 SeverTalkViconiaToB3
@800049
DO ~SetGlobal("#SeverTalkViconiaToB","GLOBAL",3)~
== "#SBSev25" @800050
== BVICON25 @800051
== "#SBSev25" @800052
== BVICON25 @800053
== "#SBSev25" @800054
== BVICON25 @800055
END IF ~~ THEN EXTERN ~#SBSev25~ CourbesViconia


// BANTERS NALIA

// DEVOIR ET REBELLION

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkNaliaToB","GLOBAL",0)
                 InParty("Nalia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Nalia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkNaliaToB1
@800090
DO ~SetGlobal("#SeverTalkNaliaToB","GLOBAL",1)~
== BNALIA25 @800091
== "#SBSev25" @800092
== BNALIA25 @800093
== "#SBSev25" @800094
== BNALIA25 @800095
EXIT


// LE LIEN FILIAL

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkNaliaToB","GLOBAL",1)
                 InParty("Nalia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Nalia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BNALIA25 SeverTalkNaliaToB2
@800096
DO ~SetGlobal("#SeverTalkNaliaToB","GLOBAL",2)~
== "#SBSev25" @800097
== BNALIA25 @800098
== "#SBSev25" @800099
== BNALIA25 @800100
== "#SBSev25" @800101
== BNALIA25 @800102
EXIT

// UN AMOUR IMPOSSIBLE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkNaliaToB","GLOBAL",2)
                 Gender(Protagonist,MALE)
                 InParty("Nalia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Nalia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BNALIA25 SeverTalkNaliaToB3
@800103
DO ~SetGlobal("#SeverTalkNaliaToB","GLOBAL",3)~
== "#SBSev25" @800104
== BNALIA25 @800105 = @800106
== "#SBSev25" @800107
== BNALIA25 @800108
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkNaliaToB","GLOBAL",2)
                 Gender(Protagonist,FEMALE)
                 !Global("#SeverRomanceActive","GLOBAL",2)
                 InParty("Nalia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Nalia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BNALIA25 SeverTalkNaliaToB3
@800103
DO ~SetGlobal("#SeverTalkNaliaToB","GLOBAL",3)~
== "#SBSev25" @800104
== BNALIA25 @800105 = @800106
== "#SBSev25" @800107
== BNALIA25 @800109
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkNaliaToB","GLOBAL",2)
                 Gender(Protagonist,FEMALE)
                 Global("#SeverRomanceActive","GLOBAL",2)
                 InParty("Nalia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Nalia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BNALIA25 SeverTalkNaliaToB3
@800103
DO ~SetGlobal("#SeverTalkNaliaToB","GLOBAL",3)~
== "#SBSev25" @800104
== BNALIA25 @800105
== "#SBSev25" @800110
== BNALIA25 @800111
== "#SBSev25" @800112
EXIT

// BANTERS JAN

// PRISE DE HAUTEUR

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJanToB","GLOBAL",0)
                 InParty("Jan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAN25 SeverTalkJanToB1
@800115
DO ~SetGlobal("#SeverTalkJanToB","GLOBAL",1)~
== "#SBSev25" @800116
== BJAN25 @800117
== "#SBSev25" @800118
== BJAN25 @800119 = @800120
== "#SBSev25" @800121
== BJAN25 @800122 = @800123
== "#SBSev25" @800124
== BJAN25 @800125
== "#SBSev25" @800126
== BJAN25 @800127
== "#SBSev25" @800128
== BJAN25 @800129
EXIT

// LA FARCE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJanToB","GLOBAL",1)
                 InParty("Jan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkJanToB2
@800130
DO ~SetGlobal("#SeverTalkJanToB","GLOBAL",2)~
== "#SBSev25" @800131
== BJAN25 @800132
== "#SBSev25" @800133
== BJAN25 @800134
== "#SBSev25" @800135
== BJAN25 @800136
== "#SBSev25" @800137
END IF ~~ THEN EXTERN ~#SBSev25~ PoilAGratter

// CHEZ JANSEN & STARK

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJanToB","GLOBAL",2)
                 InParty("Jan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAN25 SeverTalkJanToB3
@800142
DO ~SetGlobal("#SeverTalkJanToB","GLOBAL",3)~
== "#SBSev25" @800143 = @800144
== BJAN25 @800145
== "#SBSev25" @800146
== BJAN25 @800147
== "#SBSev25" @800148
== BJAN25 @800149
== "#SBSev25" @800150
== BJAN25 @800151
== "#SBSev25" @800152
EXIT


// BANTERS KORGAN

// LA SUSCEPTIBILITE LEGENDAIRE DES NAINS


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKorganToB","GLOBAL",0)
                 InParty("Korgan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKORGA25 SeverTalkKorganToB1
@800153
DO ~SetGlobal("#SeverTalkKorganToB","GLOBAL",1)~
== "#SBSev25" @800154
== BKORGA25 @800155
== "#SBSev25" @800156
== BKORGA25 @800157
== "#SBSev25" @800158
== BKORGA25 @800159
== "#SBSev25" @800160
== BKORGA25 @800161
== "#SBSev25" @800162
== BKORGA25 @800163
EXIT

// CONSPIRATION

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKorganToB","GLOBAL",1)
                 InParty("Korgan")
                 InParty("#Severian")
                 Gender(Protagonist,FEMALE)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKORGA25 SeverTalkKorganToB2
@800164
DO ~SetGlobal("#SeverTalkKorganToB","GLOBAL",2)~
== "#SBSev25" @800166
== BKORGA25 @800168
== "#SBSev25" @800170
END IF ~~ THEN EXTERN ~BKORGA25~ TordBoyau

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKorganToB","GLOBAL",1)
                 InParty("Korgan")
                 InParty("#Severian")
                 Gender(Protagonist,MALE)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKORGA25 SeverTalkKorganToB2
@800165
DO ~SetGlobal("#SeverTalkKorganToB","GLOBAL",2)~
== "#SBSev25" @800167
== BKORGA25 @800168
== "#SBSev25" @800169
END IF ~~ THEN EXTERN ~BKORGA25~ TordBoyau1

// L'ENNUI

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKorganToB","GLOBAL",2)
                 InParty("Korgan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKORGA25 SeverTalkKorganToB3
@800182
DO ~SetGlobal("#SeverTalkKorganToB","GLOBAL",3)~
== "#SBSev25" @800183
== BKORGA25 @800184
== "#SBSev25" @800185
== BKORGA25 @800186
== "#SBSev25" @800187
== BKORGA25 @800188
== "#SBSev25" @800189
== BKORGA25 @800190
== "#SBSev25" @800191 = @800192
== BKORGA25 @800193
== "#SBSev25" @800194
== BKORGA25 @800195
== "#SBSev25" @800196
== BKORGA25 @800197
EXIT

// CHACUN SES REVES

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkEdwinToB","GLOBAL",0)
                 InParty("Edwin")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Edwin",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEDWIN25 SeverTalkEdwinToB1
@800198
DO ~SetGlobal("#SeverTalkEdwinToB","GLOBAL",1)~
== "#SBSev25" @800199
== BEDWIN25 @800200
== "#SBSev25" @800201
== BEDWIN25 @800202
EXIT

// UN TOUR DE COCHON

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkEdwinToB","GLOBAL",1)
                 InParty("Edwin")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Edwin",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkEdwinToB2
@800203
DO ~SetGlobal("#SeverTalkEdwinToB","GLOBAL",2)~
== BEDWIN25 @800204
== "#SBSev25" @800205
== BEDWIN25 @800206
== "#SBSev25" @800207
== BEDWIN25 @800208
END IF ~~ THEN EXTERN ~BEDWIN25~ LePresent1

// HISTOIRES NATURELLES

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkEdwinToB","GLOBAL",2)
                 InParty("Edwin")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Edwin",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEDWIN25 SeverTalkEdwinToB3
@800216
DO ~SetGlobal("#SeverTalkEdwinToB","GLOBAL",3)~
== "#SBSev25" @800217
== BEDWIN25 @800218
== "#SBSev25" @800219
== BEDWIN25 @800220
END IF ~~ THEN EXTERN ~#SBSev25~ HistoiresNaturelles1


// BANTERS MINSC

// MAITRE HAMSTER PAR UN FROMAGE ALLECHE


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMinscToB","GLOBAL",0)
                 InParty("Minsc")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Minsc",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMINSC25 SeverTalkMinscToB1
@800227
DO ~SetGlobal("#SeverTalkMinscToB","GLOBAL",1)~
== "#SBSev25" @800228
== BMINSC25 @800229 = @800230 = @800231
== "#SBSev25" @800232
== BMINSC25 @800233
== "#SBSev25" @800234
== BMINSC25 @800235
== "#SBSev25" @800236
EXIT

// PETITE FARCE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMinscToB","GLOBAL",1)
                 InParty("Minsc")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Minsc",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkMinscToB2
@800237
DO ~SetGlobal("#SeverTalkMinscToB","GLOBAL",2)~
== BMINSC25 @800238 = @800239 = @800240
== "#SBSev25" @800241
== BMINSC25 @800242
== "#SBSev25" @800243
== BMINSC25 @800244
== "#SBSev25" @800245
== BMINSC25 @800246
== "#SBSev25" @800247
== BMINSC25 @800248 = @800249
EXIT

// LE CONCOURS

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMinscToB","GLOBAL",2)
                 InParty("Minsc")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Minsc",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMINSC25 SeverTalkMinscToB3
@800250
DO ~SetGlobal("#SeverTalkMinscToB","GLOBAL",3)~
== "#SBSev25" @800251
== BMINSC25 @800252
== "#SBSev25" @800253
== BMINSC25 @800254
== "#SBSev25" @800255
== BMINSC25 @800256
EXIT

// BANTERS IMOEN

// SOUVENIRS

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkImoenToB","GLOBAL",0)
                 InParty("Imoen2")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Imoen2",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BIMOEN25 SeverTalkImoenToB1
@800257
DO ~SetGlobal("#SeverTalkImoenToB","GLOBAL",1)~
== "#SBSev25" @800258
== BIMOEN25 @800259 
== "#SBSev25" @800260
== BIMOEN25 @800261 = @800262
== "#SBSev25" @800263
== BIMOEN25 @800264
EXIT


// VOYEURISME

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkImoenToB","GLOBAL",1)
                 InParty("Imoen2")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Imoen2",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BIMOEN25 SeverTalkImoenToB2
@800265
DO ~SetGlobal("#SeverTalkImoenToB","GLOBAL",2)~
== "#SBSev25" @800266
== BIMOEN25 @800267
== "#SBSev25" @800268
== BIMOEN25 @800269
== "#SBSev25" @800270
EXIT

// MANQUE DE GOUT


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkImoenToB","GLOBAL",2)
                 InParty("Imoen2")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Imoen2",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkImoenToB3
@800271
DO ~SetGlobal("#SeverTalkImoenToB","GLOBAL",3)~
== BIMOEN25 @800272
== "#SBSev25" @800273
== BIMOEN25 @800274
== "#SBSev25" @800275
== BIMOEN25 @800276
== "#SBSev25" @800277
== BIMOEN25 @800278
== "#SBSev25" @800279
== BIMOEN25 @800280
EXIT

// BANTERS ANOMEN

// RECONCILIATION

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAnomenToB","GLOBAL",0)
                 InParty("Anomen")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Anomen",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkAnomenToB1
@800281
DO ~SetGlobal("#SeverTalkAnomenToB","GLOBAL",1)~
== BANOME25 @800282
== "#SBSev25" @800283 = @800284
== BANOME25 @800285
EXIT

// LE CONTRAT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAnomenToB","GLOBAL",1)
                 InParty("Anomen")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Anomen",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BANOME25 SeverTalkAnomenToB2
@800286
DO ~SetGlobal("#SeverTalkAnomenToB","GLOBAL",2)~
== "#SBSev25" @800287
== BANOME25 @800288
== "#SBSev25" @800289
== BANOME25 @800290
== "#SBSev25" @800291
== BANOME25 @800292
== "#SBSev25" @800293
EXIT

// LE JUGEMENT DERNIER

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAnomenToB","GLOBAL",2)
                 InParty("Anomen")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Anomen",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BANOME25 SeverTalkAnomenToB3
@800294
DO ~SetGlobal("#SeverTalkAnomenToB","GLOBAL",3)~
== "#SBSev25" @800295
== BANOME25 @800296
== "#SBSev25" @800297
== BANOME25 @800298
EXIT


// BANTERS AERIE

// EVOLUTION

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAerieToB","GLOBAL",0)
                 InParty("Aerie")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Aerie",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkAerieToB1
@800299
DO ~SetGlobal("#SeverTalkAerieToB","GLOBAL",1)~
== BAERIE25 @800300
== "#SBSev25" @800301
== BAERIE25 @800302
== "#SBSev25" @800303
== BAERIE25 @800304
== "#SBSev25" @800305
EXIT

// PARCOURS INITIATIQUE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAerieToB","GLOBAL",1)
                 InParty("Aerie")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Aerie",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkAerieToB2
@800306
DO ~SetGlobal("#SeverTalkAerieToB","GLOBAL",2)~
== BAERIE25 @800307
== "#SBSev25" @800308
== BAERIE25 @800309
== "#SBSev25" @800310
EXIT

// MUFFINS

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAerieToB","GLOBAL",2)
                 InParty("Aerie")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Aerie",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BAERIE25 SeverTalkAerieToB3
@800311
DO ~SetGlobal("#SeverTalkAerieToB","GLOBAL",3)~
== "#SBSev25" @800312
== BAERIE25 @800313
== "#SBSev25" @800314
== BAERIE25 @800315
== "#SBSev25" @800316
== BAERIE25 @800317
== "#SBSev25" @800318
EXIT

// BANTERS MAZZY

// UN AIR GROGNON

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMazzyToB","GLOBAL",0)
                 InParty("Mazzy")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Mazzy",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkMazzyToB1
@800319
DO ~SetGlobal("#SeverTalkMazzyToB","GLOBAL",1)~
== BMAZZY25 @800320
== "#SBSev25" @800321
== BMAZZY25 @800322
== "#SBSev25" @800323
== BMAZZY25 @800324
== "#SBSev25" @800325
EXIT

// LA MEMOIRE DES DISPARUS

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMazzyToB","GLOBAL",1)
                 InParty("Mazzy")
                 InParty("#Severian")
                 Gender(Protagonist,MALE)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Mazzy",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMAZZY25 SeverTalkMazzyToB2
@800326
DO ~SetGlobal("#SeverTalkMazzyToB","GLOBAL",2)~
== "#SBSev25" @800327
== BMAZZY25 @800328
== "#SBSev25" @800329
== BMAZZY25 @800331
== "#SBSev25" @800332
== BMAZZY25 @800336
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMazzyToB","GLOBAL",1)
                 InParty("Mazzy")
                 InParty("#Severian")
                 Gender(Protagonist,FEMALE)
                 !Global("#SeverRomanceActive","GLOBAL",2)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Mazzy",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMAZZY25 SeverTalkMazzyToB2
@800326
DO ~SetGlobal("#SeverTalkMazzyToB","GLOBAL",2)~
== "#SBSev25" @800327
== BMAZZY25 @800328
== "#SBSev25" @800329
== BMAZZY25 @800331
== "#SBSev25" @800333
== BMAZZY25 @800335
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMazzyToB","GLOBAL",1)
                 InParty("Mazzy")
                 InParty("#Severian")
                 Gender(Protagonist,FEMALE)
                 Global("#SeverRomanceActive","GLOBAL",2)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Mazzy",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMAZZY25 SeverTalkMazzyToB2
@800326
DO ~SetGlobal("#SeverTalkMazzyToB","GLOBAL",2)~
== "#SBSev25" @800327
== BMAZZY25 @800328
== "#SBSev25" @800330
== BMAZZY25 @800334
EXIT

// ACCOMPLISSEMENT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMazzyToB","GLOBAL",2)
                 InParty("Mazzy")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Mazzy",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMAZZY25 SeverTalkMazzyToB3
@800337
DO ~SetGlobal("#SeverTalkMazzyToB","GLOBAL",3)~
== "#SBSev25" @800338
== BMAZZY25 @800339 = @800340 = @800341
== "#SBSev25" @800342
EXIT

// BANTERS JAHEIRA

// REMINISCENCES

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJaheiraToB","GLOBAL",0)
                 InParty("Jaheira")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jaheira",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkJaheiraToB1
@800343
DO ~SetGlobal("#SeverTalkJaheiraToB","GLOBAL",1)~
== BJAHEI25 @800344 = @800345
== "#SBSev25" @800346
== BJAHEI25 @800347
== "#SBSev25" @800348
== BJAHEI25 @800349
EXIT

// NOS SACRIFICES

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJaheiraToB","GLOBAL",2)
                 InParty("Jaheira")
                 InParty("#Severian")
                 Gender(Protagonist,FEMALE)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jaheira",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAHEI25 SeverTalkJaheiraToB2
@800350
DO ~SetGlobal("#SeverTalkJaheiraToB","GLOBAL",3)~
== "#SBSev25" @800351
== BJAHEI25 @800352
== "#SBSev25" @800354
== BJAHEI25 @800355
== "#SBSev25" @800356
== BJAHEI25 @800357
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJaheiraToB","GLOBAL",2)
                 InParty("Jaheira")
                 InParty("#Severian")
                 Gender(Protagonist,MALE)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jaheira",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAHEI25 SeverTalkJaheiraToB2
@800350
DO ~SetGlobal("#SeverTalkJaheiraToB","GLOBAL",3)~
== "#SBSev25" @800351
== BJAHEI25 @800352
== "#SBSev25" @800353
== BJAHEI25 @800355
== "#SBSev25" @800356
== BJAHEI25 @800357
EXIT

// COMPLAINTE ELFIQUE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJaheiraToB","GLOBAL",1)
                 InParty("Jaheira")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jaheira",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAHEI25 SeverTalkJaheiraToB3
@800358 = @800359
DO ~SetGlobal("#SeverTalkJaheiraToB","GLOBAL",2)~
== "#SBSev25" @800360
== BJAHEI25 @800361 = @800362 = @800363
EXIT

// KELDORN

// DEVOIR ET SENS

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKeldornToB","GLOBAL",2)
                 InParty("Keldorn")
                 InParty("#Severian")
                 Gender(Protagonist,MALE)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Keldorn",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkKeldornToB3
@800364
DO ~SetGlobal("#SeverTalkKeldornToB","GLOBAL",3)~
== BKELDO25 @800365
== "#SBSev25" @800367
== BKELDO25 @800370
== "#SBSev25" @800372
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKeldornToB","GLOBAL",2)
                 InParty("Keldorn")
                 InParty("#Severian")
                 Gender(Protagonist,FEMALE)
                 !Global("#SeverRomanceActive","GLOBAL",2)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Keldorn",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkKeldornToB3
@800364
DO ~SetGlobal("#SeverTalkKeldornToB","GLOBAL",3)~
== BKELDO25 @800366
== "#SBSev25" @800368
== BKELDO25 @800370
== "#SBSev25" @800372
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKeldornToB","GLOBAL",2)
                 InParty("Keldorn")
                 InParty("#Severian")
                 Gender(Protagonist,FEMALE)
                 Global("#SeverRomanceActive","GLOBAL",2)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Keldorn",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkKeldornToB3
@800364
DO ~SetGlobal("#SeverTalkKeldornToB","GLOBAL",3)~
== BKELDO25 @800366
== "#SBSev25" @800369
== BKELDO25 @800371
EXIT

// LE VOLEUR DE VERTU 

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKeldornToB","GLOBAL",0)
                 InParty("Keldorn")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Keldorn",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkKeldornToB1
@800373
DO ~SetGlobal("#SeverTalkKeldornToB","GLOBAL",1)~
== BKELDO25 @800374
== "#SBSev25" @800375
== BKELDO25 @800376
== "#SBSev25" @800377
== BKELDO25 @800378
== "#SBSev25" @800379
EXIT

// GLOIRE ET BEAUTE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKeldornToB","GLOBAL",1)
                 InParty("Keldorn")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Keldorn",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkKeldornToB2
@800380
DO ~SetGlobal("#SeverTalkKeldornToB","GLOBAL",2)~
== BKELDO25 @800381
== "#SBSev25" @800382
== BKELDO25 @800383
== "#SBSev25" @800384
== BKELDO25 @800385
== "#SBSev25" @800386 = @800387
EXIT

// BANTERS CERND

// LA SCIENCE DE L'HERBORISTERIE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkCerndToB","GLOBAL",0)
                 InParty("Cernd")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Cernd",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkCerndToB1
@800388
DO ~SetGlobal("#SeverTalkCerndToB","GLOBAL",1)~
== BCERND25 @800389
== "#SBSev25" @800390
== BCERND25 @800391
== "#SBSev25" @800392
== BCERND25 @800393 = @800394
== "#SBSev25" @800395
EXIT

// LA FEE VERTE


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkCerndToB","GLOBAL",1)
                 InParty("Cernd")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Cernd",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkCerndToB2
@800396
DO ~SetGlobal("#SeverTalkCerndToB","GLOBAL",2)~
== BCERND25 @800397
== "#SBSev25" @800398
== BCERND25 @800399
== "#SBSev25" @800400
== BCERND25 @800401
== "#SBSev25" @800402
EXIT

// LA LEGENDE D'ORUNAKE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkCerndToB","GLOBAL",2)
                 InParty("Cernd")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Cernd",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BCERND25 SeverTalkCerndToB3
@800403
DO ~SetGlobal("#SeverTalkCerndToB","GLOBAL",3)~
== "#SBSev25" @800404
== BCERND25 @800405
== BCERND25 @800406
== BCERND25 @800407
== "#SBSev25" @800408
== BCERND25 @800409
EXIT

// BANTERS HAER'DALIS

// L'AMOUR DE L'ENTROPIE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkHaerDalisToB","GLOBAL",0)
                 InParty("HaerDalis")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("HaerDalis",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkHaerDalisToB1
@800411
DO ~SetGlobal("#SeverTalkHaerDalisToB","GLOBAL",1)~
== BHAERD25 @800412
== "#SBSev25" @800413
== BHAERD25 @800414
== "#SBSev25" @800415
== BHAERD25 @800416
EXIT

// PROJETS

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkHaerDalisToB","GLOBAL",1)
                 InParty("HaerDalis")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("HaerDalis",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkHaerDalisToB2
@800417
DO ~SetGlobal("#SeverTalkHaerDalisToB","GLOBAL",2)~
== BHAERD25 @800418
== "#SBSev25" @800419
== BHAERD25 @800420
== "#SBSev25" @800421
EXIT

// LE CHAT ET LE RAT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkHaerDalisToB","GLOBAL",2)
                 InParty("HaerDalis")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("HaerDalis",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BHAERD25 SeverTalkHaerDalisToB3
@800422 = @800423 = @800424 = @800425 = @800426
DO ~SetGlobal("#SeverTalkHaerDalisToB","GLOBAL",3)~
== "#SBSev25" @800427
== BHAERD25 @800428
EXIT

// BANTERS VALYGAR

// ABSOLUTION

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkValygarToB","GLOBAL",0)
                 InParty("Valygar")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Valygar",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVALYG25 SeverTalkValygarToB1
@800429
DO ~SetGlobal("#SeverTalkValygarToB","GLOBAL",1)~
== "#SBSev25" @800430
== BVALYG25 @800431
== "#SBSev25" @800432
== BVALYG25 @800433
== "#SBSev25" @800434
EXIT

// L'AME DE L'EPEE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkValygarToB","GLOBAL",1)
                 InParty("Valygar")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Valygar",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVALYG25 SeverTalkValygarToB2
@800435
DO ~SetGlobal("#SeverTalkValygarToB","GLOBAL",2)~
== "#SBSev25" @800436
== BVALYG25 @800437
== "#SBSev25" @800438
== BVALYG25 @800439
== "#SBSev25" @800440
== BVALYG25 @800441
== "#SBSev25" @800442
EXIT

// 

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkValygarToB","GLOBAL",2)
                 InParty("Valygar")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Valygar",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSev25" SeverTalkValygarToB3
@800443
DO ~SetGlobal("#SeverTalkValygarToB","GLOBAL",3)~
== BVALYG25 @800444
== "#SBSev25" @800445
== BVALYG25 @800446
== "#SBSev25" @800447
== BVALYG25 @800448
EXIT