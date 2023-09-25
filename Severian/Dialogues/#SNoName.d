BEGIN ~#SNoName~

IF ~Global("#SHugorCreation","AR0704",2)~ THEN BEGIN PorteDefoncee
  SAY @0
  IF ~~ THEN DO ~SetGlobal("#SHugorCreation","AR0704",3)~ EXIT
END