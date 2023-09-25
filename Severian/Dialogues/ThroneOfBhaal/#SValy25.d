BEGIN ~#SValy25~

// FIN TOB

IF ~Global("#SDernierMiroirAme","GLOBAL",3)~ SequenceFinTob1
SAY @200865 
IF ~~ THEN REPLY @200866 GOTO MalRonge
IF ~~ THEN REPLY @200867 GOTO PlanAstral
IF ~~ THEN REPLY @200868 GOTO Querelleur
END

IF ~~ THEN BEGIN MalRonge
SAY @200871 = @200872
IF ~~ THEN REPLY @200874 GOTO EtresIncomplets1
IF ~~ THEN REPLY @200875 GOTO EtresIncomplets
END

IF ~~ THEN BEGIN PlanAstral
SAY @200870 = @200873
IF ~~ THEN REPLY @200874 GOTO EtresIncomplets1
IF ~~ THEN REPLY @200875 GOTO EtresIncomplets
END

IF ~~ THEN BEGIN Querelleur
SAY @200869 = @200872
IF ~~ THEN REPLY @200874 GOTO EtresIncomplets1
IF ~~ THEN REPLY @200875 GOTO EtresIncomplets
END

IF ~~ THEN BEGIN EtresIncomplets
SAY @200876 = @200877
IF ~~ THEN REPLY @200878 GOTO MalheureusementNon
IF ~~ THEN REPLY @200879 GOTO NombreDocuments
IF ~~ THEN REPLY @200880 GOTO BriserSortilege
END

IF ~~ THEN BEGIN EtresIncomplets1
SAY @200887 = @200877
IF ~~ THEN REPLY @200878 GOTO MalheureusementNon
IF ~~ THEN REPLY @200879 GOTO NombreDocuments
IF ~~ THEN REPLY @200880 GOTO BriserSortilege
END

IF ~~ THEN BEGIN BriserSortilege
SAY @200881 = @200885
IF ~~ THEN REPLY @200888 GOTO SautSpirituel
IF ~~ THEN REPLY @200889 GOTO SautSpirituel
IF ~~ THEN REPLY @200890 GOTO SautSpirituel
END

IF ~~ THEN BEGIN NombreDocuments
SAY @200882 = @200883 = @200885
IF ~~ THEN REPLY @200888 GOTO SautSpirituel
IF ~~ THEN REPLY @200889 GOTO SautSpirituel
IF ~~ THEN REPLY @200890 GOTO SautSpirituel
END


IF ~~ THEN BEGIN SautSpirituel
SAY @200886
IF ~~ THEN DO ~StorePartyLocations()
               StartCutSceneMode()
               StartCutScene("#SCutFi2")~ EXIT
END


IF ~~ THEN BEGIN MalheureusementNon
SAY @200884 = @200885
IF ~~ THEN REPLY @200888 GOTO SautSpirituel
IF ~~ THEN REPLY @200889 GOTO SautSpirituel
IF ~~ THEN REPLY @200890 GOTO SautSpirituel
END



// APRES MORT DE DARKHAN

IF ~OR(2)
   Global("#SDeadSeverian","GLOBAL",1)
   Global("#SDeadDarkhan","GLOBAL",1)~ THEN BEGIN MortDarkhan
SAY @203211
IF ~~ THEN DO ~ClearAllActions()
               StartCutSceneMode()
               StartCutScene("#SCtDar6")~ EXIT
END




