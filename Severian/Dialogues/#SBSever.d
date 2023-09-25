
BEGIN ~#SBSever~


// BANTERS SEVERIAN / MINSC


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMinsc","GLOBAL",0)
                 InParty("Minsc")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Minsc",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMINSC SeverTalkMinsc1
@800000
DO ~ SetGlobal("#SeverTalkMinsc","GLOBAL",1)~
== "#SBSever" @800001
== BMINSC @800002
== "#SBSever" @800003
== BMINSC @800004
== "#SBSever" @800005
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMinsc","GLOBAL",1)
                 InParty("Minsc")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Minsc",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMINSC SeverTalkMinsc2
@800006
DO ~ SetGlobal("#SeverTalkMinsc","GLOBAL",2)~
== "#SBSever" @800007
== BMINSC @800008
== "#SBSever" @800009
== BMINSC @800010
== "#SBSever" @800011
== BMINSC @800012
== "#SBSever" @800013
== BMINSC @800014
== "#SBSever" @800015
== BMINSC @800016
== "#SBSever" @800017
== BMINSC @800018
== "#SBSever" @800019
== BMINSC @800020
== "#SBSever" @800021
== BMINSC @800022
== "#SBSever" @800023
== BMINSC @800024
== "#SBSever" @800025
== BMINSC @800026
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMinsc","GLOBAL",2)
                 InParty("Minsc")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Minsc",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMINSC SeverTalkMinsc3
@800027
DO ~ SetGlobal("#SeverTalkMinsc","GLOBAL",3)~
== "#SBSever" @800028
== BMINSC @800029
== "#SBSever" @800030
== BMINSC @800031
== "#SBSever" @800032
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMinsc","GLOBAL",3)
                 InParty("Minsc")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Minsc",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMINSC SeverTalkMinsc4
@800033
DO ~ SetGlobal("#SeverTalkMinsc","GLOBAL",4)~
== "#SBSever" @800034
== BMINSC @800035
== "#SBSever" @800036
== BMINSC @800037
== "#SBSever" @800038
== BMINSC @800039
== "#SBSever" @800040
== BMINSC @800041
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMinsc","GLOBAL",4)
                 InParty("Minsc")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Minsc",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMINSC SeverTalkMinsc5
@800064
DO ~ SetGlobal("#SeverTalkMinsc","GLOBAL",5)~
== "#SBSever" @800065
== BMINSC @800066
== "#SBSever" @800067
== BMINSC @800068
== "#SBSever" @800069
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMinsc","GLOBAL",5)
                 InParty("Minsc")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Minsc",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMINSC SeverTalkMinsc7
@800043
DO ~ SetGlobal("#SeverTalkMinsc","GLOBAL",6)~
== "#SBSever" @800044
== BMINSC @800045
== "#SBSever" @800046
== BMINSC @800047
== "#SBSever" @800048 = @800049
== BMINSC @800137
== "#SBSever" @800138
EXIT

// BANTERS SEVERIAN / AERIE

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAerie","GLOBAL",0)
                 InParty("Aerie")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Aerie",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BAERIE SeverTalkAerie1
@800085
DO ~ SetGlobal("#SeverTalkAerie","GLOBAL",1)~
== "#SBSever" @800086
== BAERIE @800087
== "#SBSever" @800088
== BAERIE @800089
== "#SBSever" @800090
== BAERIE @800091
== "#SBSever" @800092
== BAERIE @800093
== "#SBSever" @800094
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAerie","GLOBAL",1)
                 InParty("Aerie")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Aerie",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BAERIE SeverTalkAerie2
@800095
DO ~ SetGlobal("#SeverTalkAerie","GLOBAL",2)~
== "#SBSever" @800096
== BAERIE @800097
== "#SBSever" @800098
== BAERIE @800099
== "#SBSever" @800100
== BAERIE @800101
== "#SBSever" @800102
== BAERIE @800103
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAerie","GLOBAL",2)
                 InParty("Aerie")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Aerie",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BAERIE SeverTalkAerie3
@800104
DO ~ SetGlobal("#SeverTalkAerie","GLOBAL",3)~
== "#SBSever" @800105
== BAERIE @800106
== "#SBSever" @800107
== BAERIE @800108
== "#SBSever" @800109
== BAERIE @800110
== "#SBSever" @800111
== BAERIE @800112
== "#SBSever" @800113
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAerie","GLOBAL",3)
                 InParty("Aerie")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Aerie",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BAERIE SeverTalkAerie4
@800114
DO ~ SetGlobal("#SeverTalkAerie","GLOBAL",4)~
== "#SBSever" @800115
== BAERIE @800116
== "#SBSever" @800117
== BAERIE @800118
== "#SBSever" @800119
== BAERIE @800120
== "#SBSever" @800121
== BAERIE @800122
== "#SBSever" @800123
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAerie","GLOBAL",4)
                 InParty("Aerie")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Aerie",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BAERIE SeverTalkAerie5
@800124
DO ~ SetGlobal("#SeverTalkAerie","GLOBAL",5)~
== "#SBSever" @800125
== BAERIE @800126
== "#SBSever" @800127
== BAERIE @800128
== "#SBSever" @800129
== BAERIE @800130
== "#SBSever" @800131
== BAERIE @800132
== "#SBSever" @800133
== BAERIE @800134
== "#SBSever" @800135
== BAERIE @800136
EXIT

// BANTERS SEVERIAN / JAN

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJan","GLOBAL",0)
                 InParty("Jan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAN SeverTalkJan1
@800154
DO ~ SetGlobal("#SeverTalkJan","GLOBAL",1)~
== "#SBSever" @800155
== BJAN @800139
== "#SBSever" @800140
== BJAN @800141
== "#SBSever" @800142
== BJAN @800143
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJan","GLOBAL",1)
                 InParty("Jan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAN SeverTalkJan2
@800144
DO ~ SetGlobal("#SeverTalkJan","GLOBAL",2)~
== "#SBSever" @800145
== BJAN @800146
== "#SBSever" @800147
== BJAN @800148
== "#SBSever" @800149
== BJAN @800150
== "#SBSever" @800151
== BJAN @800152
== "#SBSever" @800153
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJan","GLOBAL",2)
                 InParty("Jan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAN SeverTalkJan3
@800156
DO ~ SetGlobal("#SeverTalkJan","GLOBAL",3)~
== "#SBSever" @800157
== BJAN @800158
== "#SBSever" @800159
== BJAN @800160
== "#SBSever" @800161
== BJAN @800162
== "#SBSever" @800163
== BJAN @800164 
== BANOMEN IF ~InParty("Anomen")~ THEN @800377
== BJAN IF ~InParty("Anomen")~ @800165
== BANOMEN IF ~InParty("Anomen")~ @800166
EXIT


CHAIN
IF WEIGHT #-999 ~InParty("Jan")
                 InParty("#Severian")
                 Global("#SeverTalkJan","GLOBAL",3)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkJan4
@800167
DO ~ SetGlobal("#SeverTalkJan","GLOBAL",4)~
== BJAN @800168
== "#SBSever" @800169
== BJAN @800170
== "#SBSever" @800171
== BJAN @800172
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJan","GLOBAL",4)
                 InParty("Jan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAN SeverTalkJan5
@800173
DO ~ SetGlobal("#SeverTalkJan","GLOBAL",5)~
== "#SBSever" @800174
== BJAN @800175
== "#SBSever" @800176
== BJAN @800177
== "#SBSever" @800178
== BJAN @800179
== "#SBSever" @800180
== BJAN @800181
== "#SBSever" @800182
== BJAN @800183
== "#SBSever" @800184
== BJAN @800185
== "#SBSever" @800186
== BJAN @800187
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJan","GLOBAL",5)
                 InParty("Jan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAN SeverTalkJan6
@800188
DO ~ SetGlobal("#SeverTalkJan","GLOBAL",6)~
== "#SBSever" @800189
== BJAN @800190
== "#SBSever" @800191
== BJAN @800192
== "#SBSever" @800193
== BJAN @800194
== "#SBSever" @800195
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Jan")
                 InParty("#Severian")
                 Global("#SeverTalkJan","GLOBAL",6)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkJan7
@800196
DO ~ SetGlobal("#SeverTalkJan","GLOBAL",7)~
== BJAN @800197
== "#SBSever" @800198
== BJAN @800199
== "#SBSever" @800200
== BJAN @800201
== "#SBSever" @800890
== BJAN @800203
EXIT

// BANTERS JAHEIRA


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJaheira","GLOBAL",0)
                 InParty("#Severian")
                 InParty("Jaheira")
                 Alignment("#Severian",CHAOTIC_NEUTRAL)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jaheira",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAHEIR SeverTalkJaheira1
@800204
DO ~ SetGlobal("#SeverTalkJaheira","GLOBAL",1)~
== "#SBSever" @800205
== BJAHEIR @800206
== "#SBSever" @800207
== BJAHEIR @800208
== "#SBSever" @800209
== BJAHEIR @800210
== "#SBSever" @800211
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkJaheira","GLOBAL",1)
                 InParty("#Severian")
                 InParty("Jaheira")
                 Alignment("#Severian",CHAOTIC_NEUTRAL)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jaheira",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAHEIR SeverTalkJaheira2
@800212
DO ~ SetGlobal("#SeverTalkJaheira","GLOBAL",2)~
== "#SBSever" @800213
== BJAHEIR @800214
== "#SBSever" @800215
== BJAHEIR @800216
== "#SBSever" @800217
== BJAHEIR @800218
== "#SBSever" @800219
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Jaheira")
                 InParty("#Severian")
                 Global("#SeverTalkJaheira","GLOBAL",2)
                 Alignment("#Severian",CHAOTIC_NEUTRAL)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jaheira",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkJaheira3
@800220
DO ~ SetGlobal("#SeverTalkJaheira","GLOBAL",3)~
== BJAHEIR @800221
== "#SBSever" @800222
== BJAHEIR @800223
== "#SBSever" @800224
== BJAHEIR @800225
== "#SBSever" @800226
== BJAHEIR @800227
== "#SBSever" @800228
== BJAHEIR @800229
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("#Severian")
                 InParty("Jaheira")
                 Global("#SeverTalkJaheira","GLOBAL",3)
                 Alignment("#Severian",CHAOTIC_NEUTRAL)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jaheira",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAHEIR SeverTalkJaheira4
@800330
DO ~ SetGlobal("#SeverTalkJaheira","GLOBAL",4)~
== "#SBSever" @800331
== BJAHEIR @800332
== "#SBSever" @800333
== BJAHEIR @800334
== "#SBSever" @800335
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Jaheira")
                 InParty("#Severian")
                 Global("#SeverTalkJaheira","GLOBAL",4)
                 Alignment("#Severian",CHAOTIC_NEUTRAL)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jaheira",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkJaheira5
@800336
DO ~ SetGlobal("#SeverTalkJaheira","GLOBAL",5)~
== BJAHEIR @800337
== "#SBSever" @800338
== BJAHEIR @800339
== "#SBSever" @800340
== BJAHEIR @800341
== "#SBSever" @800342
== BJAHEIR @800343
== "#SBSever" @800344
== BJAHEIR @800345
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("#Severian")
                 InParty("Jaheira")
                 Global("#SeverTalkJaheira","GLOBAL",5)
                 Alignment("#Severian",CHAOTIC_NEUTRAL)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Jaheira",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BJAHEIR SeverTalkJaheira6
@800346
DO ~ SetGlobal("#SeverTalkJaheira","GLOBAL",6)~
== "#SBSever" @800347
== BJAHEIR @800348
== "#SBSever" @800349
== BJAHEIR @800350
== "#SBSever" @800351
== BJAHEIR @800352
== "#SBSever" @800353
== BJAHEIR @800354
== "#SBSever" @800355
== BJAHEIR @800356
== "#SBSever" @800357 = @800358
== BJAHEIR @800359
EXIT


// BANTERS EDWIN

CHAIN
IF WEIGHT #-999 ~InParty("Edwin")
                 InParty("#Severian")
                 Global("#SeverTalkEdwin","GLOBAL",0)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Edwin",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkEdwin1
@800360
DO ~ SetGlobal("#SeverTalkEdwin","GLOBAL",1)~
== BEDWIN @800361
== "#SBSever" @800362
== BEDWIN @800363
== "#SBSever" @800364
== BAERIE   IF ~InParty("Aerie")~ THEN @800365
== "#SBSever" IF ~InParty("Aerie")~ THEN @800366
== BAERIE IF ~InParty("Aerie")~ THEN @800367
== "#SBSever" IF ~InParty("Aerie")~ THEN @800368
== BKORGAN IF ~InParty("Korgan")~ THEN @800376
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkEdwin","GLOBAL",1)
                 InParty("Edwin")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Edwin",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEDWIN SeverTalkEdwin2
@800369
DO ~ SetGlobal("#SeverTalkEdwin","GLOBAL",2)~
== "#SBSever" @800370
== BEDWIN @800371
== "#SBSever" @800372
== BEDWIN @800373
== "#SBSever" @800374
== BKORGAN IF ~InParty("Korgan")~ THEN @800375
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkEdwin","GLOBAL",2)
                 InParty("Edwin")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Edwin",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEDWIN SeverTalkEdwin3
@800378
DO ~SetGlobal("#SeverTalkEdwin","GLOBAL",3)~
== "#SBSever" @800379
== BEDWIN @800381
== "#SBSever" @800382
== BEDWIN @800383
== BKORGAN IF ~InParty("Korgan")~ THEN @800393 
EXIT


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkEdwin","GLOBAL",3)
                 InParty("Edwin")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Edwin",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEDWIN SeverTalkEdwin4
@800384
DO ~ SetGlobal("#SeverTalkEdwin","GLOBAL",4)~
== "#SBSever" @800385
== BEDWIN @800386
== "#SBSever" @800387
== BEDWIN @800388
== "#SBSever" @800389
== BEDWIN @800390
== BVICONI IF ~InParty("Viconia")~ THEN @800392
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkEdwin","GLOBAL",4)
                 InParty("Edwin")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Edwin",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEDWIN SeverTalkEdwin5
@800394
DO ~ SetGlobal("#SeverTalkEdwin","GLOBAL",5)~
== "#SBSever" @800395
== BEDWIN @800396 = @800397
== "#SBSever" @800398
== BEDWIN @800400
== BEDWIN @800401
== "#SBSever" @800402
== BEDWIN @800403 = @800404
== "#SBSever" @800405
== BEDWIN @800406
== "#SBSever" @800407 = @800408
== BANOMEN IF ~InParty("Anomen")~ THEN @800409
== "#SBSever" IF ~InParty("Anomen")~ THEN @800410
== BANOMEN IF ~InParty("Anomen")~ THEN @800411
== "#SBSever" IF ~InParty("Anomen")~ THEN @800412
== BANOMEN IF ~InParty("Anomen")~ THEN @800413 = @800414
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Edwin")
                 InParty("#Severian")
                 Global("#SeverTalkEdwin","GLOBAL",5)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Edwin",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkEdwin6
@800415
DO ~ SetGlobal("#SeverTalkEdwin","GLOBAL",6)~
== BEDWIN @800416
== "#SBSever" @800417
== BEDWIN @800418
== "#SBSever" @800419
== BEDWIN @800420
== "#SBSever" @800421
== BEDWIN @800422
EXIT


// BANTERS vICONIA

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkViconia","GLOBAL",0)
                 InParty("Viconia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Viconia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVICONI SeverTalkViconia1
@800423
DO ~ SetGlobal("#SeverTalkViconia","GLOBAL",1)~
== "#SBSever" @800424
== BVICONI @800425
== "#SBSever" @800426
== BVICONI @800427
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkViconia","GLOBAL",1)
                 InParty("Viconia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Viconia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVICONI SeverTalkViconia2
@800428
DO ~ SetGlobal("#SeverTalkViconia","GLOBAL",2)~
== "#SBSever" @800429
== BVICONI @800430
== "#SBSever" @800431
== BVICONI @800432
== "#SBSever" @800433 = @800434
== BVICONI @800435
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkViconia","GLOBAL",2)
                 InParty("Viconia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Viconia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVICONI SeverTalkViconia3
@800436
DO ~ SetGlobal("#SeverTalkViconia","GLOBAL",3)~
== "#SBSever" @800437
== BVICONI @800438
== "#SBSever" @800439
== BVICONI @800440
== "#SBSever" @800441
== BVICONI @800442
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkViconia","GLOBAL",3)
                 InParty("Viconia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Viconia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVICONI SeverTalkViconia4
@800443
DO ~ SetGlobal("#SeverTalkViconia","GLOBAL",4)~
== "#SBSever" @800444
== BVICONI @800445
== "#SBSever" @800446
== BVICONI @800447 = @800448
== "#SBSever" @800449
== BVICONI @800450
== "#SBSever" @800451
== BVICONI @800452
== "#SBSever" @800453
EXIT


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkViconia","GLOBAL",4)
                 InParty("Viconia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Viconia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVICONI SeverTalkViconia5
@800457
DO ~ SetGlobal("#SeverTalkViconia","GLOBAL",5)~
== "#SBSever" @800458
== BVICONI @800459
== "#SBSever" @800460
== BVICONI @800461
== "#SBSever" @800462
== BVICONI @800463
== "#SBSever" @800464
== BVICONI @800465
== "#SBSever" @800466
EXIT


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkViconia","GLOBAL",5)
                 InParty("Viconia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Viconia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVICONI SeverTalkViconia6
@800467
DO ~ SetGlobal("#SeverTalkViconia","GLOBAL",6)~
== "#SBSever" @800468
== BVICONI @800469
== "#SBSever" @800470
== BVICONI @800471
== "#SBSever" @800472
== BVICONI @800473
== "#SBSever" @800474
== BVICONI @800475
== "#SBSever" @800476
== BVICONI @800477 = @800478
EXIT


// BANTERS KORGAN


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKorgan","GLOBAL",0)
                 InParty("Korgan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKORGAN SeverTalkKorgan1
@800479
DO ~ SetGlobal("#SeverTalkKorgan","GLOBAL",1)~
== "#SBSever" @800480
== BKORGAN @800481
== "#SBSever" @800482
== BKORGAN @800483
== "#SBSever" @800484
== BKORGAN @800485
== "#SBSever" @800486
== BKORGAN @800487
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKorgan","GLOBAL",1)
                 InParty("Korgan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKORGAN SeverTalkKorgan2
@800488
DO ~ SetGlobal("#SeverTalkKorgan","GLOBAL",2)~
== "#SBSever" @800489
== BKORGAN @800490
== "#SBSever" @800491
== BKORGAN @800492 = @800493
== "#SBSever" @800494
== BKORGAN @800495 = @800496
== "#SBSever" @800497
== BKORGAN @800498
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKorgan","GLOBAL",2)
                 InParty("Korgan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKORGAN SeverTalkKorgan3
@800499
DO ~ SetGlobal("#SeverTalkKorgan","GLOBAL",3)~
== "#SBSever" @800500 = @800501
== BKORGAN @800502
== "#SBSever" @800503
== BKORGAN @800504
== "#SBSever" @800505
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKorgan","GLOBAL",3)
                 InParty("Korgan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKORGAN SeverTalkKorgan4
@800506
DO ~ SetGlobal("#SeverTalkKorgan","GLOBAL",4)~
== "#SBSever" @800507 = @800508
== BKORGAN @800509
== "#SBSever" @800510
== BKORGAN @800511
== "#SBSever" @800512
EXIT


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKorgan","GLOBAL",4)
                 InParty("Korgan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKORGAN SeverTalkKorgan5
@800513
DO ~ SetGlobal("#SeverTalkKorgan","GLOBAL",5)~
== "#SBSever" @800514
== BKORGAN @800515
== "#SBSever" @800516
== BKORGAN @800517
== "#SBSever" @800518
== BKORGAN @800519
== "#SBSever" @800520
== BKORGAN @800521
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Korgan")
                 InParty("#Severian")
                 Global("#SeverTalkKorgan","GLOBAL",5)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkKorgan6
@800522
DO ~ SetGlobal("#SeverTalkKorgan","GLOBAL",6)~
== BKORGAN @800523
== "#SBSever" @800524
== BKORGAN @800525
== "#SBSever" @800526
== BKORGAN @800527
== "#SBSever" @800528
== BKORGAN @800529
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKorgan","GLOBAL",6)
                 InParty("Korgan")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Korgan",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKORGAN SeverTalkKorgan7
@800530
DO ~SetGlobal("#SeverTalkKorgan","GLOBAL",7)~
== "#SBSever" @800531
== BKORGAN @800532
== "#SBSever" @800533
== BKORGAN @800534
EXIT

// BANTERS VALYGAR 

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkValygar","GLOBAL",0)
                 InParty("Valygar")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Valygar",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVALYGA SeverTalkValygar1
@800535
DO ~SetGlobal("#SeverTalkValygar","GLOBAL",1)~
== "#SBSever" @800536
== BVALYGA @800537
== "#SBSever" @800538
== BVALYGA @800539
== "#SBSever" @800540
== BVALYGA @800541
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkValygar","GLOBAL",1)
                 InParty("Valygar")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Valygar",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVALYGA SeverTalkValygar2
@800542
DO ~SetGlobal("#SeverTalkValygar","GLOBAL",2)~
== "#SBSever" @800543 = @800544
== BVALYGA @800545
== "#SBSever" @800546
== BVALYGA @800547
== "#SBSever" @800548
== BVALYGA @800549
== "#SBSever" @800550
== BVALYGA @800551
== "#SBSever" @800552
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkValygar","GLOBAL",2)
                 InParty("Valygar")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Valygar",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVALYGA SeverTalkValygar3
@800553
DO ~SetGlobal("#SeverTalkValygar","GLOBAL",3)~
== "#SBSever" @800554
== BVALYGA @800555 = @800556 = @800557 = @800558 = @800559 = @800560
EXIT


CHAIN
IF WEIGHT #-999 ~InParty("Valygar")
                 InParty("#Severian")
                 Global("#SeverTalkValygar","GLOBAL",3)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Valygar",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkValygar4
@800561
DO ~SetGlobal("#SeverTalkValygar","GLOBAL",4)~
== BVALYGA @800562
== "#SBSever" @800563
== BVALYGA @800564
== "#SBSever" @800565
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkValygar","GLOBAL",4)
                 InParty("Valygar")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Valygar",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BVALYGA SeverTalkValygar5
@800566
DO ~SetGlobal("#SeverTalkValygar","GLOBAL",5)~
== "#SBSever" @800567
== BVALYGA @800568
== "#SBSever" @800569
== BVALYGA @800570
EXIT

// BANTERS IMOEN

CHAIN
IF WEIGHT #-999 ~InParty("Imoen2")
                 InParty("#Severian")
                 Global("#SeverTalkImoen","GLOBAL",0)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Imoen2",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkImoen1
@800571
DO ~SetGlobal("#SeverTalkImoen","GLOBAL",1)~
== BIMOEN2 @800572
== "#SBSever" @800573
== BIMOEN2 @800574 = @800575
== "#SBSever" @800576
== BIMOEN2 @800577
== "#SBSever" @800578
== BIMOEN2 @800579
== "#SBSever" @800580
EXIT


CHAIN
IF WEIGHT #-999 ~InParty("Imoen2")
                 InParty("#Severian")
                 Global("#SeverTalkImoen","GLOBAL",1)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Imoen2",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkImoen2
@800581
DO ~SetGlobal("#SeverTalkImoen","GLOBAL",2)~
== BIMOEN2 @800582
== "#SBSever" @800583
== BIMOEN2 @800584
== "#SBSever" @800585
== BIMOEN2 @800586
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkImoen","GLOBAL",2)
                 InParty("Imoen2")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Imoen2",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BIMOEN2 SeverTalkImoen3
@800587
DO ~SetGlobal("#SeverTalkImoen","GLOBAL",3)~
== "#SBSever" @800588
== BIMOEN2 @800589
== "#SBSever" @800590
== BIMOEN2 @800591
== "#SBSever" @800592
== BIMOEN2 @800593
== "#SBSever" @800594
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkImoen","GLOBAL",3)
                 InParty("Imoen2")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Imoen2",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BIMOEN2 SeverTalkImoen4
@800595
DO ~SetGlobal("#SeverTalkImoen","GLOBAL",4)~
== "#SBSever" @800596 
== BIMOEN2 @800597
== "#SBSever" @800598
== BIMOEN2 @800599
== "#SBSever" @800600
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkImoen","GLOBAL",4)
                 InParty("Imoen2")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Imoen2",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BIMOEN2 SeverTalkImoen5
@800601
DO ~SetGlobal("#SeverTalkImoen","GLOBAL",5)~
== "#SBSever" @800602
== BIMOEN2 @800603
== "#SBSever" @800604
== BIMOEN2 @800605
== "#SBSever" @800606
== BIMOEN2 @800607 = @800608
== "#SBSever" @800609
== BIMOEN2 @800610
== "#SBSever" @800611
== BIMOEN2 @800612
== "#SBSever" @800613 = @800614
== BIMOEN2 @800615
== "#SBSever" @800616
== BIMOEN2 @800617
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkImoen","GLOBAL",5)
                 InParty("Imoen2")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Imoen2",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BIMOEN2 SeverTalkImoen6
@800618
DO ~SetGlobal("#SeverTalkImoen","GLOBAL",6)~
== "#SBSever" @800619 
== BIMOEN2 @800620
== "#SBSever" @800621
== BIMOEN2 @800622
== "#SBSever" @800623
== BIMOEN2 @800624
EXIT

// BANTERS HAER'DALIS

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkHaerDalis","GLOBAL",0)
                 InParty("Haer'Dalis")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Haer'Dalis",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BHAERDA SeverTalkHaerDalis1
@800625
DO ~SetGlobal("#SeverTalkHaerDalis","GLOBAL",1)~
== "#SBSever" @800626 
== BHAERDA @800627
== "#SBSever" @800628
== BHAERDA @800659
== "#SBSever" @800660
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkHaerDalis","GLOBAL",1)
                 InParty("Haer'Dalis")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Haer'Dalis",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BHAERDA SeverTalkHaerDalis2
@800661
DO ~SetGlobal("#SeverTalkHaerDalis","GLOBAL",2)~
== "#SBSever" @800662
== BHAERDA @800663
== "#SBSever" @800664
== BHAERDA @800665
== "#SBSever" @800666
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkHaerDalis","GLOBAL",2)
                 InParty("Haer'Dalis")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Haer'Dalis",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BHAERDA SeverTalkHaerDalis3
@800900
DO ~SetGlobal("#SeverTalkHaerDalis","GLOBAL",3)~
== "#SBSever" @800667
== BHAERDA @800668
== "#SBSever" @800920
== BHAERDA @800669
== "#SBSever" @800670
== BHAERDA @800671
== "#SBSever" @800672
== BHAERDA @800673
== "#SBSever" @800674
== BHAERDA @800675
== "#SBSever" @800676
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkHaerDalis","GLOBAL",3)
                 InParty("Haer'Dalis")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Haer'Dalis",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BHAERDA SeverTalkHaerDalis4
@800677
DO ~SetGlobal("#SeverTalkHaerDalis","GLOBAL",4)~
== "#SBSever" @800678 
== BHAERDA @800679 = @800680 = @800681
== "#SBSever" @800682
== BHAERDA @800683
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Haer'Dalis")
                 InParty("#Severian")
                 Global("#SeverTalkHaerDalis","GLOBAL",4)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Haer'Dalis",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkHaerDalis5
@800684
DO ~SetGlobal("#SeverTalkHaerDalis","GLOBAL",5)~ 
== BHAERDA @800685 = @800686
== "#SBSever" @800687
== BHAERDA @800688 = @800689 = @800690
== "#SBSever" @800691 = @800692 = @800693
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverRomanceActive","GLOBAL",1)
                 Global("#SeverTalkHaerDalis","GLOBAL",5)
                 InParty("Haer'Dalis")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Haer'Dalis",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BHAERDA SeverTalkHaerDalis6
@800694 = @800695
DO ~SetGlobal("#SeverTalkHaerDalis","GLOBAL",6)~ 
== "#SBSever" @800696
== BHAERDA @800697 = @800698 = @800699 = @800700
== "#SBSever" @800701
EXIT

// BANTERS YOSHIMO

CHAIN
IF WEIGHT #-999 ~InParty("Yoshimo")
                 InParty("#Severian")
                 Global("#SeverTalkYoshimo","GLOBAL",0)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Yoshimo",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkYoshimo1
@800702 = @800703
DO ~SetGlobal("#SeverTalkYoshimo","GLOBAL",1)~ 
== BYOSHIM @800704
== "#SBSever" @800705
== BYOSHIM @800706
== "#SBSever" @800707
== BYOSHIM @800708
== "#SBSever" @800709
== BYOSHIM @800710
== "#SBSever" @800711
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkYoshimo","GLOBAL",1)
                 InParty("Yoshimo")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Yoshimo",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BYOSHIM SeverTalkYoshimo2
@800712
DO ~SetGlobal("#SeverTalkYoshimo","GLOBAL",2)~ 
== "#SBSever" @800713
== BYOSHIM @800714
== "#SBSever" @800715
== BYOSHIM @800716
== "#SBSever" @800717
EXIT


CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkYoshimo","GLOBAL",2)
                 InParty("Yoshimo")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Yoshimo",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BYOSHIM SeverTalkYoshimo3
@800718
DO ~SetGlobal("#SeverTalkYoshimo","GLOBAL",3)~ 
== "#SBSever" @800719
== BYOSHIM @800720
== "#SBSever" @800721
== BYOSHIM @800722
== "#SBSever" @800723
EXIT

// BANTERS NALIA

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkNalia","GLOBAL",0)
                 InParty("Nalia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Nalia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BNALIA SeverTalkNalia1
@800724
DO ~SetGlobal("#SeverTalkNalia","GLOBAL",1)~ 
== "#SBSever" @800725
== BNALIA @800726
== "#SBSever" @800727
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkNalia","GLOBAL",1)
                InParty("Nalia")
                InParty("#Severian")
                CombatCounter(0)
                !See([ENEMY])
                !StateCheck("Nalia",CD_STATE_NOTVALID)
                !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BNALIA SeverTalkNalia2
@800728
DO ~SetGlobal("#SeverTalkNalia","GLOBAL",2)~ 
== "#SBSever" @800729
== BNALIA @800730
== "#SBSever" @800731
== BNALIA @800732
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Nalia")
                 InParty("#Severian") 
                 Global("#SeverTalkNalia","GLOBAL",2)

                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Nalia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkNalia3
@800733
DO ~SetGlobal("#SeverTalkNalia","GLOBAL",3)~ 
== BNALIA @800734
== "#SBSever" @800735
== BNALIA @800736
== "#SBSever" @800737
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkNalia","GLOBAL",3)
                 InParty("Nalia")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Nalia",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BNALIA SeverTalkNalia4
@800738
DO ~SetGlobal("#SeverTalkNalia","GLOBAL",4)~ 
== "#SBSever" @800739
== BNALIA @800740
== "#SBSever" @800741
== BNALIA @800742
== "#SBSever" @800743
== BNALIA @800744
EXIT

// BANTERS KELDORN

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKeldorn","GLOBAL",0)
                InParty("#Severian")
                InParty("Keldorn")
                CombatCounter(0)
                !See([ENEMY])
                !StateCheck("Keldorn",CD_STATE_NOTVALID)
                !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKELDOR SeverTalkKeldorn1
@800765
DO ~SetGlobal("#SeverTalkKeldorn","GLOBAL",1)~ 
== "#SBSever" @800766
== BKELDOR @800767
== "#SBSever" @800768
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKeldorn","GLOBAL",1)
                 InParty("Keldorn")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Keldorn",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKELDOR SeverTalkKeldorn2
@800769
DO ~SetGlobal("#SeverTalkKeldorn","GLOBAL",2)~ 
== "#SBSever" @800770
== BKELDOR @800771
== "#SBSever" @800772
== BKELDOR @800773
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Keldorn")
                 InParty("#Severian")
                 Global("#SeverTalkKeldorn","GLOBAL",2)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Keldorn",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkKeldorn3
@800774
DO ~SetGlobal("#SeverTalkKeldorn","GLOBAL",3)~ 
== BKELDOR @800775 = @800776
== "#SBSever" @800777
== BKELDOR @800778
== "#SBSever" @800779
== BKELDOR @800780
== "#SBSever" @800781
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKeldorn","GLOBAL",3)
                 InParty("Keldorn")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Keldorn",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKELDOR SeverTalkKeldorn4
@800782
DO ~SetGlobal("#SeverTalkKeldorn","GLOBAL",4)~ 
== "#SBSever" @800783
== BKELDOR @800784
== "#SBSever" @800785
== BKELDOR @800786
== "#SBSever" @800787
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkKeldorn","GLOBAL",4)
                 InParty("Keldorn")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Keldorn",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BKELDOR SeverTalkKeldorn5
@800788
DO ~SetGlobal("#SeverTalkKeldorn","GLOBAL",5)~ 
== "#SBSever" @800789
== BKELDOR @800790
== "#SBSever" @800791
== BKELDOR @800792
== "#SBSever" @800793
== BKELDOR @800794
== "#SBSever" @800795 = @800796
== BKELDOR @800797
== "#SBSever" @800798
EXIT


// BANTERS CERND

CHAIN
IF WEIGHT #-999 ~InParty("Cernd")
                 InParty("#Severian")
                 Global("#SeverTalkCernd","GLOBAL",0)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Cernd",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkCernd1
@800799
DO ~SetGlobal("#SeverTalkCernd","GLOBAL",1)~ 
== BCERND @800800
== "#SBSever" @800801
== BCERND @800802
== "#SBSever" @800803
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Cernd")
                 InParty("#Severian")
                 Global("#SeverTalkCernd","GLOBAL",1)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Cernd",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkCernd2
@800804
DO ~SetGlobal("#SeverTalkCernd","GLOBAL",2)~ 
== BCERND @800805 = @800810
== "#SBSever" @800811
== BCERND @800812 = @800813 = @800814
== "#SBSever" @800815
== BCERND @800816 = @800817
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Cernd")
                 InParty("#Severian")
                 Global("#SeverTalkCernd","GLOBAL",2)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Cernd",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkCernd3
@800825 = @800826
DO ~SetGlobal("#SeverTalkCernd","GLOBAL",3)~ 
== BCERND @800905
== "#SBSever" @800827
== BCERND @800828
== "#SBSever" @800829 = @800830
== BCERND @800831
== "#SBSever" @800832
== BCERND @800833
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Cernd")
                 InParty("#Severian")
                 Global("#SeverTalkCernd","GLOBAL",3)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Cernd",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkCernd4
@800834
DO ~SetGlobal("#SeverTalkCernd","GLOBAL",4)~ 
== BCERND @800835
== "#SBSever" @800836 = @800837
EXIT

// BANTERS MAZZY


CHAIN
IF WEIGHT #-999 ~InParty("Mazzy")
                 InParty("#Severian")
                 Global("#SeverTalkMazzy","GLOBAL",0)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Mazzy",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkMazzy1
@800838
DO ~SetGlobal("#SeverTalkMazzy","GLOBAL",1)~ 
== BMAZZY @800839
== "#SBSever" @800840
== BMAZZY @800841
== "#SBSever" @800842
== BMAZZY @800843
== "#SBSever" @800844
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMazzy","GLOBAL",1)
                 InParty("Mazzy")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Mazzy",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMAZZY SeverTalkMazzy2
@800845
DO ~SetGlobal("#SeverTalkMazzy","GLOBAL",2)~ 
== "#SBSever" @800846
== BMAZZY @800847
== "#SBSever" @800848
== BMAZZY @800849
== "#SBSever" @800850
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMazzy","GLOBAL",2)
                 InParty("Mazzy")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Mazzy",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMAZZY SeverTalkMazzy3
@800851
DO ~SetGlobal("#SeverTalkMazzy","GLOBAL",3)~ 
== "#SBSever" @800852
== BMAZZY @800853
== "#SBSever" @800854
== BMAZZY @800855
== "#SBSever" @800856
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkMazzy","GLOBAL",3)
                 InParty("Mazzy")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Mazzy",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BMAZZY SeverTalkMazzy4
@800857
DO ~SetGlobal("#SeverTalkMazzy","GLOBAL",4)~ 
== "#SBSever" @800858
== BMAZZY @800859
== "#SBSever" @800860
== BMAZZY @800861
== "#SBSever" @800862
EXIT

// BANTERS ANOMEN

CHAIN
IF WEIGHT #-999 ~InParty("Anomen")
                 InParty("#Severian")
                 Global("#SeverTalkAnomen","GLOBAL",0)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Anomen",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkAnomen1
@800863
DO ~SetGlobal("#SeverTalkAnomen","GLOBAL",1)~ 
== BANOMEN @800864
== "#SBSever" @800865
== BANOMEN @800866
== "#SBSever" @800867
== BANOMEN @800868
== "#SBSever" @800869
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAnomen","GLOBAL",1)
                 InParty("Anomen")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Anomen",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BANOMEN SeverTalkAnomen2
@800870
DO ~SetGlobal("#SeverTalkAnomen","GLOBAL",2)~ 
== "#SBSever" @800871
== BANOMEN @800872
== "#SBSever" @800873
== BANOMEN @800874
== "#SBSever" @800875
EXIT

CHAIN
IF WEIGHT #-999 ~Global("#SeverTalkAnomen","GLOBAL",2)
                 InParty("Anomen")
                 InParty("#Severian")
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Anomen",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BANOMEN SeverTalkAnomen3
@800876
DO ~SetGlobal("#SeverTalkAnomen","GLOBAL",3)~ 
== "#SBSever" @800877
== BANOMEN @800878 = @800879
== "#SBSever" @800880
EXIT

CHAIN
IF WEIGHT #-999 ~InParty("Anomen")
                 InParty("#Severian")
                 Global("#SeverTalkAnomen","GLOBAL",3)
                 CombatCounter(0)
                 !See([ENEMY])
                 !StateCheck("Anomen",CD_STATE_NOTVALID)
                 !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN "#SBSever" SeverTalkAnomen4
@800881
DO ~SetGlobal("#SeverTalkAnomen","GLOBAL",4)~ 
== BANOMEN @800882
== "#SBSever" @800883
== BANOMEN @800884
EXIT

