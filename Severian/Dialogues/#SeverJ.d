BEGIN ~#SeverJ~

// Chapitre i - Rappel de la traque d'Ilkar
IF ~Global("#SMekhrenRemind","LOCALS",1)~ THEN BEGIN Rappel
  SAY @100
  IF ~~ THEN DO ~SetGlobalTimer("#SMekhrenTimer","LOCALS",ONE_DAY)
SetGlobal("#SMekhrenRemind","LOCALS",2)~ EXIT
END

// Chapitre i - Rappel ignoré + 24h Severian s'en va
IF ~Global("#SMekhrenRemind","LOCALS",3)~THEN BEGIN PasArmure
  SAY @101
  IF ~~ THEN DO ~SetGlobal("#SeverQuest1","GLOBAL",101)
                 LeaveParty()
                 EscapeArea()~ EXIT   // Severian quitte la party et la zone.
END


// Chapitre I - La Quête de l'Armure à l'Auberge des Cinq Chopes
// Devant l'auberge
IF ~Global("#SeverQuest1","GLOBAL", 1)~ THEN BEGIN NousYSommes
   SAY @64
   IF ~~ THEN DO ~SetGlobal("#SeverQuest1","GLOBAL", 2)~ EXIT
END


// Si Charname refuse de tuer Ilkar
// Ilkar et Isabel quittent la pièce
IF ~Global("#SeverQuest1","GLOBAL", 4)~ THEN BEGIN TresBien
  SAY @91
  IF ~~ THEN DO ~SetGlobal("#SeverQuest1","GLOBAL", 5)
                AddJournalEntry(@71012,QUEST_DONE)~ EXIT
END

// Si Charname tue Ilkar
IF ~Global("#SeverQuest1","GLOBAL", 13)~ THEN BEGIN TresBien
  SAY @71
  IF ~~ THEN DO ~SetGlobal("#SeverQuest1","GLOBAL", 14)
                 AddJournalEntry(@71011,QUEST_DONE)~ EXIT
END


IF ~Global("#SeverQuest1","GLOBAL", 6)~ THEN BEGIN Armoire  // Quand le groupe trouve l'armure de Severian
   SAY @92 = @93
   IF ~~ THEN DO ~SetGlobal("#SeverQuest1","GLOBAL", 100)
                  AddexperienceParty(7500)~ EXIT
END

//Chapitre I - La Quête de l'Armure à l'Auberge des Cinq Chopes
//Au premier étage

IF ~Global("#SeverQuest1","GLOBAL", 2)~ THEN BEGIN CetteChambre  
  SAY @70
  IF ~~ THEN DO ~SetGlobal("#SeverQuest1","GLOBAL", 3)
                 PlaySong(0)
                 PlaySound("#SMusicJ")~ EXIT
END



// A la sortie de l'auberge
// Si Ilkar et Isabel sont morts

IF ~Global("#SeverQuest1","GLOBAL",100)
    Dead("#SMekhr")~ THEN BEGIN Succes
  SAY @75
  IF ~~ THEN REPLY @76 GOTO Projet
  IF ~~ THEN REPLY @77 GOTO SyvaneBenisse
END


// A la sortie de l'auberge
// Si Mekhren et Isabel sont toujours vivants

IF ~Global("#SeverQuest1","GLOBAL",100)
    !Dead("#SMekhr")~ THEN BEGIN Succes
  SAY @85
  IF ~~ THEN REPLY @76 GOTO Projet
  IF ~~ THEN REPLY @77 GOTO SyvaneBenisse
END



// Blocs communs
IF ~~ THEN BEGIN SyvaneBenisse
  SAY @78
  IF ~~ THEN DO ~SetGlobal("#SeverQuest1","GLOBAL",101)
                 LeaveParty()
                 EscapeArea()~ EXIT   // Severian quitte la party et la zone.
END

IF ~~ THEN BEGIN Projet
  SAY @79
  IF ~~ THEN REPLY @80 GOTO MauvaiseIdee
  IF ~~ THEN REPLY @81 GOTO Ami
END

IF ~~ THEN BEGIN MauvaiseIdee
  SAY @82 = @84
  IF ~~ THEN DO ~SetGlobal("#SeverQuest1","GLOBAL",101)
                 RealSetGlobalTimer("#SeverRomance","GLOBAL",300)
                 SetGlobal("#SeverLoveTlk","LOCALS",1)
                 AddJournalEntry(@71013,INFO)~ EXIT
END

IF ~~ THEN BEGIN Ami
  SAY @83 = @84
  IF ~~ THEN DO ~SetGlobal("#SeverQuest1","GLOBAL",101)
                 RealSetGlobalTimer("#SeverRomance","GLOBAL",300)
                 SetGlobal("#SeverLoveTlk","LOCALS",1)
                 AddJournalEntry(@71013,INFO)~ EXIT
END


// ROMANCE PARTIE 3 FINAL
// APRES DEPART DE MALLORY

IF ~Global("#SFinalRomanceSuivantsMailikki","GLOBAL",5)~ THEN BEGIN QueteBhaal
 SAY @900000 = @900001
 IF ~~ THEN DO ~SetGlobal("#SFinalRomanceSuivantsMailikki","GLOBAL",6)~ EXIT                
END

IF ~Global("#SFinalRomanceSuivantsMailikki","GLOBAL",9)~ THEN BEGIN QueteBhaal2
 SAY @900014 = @900015
 IF ~~ THEN REPLY @900016 GOTO OrdresBelle
END

IF ~~ THEN BEGIN OrdresBelle
 SAY @900017 = @900018
 IF ~~ THEN DO ~SetGlobal("#SFinalRomanceSuivantsMailikki","GLOBAL",10)
                SetGlobal("#SClicTalk","GLOBAL",4)
                SetGlobal("#SeverianThroneOfBhaal","GLOBAL",1)
                AddJournalEntry(@900019,INFO)
                SetDialog("#SeverJ")~ EXIT
END

/////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
/////////////////////// OPERATION FLIRTPACK INSIDE !!!! \\\\\\\\\\\\\\\\\\\\\\\\\\\\


// APRES DIALOGUE 1 ROMANCE

// FLIRT 1


IF ~IsGabber(Player1)
    Global("#SClicTalk","GLOBAL",1)
    RandomNum(2,1)
    CombatCounter(0)
    InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEGIN DialClicInitial1
SAY @900030 /*@900030 = ~(Severian vous dévisage des pieds à la tête sans s'en dissimuler, son oeil expert glissant sur vos courbes.)~*/
IF ~RandomNum(2,1)~ THEN REPLY @900031 /*@900031 = ~(Vous souriez.) Je peux savoir ce qui attire ainsi ton attention ?~*/ GOTO ClicAttention1
IF ~RandomNum(2,2)~ THEN REPLY @900031 /*@900031 = ~(Vous souriez.) Je peux savoir ce qui attire ainsi ton attention ?~*/ GOTO ClicAttention2
IF ~RandomNum(2,1)~ THEN REPLY @900032 /*@900032 = ~(Vous accueillez son examen d'un sourire aguicheur.) Alors, mon grand loup, ça te plaît, ce que tu vois ?~*/ GOTO ClicLoup1
IF ~RandomNum(2,2)~ THEN REPLY @900032 /*@900032 = ~(Vous accueillez son examen d'un sourire aguicheur.) Alors, mon grand loup, ça te plaît, ce que tu vois ?~*/ GOTO ClicLoup2
IF ~RandomNum(2,1)~ THEN REPLY @900033 /*@900033 = ~(Lui mettre une claque.) Ose encore et la prochaine baffe t'expédiera en Anauroch, espèce de sale pervers !~*/ GOTO ClicPervers1
IF ~RandomNum(2,2)~ THEN REPLY @900033 /*@900033 = ~(Lui mettre une claque.) Ose encore et la prochaine baffe t'expédiera en Anauroch, espèce de sale pervers !~*/ GOTO ClicPervers2
IF ~RandomNum(2,1)~ THEN REPLY @900034 /*@900034 = ~(Vous l'imitez, les yeux avides .) Miam...~*/ GOTO ClicMiam1
IF ~RandomNum(2,2)~ THEN REPLY @900034 /*@900034 = ~(Vous l'imitez, les yeux avides .) Miam...~*/ GOTO ClicMiam2
IF ~RandomNum(2,1)~ THEN REPLY @900035 /*@900035 = ~(Vous haussez les épaules avec un mépris royal et lui tournez ostensiblement le dos.)~*/ GOTO ClicMepris1
IF ~RandomNum(2,2)~ THEN REPLY @900035 /*@900035 = ~(Vous haussez les épaules avec un mépris royal et lui tournez ostensiblement le dos.)~*/ GOTO ClicMepris2
IF ~RandomNum(3,1)~ THEN REPLY @900037 /*@900037 = ~Tu veux mon portrait en peinture, le mal rasé ?~*/ GOTO ClicPortrait1
IF ~RandomNum(3,2)~ THEN REPLY @900037 /*@900037 = ~Tu veux mon portrait en peinture, le mal rasé ?~*/ GOTO ClicPortrait2
IF ~RandomNum(3,3)~ THEN REPLY @900037 /*@900037 = ~Tu veux mon portrait en peinture, le mal rasé ?~*/ GOTO ClicPortrait3
END

// ATTENTION 1

IF ~~ THEN BEGIN ClicAttention1
SAY @900038 /*@900038 = ~(Severian affiche un sourire énigmatique avant de se détourner pour fumer sa pipe.)~*/
IF ~RandomNum(3,1)~ THEN REPLY @900039 /*@900039 = ~(Vous souriez toujours.) C'est une façon de me répondre, tu trouves ?~*/ GOTO ClicRepondre1
IF ~RandomNum(3,2)~ THEN REPLY @900039 /*@900039 = ~(Vous souriez toujours.) C'est une façon de me répondre, tu trouves ?~*/ GOTO ClicRepondre2
IF ~RandomNum(3,3)~ THEN REPLY @900039 /*@900039 = ~(Vous souriez toujours.) C'est une façon de me répondre, tu trouves ?~*/ GOTO ClicRepondre3
IF ~RandomNum(3,1)~ THEN REPLY @900040 /*@900040 = ~(Vous vous croisez les bras, impatiente.) Essaierais-tu de jouer au plus malin avec moi ?~*/ GOTO ClicMalin1
IF ~RandomNum(3,2)~ THEN REPLY @900040 /*@900040 = ~(Vous vous croisez les bras, impatience.) Essaierais-tu de jouer au plus malin avec moi ?~*/ GOTO ClicMalin2
IF ~RandomNum(3,3)~ THEN REPLY @900040 /*@900040 = ~(Vous vous croisez les bras, impatience.) Essaierais-tu de jouer au plus malin avec moi ?~*/ GOTO ClicMalin3
IF ~RandomNum(2,1)~ THEN REPLY @900041 /*@900041 = ~(Vous posez les mains sur vos hanches, énervée.) Je te préviens, Severian : je déteste que l'on me prenne pour un vulgaire morceau de viande, c'est compris ?~*/ GOTO ClicViande1
IF ~RandomNum(2,2)~ THEN REPLY @900041 /*@900041 = ~(Vous posez les mains sur vos hanches, énervée.) Je te préviens, Severian : je déteste que l'on me prenne pour un vulgaire morceau de viande, c'est compris ?~*/ GOTO ClicViande2
IF ~RandomNum(3,1)~ THEN REPLY @900042 /*@900042 = ~(Vous feignez de bouder.) Des sourires niais, moi aussi je peux en faire...~*/ GOTO ClicNiais1
IF ~RandomNum(3,2)~ THEN REPLY @900042 /*@900042 = ~(Vous feignez de bouder.) Des sourires niais, moi aussi je peux en faire...~*/ GOTO ClicNiais2
IF ~RandomNum(3,3)~ THEN REPLY @900042 /*@900042 = ~(Vous feignez de bouder.) Des sourires niais, moi aussi je peux en faire...~*/ GOTO ClicNiais3
END

IF ~~ THEN BEGIN ClicRepondre1
SAY @900043 /*@900043 = ~(Severian tire sur sa pipe avant de répliquer.) C'est une façon comme une autre, <CHARNAME>. A toi de l'interpréter comme bon te semble, je m'en moque.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRepondre2
SAY @900044 /*@900044 = ~(Severian hausse les épaules, exhalant un nuage de fumée âcre.) Conserve ce beau sourire, et moi je conserverai mes pensées.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRepondre3
SAY @900045 /*@900045 = ~(Severian sourit derechef.) Ta naïveté est touchante, <CHARNAME>.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMalin1
SAY @900046 /*@900046 = ~(Severian exhale un nuage de fumée âcre.) Allons bon, si on ne peut plus faire ce qu'on veut...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMalin2
SAY @900047 /*@900047 = ~(Severian vous toise effrontément sous ses mèches brunes.) Je "n'essaie" pas, <CHARNAME>.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMalin3
SAY @900048 /*@900048 = ~(Severian se fait goguenard.) Je suis malin, tu t'en apercevras vite, ma chère.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicViande1
SAY @900049 /*@900049 = ~(Severian ouvre de grands yeux.) Ce voyage va vite devenir rasoir si je ne peux pas poser mes yeux là où je veux...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicViande2
SAY @900050 /*@900050 = ~(Severian se passe une main derrière la nuque, nez vers le ciel.) Tu devrais plutôt te sentir flattée qu'un homme t'admire mais puisque tu le prends comme ça...~*/
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN ClicNiais1
SAY @900051 /*@900051 = ~(Severian lève un sourcil, taquin.) Et c'est réussi : même un idiot de troll ne voudrait pas de ta compagnie !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicNiais2
SAY @900052 /*@900052 = ~(Severian se montre perplexe.) Tu n'as jamais pensé à postuler au cirque de la Promenade de Waukyne, <CHARNAME> ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicNiais3
SAY @900053 /*@900053 = ~(Severian croque dans une pomme, guilleret.) Si admirer une femme signifie écoper d'un sourire niais, alors je l'accepte avec plaisir !~*/
IF ~~ THEN EXIT
END

// ATTENTION 2

IF ~~ THEN BEGIN ClicAttention2
SAY @900054 /*@900054 = ~Je me demandais simplement ce qui pouvait bien me pousser à suivre le commandement d'une femme, aussi belle soit-elle.~*/
IF ~RandomNum(2,1)~ THEN REPLY @900055 /*@900055 = ~(Vous haussez un sourcil.) Et je peux savoir en quoi cela te froisse-t-il ?~*/ GOTO ClicFroisser1
IF ~RandomNum(2,2)~ THEN REPLY @900055 /*@900055 = ~(Vous haussez un sourcil.) Et je peux savoir en quoi cela te froisse-t-il ?~*/ GOTO ClicFroisser2
IF ~RandomNum(3,1)~ THEN REPLY @900056 /*@900056 = ~(Vous prenez un ton sarcastique.) Ta virilité s'en trouverait-elle insultée, Severian ?~*/ GOTO ClicVirilite1
IF ~RandomNum(3,2)~ THEN REPLY @900056 /*@900056 = ~(Vous prenez un ton sarcastique.) Ta virilité s'en trouverait-elle insultée, Severian ?~*/ GOTO ClicVirilite2
IF ~RandomNum(3,3)~ THEN REPLY @900056 /*@900056 = ~(Vous prenez un ton sarcastique.) Ta virilité s'en trouverait-elle insultée, Severian ?~*/ GOTO ClicVirilite3
IF ~RandomNum(3,1)~ THEN REPLY @900057 /*@900057 = ~(Vous prenez un ton furieux.) Voilà bien ma veine ! Je suis tombée sur un macho !~*/ GOTO ClicMacho1
IF ~RandomNum(3,2)~ THEN REPLY @900057 /*@900057 = ~(Vous prenez un ton furieux.) Voilà bien ma veine ! Je suis tombée sur un macho !~*/ GOTO ClicMacho2
IF ~RandomNum(3,3)~ THEN REPLY @900057 /*@900057 = ~(Vous prenez un ton furieux.) Voilà bien ma veine ! Je suis tombée sur un macho ! ~*/ GOTO ClicMacho3
END

IF ~~ THEN BEGIN ClicFroisser1
SAY @900058 /*@900058 = ~(Severian exhibe sa pipe pour en bourrer le fourneau. Il en exhale une fumée blanche et piquante.) J'ai plus l'habitude de mettre les femmes dans mon lit plutôt que de suivre leurs ordres, voilà tout.~*/
IF ~RandomNum(3,1)~ THEN REPLY @900059 /*@900059 = ~ça, c'est vraiment la meilleure. Avec ton allure débraillée et tes mauvaises manières, quelle femme pourrait bien vouloir de toi, dis-moi ? ~*/ GOTO ClicFrime1
IF ~RandomNum(3,2)~ THEN REPLY @900059 /*@900059 = ~ça, c'est vraiment la meilleure. Avec ton allure débraillée et tes mauvaises manières, quelle femme pourrait bien vouloir de toi, dis-moi ? ~*/ GOTO ClicFrime2
IF ~RandomNum(3,3)~ THEN REPLY @900059 /*@900059 = ~ça, c'est vraiment la meilleure. Avec ton allure débraillée et tes mauvaises manières, quelle femme pourrait bien vouloir de toi, dis-moi ? ~*/ GOTO ClicFrime3
IF ~RandomNum(3,1)~ THEN REPLY @900060 /*@900060 = ~Désolée mais je ne serai pas de celles-là, si c'est ce que tu insinues.~*/ GOTO ClicInsinuer1
IF ~RandomNum(3,2)~ THEN REPLY @900060 /*@900060 = ~Désolée mais je ne serai pas de celles-là, si c'est ce que tu insinues.~*/ GOTO ClicInsinuer2
IF ~RandomNum(3,3)~ THEN REPLY @900060 /*@900060 = ~Désolée mais je ne serai pas de celles-là, si c'est ce que tu insinues.~*/ GOTO ClicInsinuer3
IF ~RandomNum(3,1)~ THEN REPLY @900061 /*@900061 = ~Maintenant que tu le dis, je peux bien le dire aussi : tu es terriblement séduisant, Severian.~*/ GOTO ClicSeduisant1
IF ~RandomNum(3,2)~ THEN REPLY @900061 /*@900061 = ~Maintenant que tu le dis, je peux bien le dire aussi : tu es terriblement séduisant, Severian.~*/ GOTO ClicSeduisant2
IF ~RandomNum(3,3)~ THEN REPLY @900061 /*@900061 = ~Maintenant que tu le dis, je peux bien le dire aussi : tu es terriblement séduisant, Severian.~*/ GOTO ClicSeduisant3
END

IF ~~ THEN BEGIN ClicFrime1
SAY @900062 /*@900062 = ~(Le jeune homme vous toise, sourire aux lèvres.) Et pourtant, ne crois pas que je n'ai pas remarqué tes oeillades, <CHARNAME>.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicFrime2
SAY @900063 /*@900063 = ~(Le jeune homme hausse les épaules.) Si tu n'es pas sensible à mon charme, <CHARNAME>, c'est que tu n'as aucun goût, voilà tout. Tu raterais quelque chose, crois-moi.~*/
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN ClicFrime3
SAY @900064 /*@900064 = ~(Le jeune homme hausse les épaules, vantard.) Peut-être changeras-tu de discours lorsque tu auras vu à quel point les femmes sont folles de moi !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicInsinuer1
SAY @900065 /*@900065 = ~(Le jeune homme hausse les épaules.) Bah, je ne songeais pas à cela. Tu te montes la tête toute seule, ma belle.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicInsinuer2
SAY @900066 /*@900066 = ~(Le jeune homme sourit, taquin.) Même si nous le voulions, ce n'est pas le moment pour la bagatelle.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicInsinuer3
SAY @900067 /*@900067 = ~(Le jeune homme lève les mains en signe de protestation.) Héla ! Ne va pas me faire dire ce que je n'ai pas dit, ni même pensé, hein ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSeduisant1
SAY @900068 /*@900068 = ~(Le jeune homme affiche une expression taquine.) Désolé <CHARNAME>, mais tu devras attendre un peu pour la bagatelle. Il me semble que nous avons un magicien à retrouver, non ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSeduisant2
SAY @900069 /*@900069 = ~(L'halfshade dégaine ses lames, fanfaron.) Et le meilleur bretteur de ce côté-ci de Féerune, ma belle. Te voilà en compagnie d'un homme fort et courageux. Excitant, non ?~*/
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN ClicSeduisant3
SAY @900070 /*@900070 = ~(Severian s'approche de vous pour sentir votre parfum. Ses yeux gris plongent dans les vôtres un instant tandis qu'un sourire juvénile éclôt sur ses lèvres. Il finit par se détourner.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicVirilite1
SAY @900071 /*@900071 = ~(Severian rabat sa capuche, maussade.) J'aurais tendance à dire que les armes sont métier d'homme mais il semble que tu bénéficies malgré tout d'une certaine aura dûe à ton sang divin.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicVirilite2
SAY @900072 /*@900072 = ~(Le jeune homme rit, acerbe.) Le jour où tu me l'auras ôté, le monde aura cessé de tourner, <CHARNAME>.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicVirilite3
SAY @900073 /*@900073 = ~(L'halfshade se fend d'un sourire.) Je ne connais que deux sortes de virilité, <CHARNAME> : au lit et dans le combat. Et tu ne me verras jamais reculer ni devant l'un ni devant l'autre.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMacho1
SAY @900074 /*@900074 = ~C'est une expérience nouvelle pour moi, <CHARNAME>. Jusqu'à présent, je ne suis jamais resté suffisamment dans un groupe pour m'accommoder des ordres, et qui plus est, d'une femme. Il me tarde de voir ce dont tu es capable, voilà tout.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMacho2
SAY @900075 /*@900075 = ~(Severian fronce les sourcils.) Allons bon, tout de suite les grands mots ! Vu comment tu t'emportes aussi facilement devant mes taquineries, je crois que nous n'avons pas fini de nous faire des ennemis.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMacho3
SAY @900076 /*@900076 = ~(Severian hausse les épaules.) La plupart des femmes que j'ai côtoyées n'allaient pas l'épée au côté, <CHARNAME>. Elles préféraient les froufrous et la soie calishite. ça suffit pour ma défense ?~*/
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN ClicFroisser2
SAY @900077 /*@900077 = ~Avoue que d'ordinaire, c'est plutôt à l'homme de jouer les protecteurs. J'ai hâte de te voir hurler lorsque tu te seras cassé un ongle.~*/
IF ~RandomNum(1,1)~ THEN REPLY @900078 /*@900078 = ~Et moi, j'ai hâte de voir ta tête quand tu t'apercevras que je suis aussi capable qu'un homme.~*/ GOTO ClicMie
IF ~RandomNum(2,1)~ THEN REPLY @900079 /*@900079 = ~Alors, c'est comme ça ? Mais je t'en prie, prends donc la tête du groupe ! Voyons si Môssieur Severian saura mieux se débrouiller ! ~*/ GOTO ClicGroupe1
IF ~RandomNum(2,2)~ THEN REPLY @900079 /*@900079 = ~Alors, c'est comme ça ? Mais je t'en prie, prends donc la tête du groupe ! Voyons si Môssieur Severian saura mieux se débrouiller ! ~*/ GOTO ClicGroupe2
IF ~RandomNum(2,1)~ THEN REPLY @900080 /*@900080 = ~Oh bien, je serai ravie d'éveiller tes instincts protecteurs, Severian, si c'est cela que tu insinues.~*/ GOTO ClicProtecteur1
IF ~RandomNum(2,2)~ THEN REPLY @900080 /*@900080 = ~Oh bien, je serai ravie d'éveiller tes instincts protecteurs, Severian, si c'est cela que tu insinues.~*/ GOTO ClicProtecteur2
END

IF ~~ THEN BEGIN ClicMie
SAY @900081 /*@900081 = ~(Severian repousse une mèche brune de son front, souriant.) Je sens que voyager à tes côtés aura tout de la grande aventure, ma belle.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicGroupe1
SAY @900082 /*@900082 = ~(Severian ronchonne.) Je n'ai pas la moindre envie de prendre la tête de ton équipe de bras cassés, <CHARNAME>. Laisse-moi à ma pipe et mes épées et je serai un homme heureux.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicGroupe2
SAY @900083 /*@900083 = ~Euh...Tout bien réfléchi, <CHARNAME>, je retire ce que j'ai dit. Allez, passe devant...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicProtecteur1
SAY @900084 /*@900084 = ~(Le jeune homme vous considère d'un air intéressé, avant d'envoyer rouler une pierre d'un coup de pied, badin.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicProtecteur2
SAY @900085 /*@900085 = ~(L'halfshade vous considère, exagérément sérieux.) ça ne serait pas une tâche de tout repos que de te protéger, si tu mon avis. Tu sembles attirer fatalement à toi tous les cinglés qui peuplent ce monde...~*/
IF ~~ THEN EXIT
END

// ClicLoup1

IF ~~ THEN BEGIN ClicLoup1
SAY @900086 /*@900086 = ~Prétendre le contraire serait mentir. Tu es vraiment une très belle femme, <CHARNAME>. Et je doute que je sois le premier à te dire ça.~*/
IF ~RandomNum(3,1)~ THEN REPLY @900087 /*@900087 = ~(Vous rougissez.) Euh...Tu sais, je plaisantais. Pourquoi me dis-tu tout cela ?~*/ GOTO ClicRougir1
IF ~RandomNum(3,2)~ THEN REPLY @900087 /*@900087 = ~(Vous rougissez.) Euh...Tu sais, je plaisantais. Pourquoi me dis-tu tout cela ?~*/ GOTO ClicRougir2
IF ~RandomNum(3,3)~ THEN REPLY @900087 /*@900087 = ~(Vous rougissez.) Euh...Tu sais, je plaisantais. Pourquoi me dis-tu tout cela ?~*/ GOTO ClicRougir3
IF ~RandomNum(2,1)~ THEN REPLY @900093 /*@900093 = ~(Vous vous recoiffez, sûre de vous.) Puisque je te plaîs tant que ça, que dirais-tu de louer une chambre d'auberge pour y passer un peu de bon temps ?~*/ GOTO ClicAuberge1
IF ~RandomNum(2,2)~ THEN REPLY @900093 /*@900093 = ~(Vous vous recoiffez, sûre de vous.) Puisque je te plaîs tant que ça, que dirais-tu de louer une chambre d'auberge pour y passer un peu de bon temps ?~*/ GOTO ClicAuberge2
IF ~RandomNum(2,1)~ THEN REPLY @900096 /*@900096 = ~Tu te trompes, Severian. Tu es bien le premier à me dire de tels compliments.~*/ GOTO ClicCompliments1
IF ~RandomNum(2,2)~ THEN REPLY @900096 /*@900096 = ~Tu te trompes, Severian. Tu es bien le premier à me dire de tels compliments.~*/ GOTO ClicCompliments2
END

IF ~~ THEN BEGIN ClicRougir1
SAY @900090 /*@900090 = ~Tu sais, <CHARNAME>, j'ai peut-être passé une partie de ma vie dans le vice et la déraison, mais je sais aussi être franc. Et j'avais envie de te le démontrer.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRougir2
SAY @900091 /*@900091 = ~Et pourquoi ne te le dirais-je pas ? Ce que je vois me plaît, alors je l'exprime.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRougir3
SAY @900092 /*@900092 = ~(Severian hausse un sourcil.) Tu rougis ? Je n'aurais pas cru être le premier à te dire ça, pourtant.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAuberge1
SAY @900094 /*@900094 = ~(Severian allume sa pipe pour vous observer, scrutateur.) J'en dis que si nous avions un peu plus de temps devant nous, peut-être accepterai-je ton invitation.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAuberge2
SAY @900095 /*@900095 = ~(Le jeune homme vous adresse un clin d'oeil.) Je crois que je ne suis pas au bout de mes surprises avec toi, ma belle.~*/
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN ClicCompliments1
SAY @900097 /*@900097 = ~Dans ce cas, les hommes que tu as fréquentés sont soit des imbéciles, soit des aveugles.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCompliments2
SAY @900098 /*@900098 = ~(Le hors-la-loi soupire d'incrédulité.) Et il a fallu que je débarque dans ta vie pour réparer ce manquement.~*/
IF ~~ THEN EXIT
END

// ClicLoup2

IF ~~ THEN BEGIN ClicLoup2
SAY @900099 /*@900099 = ~(Le jeune homme ne perd rien de son aplomb.) Tu te comportes toujours ainsi avec les hommes, <CHARNAME> ?~*/
IF ~RandomNum(2,1)~ THEN REPLY @900100 /*@900100 = ~(Vous pouffez de rire.) Ah, ce n'était qu'une plaisanterie. Si tu avais vu ta tête, Severian !~*/ GOTO ClicTete1
IF ~RandomNum(2,2)~ THEN REPLY @900100 /*@900100 = ~(Vous pouffez de rire.) Ah, ce n'était qu'une plaisanterie. Si tu avais vu ta tête, Severian !~*/ GOTO ClicTete2
IF ~RandomNum(3,1)~ THEN REPLY @900101 /*@900101 = ~Je rentre dans ton jeu, Severian. Si tu veux tout savoir, tu ne m'attires absolument pas.~*/ GOTO ClicAttirer1
IF ~RandomNum(3,2)~ THEN REPLY @900101 /*@900101 = ~Je rentre dans ton jeu, Severian. Si tu veux tout savoir, tu ne m'attires absolument pas.~*/ GOTO ClicAttirer2
IF ~RandomNum(3,3)~ THEN REPLY @900101 /*@900101 = ~Je rentre dans ton jeu, Severian. Si tu veux tout savoir, tu ne m'attires absolument pas.~*/ GOTO ClicAttirer3
IF ~RandomNum(2,1)~ THEN REPLY @900495 /*@900495 = ~Comment ? Un séducteur tel que toi se trouverait donc troublé ?~*/ GOTO ClicSeducteur1
IF ~RandomNum(2,2)~ THEN REPLY @900495 /*@900495 = ~Comment ? Un séducteur tel que toi se trouverait donc troublé ?~*/ GOTO ClicSeducteur2
END

IF ~~ THEN BEGIN ClicTete1
SAY @900102 /*@900102 = ~(Le jeune homme fait une grimace.) Moque-toi, tu ne perds rien pour attendre !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTete2
SAY @900103 /*@900103 = ~(Le jeune homme fait une grimace.) Ta gaieté est vraiment communicative, <CHARNAME>.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAttirer1
SAY @900104 /*@900104 = ~(Le jeune homme hausse les épaules.) Et c'est réciproque, <CHARNAME>. Je voulais simplement tester tes réactions.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAttirer2
SAY @900105 /*@900105 = ~(Severian secoue la tête, taquin.) Peut-être changeras-tu d'avis. Tu es une femme, après tout.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAttirer3
SAY @900106 /*@900106 = ~(Le jeune sourit, fanfaron.) Tu devrais t'entraîner à mentir plus souvent, <CHARNAME>. ça augmenterait ta crédibilité !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSeducteur1
SAY @900107 /*@900107 = ~(Severian boute le feu à sa pipe, nerveux.) Oublie-moi, <CHARNAME>. Laisse-moi fumer ma pipe en paix et va jouer ailleurs.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSeducteur2
SAY @900108 /*@900108 = ~(Severian soupire, son souffle soulevant comiquement une mèche de cheveux collée à son front.) J'en ai vu d'autres, ma jolie. Et c'était autre chose que tes minauderies.~*/
IF ~~ THEN EXIT
END

// ClicPervers1

IF ~~ THEN BEGIN ClicPervers1
SAY @900109 /*@900109 = ~(Severian n'a pas assez de recul pour éviter votre main. Cette dernière fait un bruit retentissant sur sa joue, y laissant une cuisante marque rouge.) Eh ! Mais quelle mouche t'a piqué, <CHARNAME> ? Ma parole, une vraie furie !~*/
IF ~RandomNum(3,1)~ THEN REPLY @900110 /*@900110 = ~Excuse-moi mais quand on me dévisage comme un vulgaire morceau de viande, forcément ça me met hors de moi ! Je suis une Enfant de Bhaal, n'oublie jamais ça, compris ?~*/ GOTO ClicMeriter1
IF ~RandomNum(3,2)~ THEN REPLY @900110 /*@900110 = ~Excuse-moi mais quand on me dévisage comme un vulgaire morceau de viande, forcément ça me met hors de moi ! Je suis une Enfant de Bhaal, n'oublie jamais ça, compris ?~*/ GOTO ClicMeriter2
IF ~RandomNum(3,3)~ THEN REPLY @900110 /*@900110 = ~Excuse-moi mais quand on me dévisage comme un vulgaire morceau de viande, forcément ça me met hors de moi ! Je suis une Enfant de Bhaal, n'oublie jamais ça, compris ?~*/ GOTO ClicMeriter3
IF ~RandomNum(2,1)~ THEN REPLY @900111 /*@900111 = ~Je suis désolée : parfois, je m'emporte pour un rien. Avoue quand même que ta façon de me regarder était plus que déplacée.~*/ GOTO ClicDeplacee1
IF ~RandomNum(2,2)~ THEN REPLY @900111 /*@900111 = ~Je suis désolée : parfois, je m'emporte pour un rien. Avoue quand même que ta façon de me regarder était plus que déplacée.~*/ GOTO ClicDeplacee2
IF ~RandomNum(2,1)~ THEN REPLY @900112 /*@900112 = ~Je ne sais pas à quoi tu pensais exactement et je ne veux pas le savoir. Ne recommence plus, d'accord ?~*/ GOTO ClicRecommencer1
IF ~RandomNum(2,2)~ THEN REPLY @900112 /*@900112 = ~Je ne sais pas à quoi tu pensais exactement et je ne veux pas le savoir. Ne recommence plus, d'accord ?~*/ GOTO ClicRecommencer2
END

IF ~~ THEN BEGIN ClicMeriter1
SAY @900113 /*@900113 = ~(Le jeune homme se frotte la joue avant d'éclater de rire.) Quel dragon ! Voilà donc à quoi ressemble une claque d'une Enfant de Bhaal. Je te souhaite de corriger aussi sévèrement tes ennemis que tes alliés, ma belle !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMeriter2
SAY @900114 /*@900114 = ~(Le jeune homme se frotte la joue, maussade.) Ah ça, tu peux être sûre que je ne risque pas de l'oublier : tu as failli me déboiter la mâchoire...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMeriter3
SAY @900115 /*@900115 = ~(Le jeune homme se frotte la joue, badin.) Bah, ce n'est pas la première claque que je reçois de la part de furies. Mais je prends note de ton avertissement : je tiens à mes dents.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDeplacee1
SAY @900116 /*@900116 = ~(Le jeune homme se frotte la joue, moqueur.) un baiser de ta part apaiserait sûrement cette brûlure. (L'halfshade vous regarde en coin, dans l'attente d'une seconde claque.) Mais je crois que j'en ai assez fait pour aujourd'hui.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDeplacee2
SAY @900117 /*@900117 = ~(Le jeune homme se frotte la joue, de mauvaise humeur.) Parce que tu crois que tu es la première à me mettre des claques ? Bah, j'ai l'habitude.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRecommencer1
SAY @900118 /*@900118 = ~(Le jeune homme se frotte la joue, malicieux.) A rien de spécial, <CHARNAME>. Qu'est-ce que ton esprit tordu va donc imaginer ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRecommencer2
SAY @900119 /*@900119 = ~(Le jeune homme se frotte la joue, encore sonné.) Parce que tu crois que tu es la première à me mettre des claques ? Bah, j'ai l'habitude et celle-là n'est pas plus violente que les autres.~*/
IF ~~ THEN EXIT
END

// ClicPervers2

IF ~~ THEN BEGIN ClicPervers2
SAY @900120 /*@900120 = ~(Severian parvient à aggriper de justesse votre main avant que celle-ci ne rencontre violemment sa joue. Il se met à rire.) Hola, tout doux, ma jolie ! De quel crime me suis-je donc rendu coupable pour mériter ça ?~*/
IF ~RandomNum(2,1)~ THEN REPLY @900121 /*@900121 = ~Excuse-moi mais quand on me dévisage comme un vulgaire morceau de viande, forcément ça me met hors de moi...Mais lâche ma main, à la fin !~*/ GOTO ClicLacher1
IF ~RandomNum(2,2)~ THEN REPLY @900121 /*@900121 = ~Excuse-moi mais quand on me dévisage comme un vulgaire morceau de viande, forcément ça me met hors de moi...Mais lâche ma main, à la fin !~*/ GOTO ClicLacher2
IF ~RandomNum(2,1)~ THEN REPLY @900122 /*@900122 = ~(Vous observez la main gantée de Severian, retenant obstinément la vôtre au niveau du poignet. Vous ne cachez pas votre trouble.) ~*/ GOTO ClicTrouble1
IF ~RandomNum(2,2)~ THEN REPLY @900122 /*@900122 = ~(Vous observez la main gantée de Severian, retenant obstinément la vôtre au niveau du poignet. Vous ne cachez pas votre trouble.).~*/ GOTO ClicTrouble2
IF ~RandomNum(2,1)~ THEN REPLY @900123 /*@900123 = ~Bon, excuse-moi. Mais tu es agaçant, à la fin. Euh, tu veux bien lâcher ma main, maintenant ?~*/ GOTO ClicAgacant1
IF ~RandomNum(2,2)~ THEN REPLY @900123 /*@900123 = ~Bon, excuse-moi. Mais tu es agaçant à la fin. Euh, tu veux bien lâcher ma main, maintenant ?~*/ GOTO ClicAgacant2
END


IF ~~ THEN BEGIN ClicAgacant1
SAY @900124 /*@900124 = ~(Severian considère votre main comme s'il la voyait pour la première fois. Son assurance devient gêne.) Ah euh, oui, excuse-moi, <CHARNAME>.~*/
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN ClicAgacant2
SAY @900125 /*@900125 = ~(Severian considère votre main comme s'il la voyait pour la première fois. Son assurance devient gêne.) Naturellement. Euh, j'ai à faire par là-bas. Excuse-moi donc.~*/
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN ClicTrouble1
SAY @900126 /*@900126 = ~(Les doigts du hors-la-loi défont comme à regret leur emprise, tandis que ses yeux persistent à fixer les vôtres, de façon intense.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTrouble2
SAY @900127 /*@900127 = ~(Les doigts du hors-la-loi raffermissent leur emprise tandis que ses yeux persistent à fixer les vôtres, de façon grave.) Tu es une femme surprenante, <CHARNAME>. J'aime ton tempérament.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicLacher1
SAY @900128 /*@900128 = ~(Les doigts du hors-la-loi raffermissent leur emprise, avant de libérer finalement votre main. Il vous toise effrontément.) Quelque chose me dit que lorsque tu s'est fourré quelque chose en tête, rien ne peut t'en faire démordre. Alors si tu aimes penser ça, ce n'est à vrai dire pas mon problème, hein?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicLacher2
SAY @900129 /*@900129 = ~(Severian lâche votre main et hausse les épaules.) Eh, que vas-tu imaginer encore ? Mais tu ferais mieux de changer de ton avec moi, <CHARNAME>. Je ne suis pas un gentil petit toutou à qui tu pourrais poser une laisse.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMiam1
SAY @900130 /*@900130 = ~(Severian se met à rire tout en boutant le feu à sa pipe.) Je vois que tu as de l'humour, <CHARNAME>. Une autre femme aurait pu s'en offusquer.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMiam2
SAY @900131 /*@900131 = ~(Severian vous dévisage, interloqué. Il ne s'attend visiblement pas à cette réaction de votre part. Il fait mine de se gratter la tête.)~*/
IF ~RandomNum(2,1)~ THEN REPLY @900132 /*@900132 = ~Ah ah ! Tu verrais ta tête, Severian ! Je t'ai bien eu, hein ?~*/ GOTO ClicBlague1
IF ~RandomNum(2,2)~ THEN REPLY @900132 /*@900132 = ~Ah ah ! Tu verrais ta tête, Severian ! Je t'ai bien eu, hein ?~*/ GOTO ClicBlague2
IF ~RandomNum(2,1)~ THEN REPLY @900133 /*@900133 = ~(Vous vous approchez du jeune homme pour vous placer contre lui.) Quand on me cherche, on me trouve, mon beau.~*/ GOTO ClicBeau1
IF ~RandomNum(2,2)~ THEN REPLY @900133 /*@900133 = ~(Vous vous approchez du jeune homme pour vous placer contre lui.) Quand on me cherche, on me trouve, mon beau.~*/ GOTO ClicBeau2
END

IF ~~ THEN BEGIN ClicBlague1
SAY @900134 /*@900134 = ~(Severian hausse les épaules, goguenard.) Oh, tu peux te moquer. Vas-y, moque-toi tant que tu veux. Mais je parierai mes bottes que cette comédie n'est pas totalement feinte.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicBlague2
SAY @900135 /*@900135 = ~(Le jeune homme fronce les sourcils, faussement vexé.) Dommage, moi qui pensais que mon corps d'athlète te faisait rêver...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicBeau1
SAY @900136 /*@900136 = ~(Le hors-la-loi vous considère, une lueur d'enthousiasme dans les yeux. Il finit par prendre votre main pour y déposer un furtif baiser galant avant de s'éloigner.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicBeau2
SAY @900137 /*@900137 = ~(Le jeune homme déploie des trésors de maîtrise pour garder contenance alors que votre contact l'effleure. Il se contente de baisser les yeux vers votre poitrine avant que vous ne vous détourniez. Vous sentez son regard suivre votre marche bien après l'avoir quitté.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMepris1
SAY @900138 /*@900138 = ~(Severian hausse les épaules, se rabattant sur sa pipe pour se donner une contenance. Vous l'avez vexé, malgré ses dénégations.) Il faudrait plus que du mépris pour me décourager, ma jolie.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMepris2
SAY @900139 /*@900139 = ~(Severian sort son couteau de chasse pour le faire pirouetter en l'air, manifestement mal à l'aise.) Mon attitude ne te plaît guère. Fort bien, je m'en accommoderai.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPortrait1
SAY @900140 /*@900140 = ~(Severian sort son couteau de chasse pour le faire pirouetter en l'air, hilare.) Alors, c'est comme ça ? Un seul regard suffit à te mettre en rogne aujourd'hui ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPortrait2
SAY @900141 /*@900141 = ~(Severian passe une main sur sa mâchoire pour mieux examiner sa barbe de trois jours à laquelle vous faites allusion. Son ton est persifleur.) Peut-être que si nous avions davantage l'occasion de dormir dans des auberges plutôt qu'à la belle étoile, je pourrais pourfendre décemment ces quelques poils qui te font tant horreur.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPortrait3
SAY @900142 /*@900142 = ~(Severian sourit, persifleur.) "Mal rasé" ? Mais ma chère, c'est un des attributs de la virilité...~*/
IF ~~ THEN EXIT
END

// FLIRT 2

IF ~IsGabber(Player1)
    Global("#SClicTalk","GLOBAL",1)
    RandomNum(2,2)
    CombatCounter(0)
    InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEGIN DialClicInitial2
SAY @900143 /*@900143 = ~(Severian fume paisiblement, ses mèches brunes balançant doucement devant son front. Il vous sourit, dans l'expectative.)~*/
IF ~RandomNum(1,1)~ THEN REPLY @900144 /*@900144 = ~Pourrais-tu me parler un peu de Tiraslyn, Severian ?~*/ GOTO ClicTiraslyn
IF ~RandomNum(1,1)~ THEN REPLY @900145 /*@900145 = ~Je dois bien avouer que je n'avais jamais rencontré d'halfshade auparavant. Accepterais-tu de m'en dire plus à ce sujet ?~*/ GOTO ClicHalfshade
IF ~RandomNum(1,1)~ THEN REPLY @900147 /*@900147 = ~La voie que j'ai choisie est périlleuse, Severian. Il y a des chances pour que nous y laissions la vie. Es-tu toujours sûr de vouloir m'accompagner ?~*/ GOTO ClicVie
IF ~RandomNum(1,1)~ THEN REPLY @900148 /*@900148 = ~Alors comme ça, tu étais de ceux qui pillaient les convois de marchandises sur les routes de Féerune, c'est bien ça ? Qu'est-ce qui a bien pu t'amener dans cette voie, Severian ?~*/ GOTO ClicBrigand
IF ~RandomNum(1,1)~ THEN REPLY @900154 /*@900154 = ~La très grande majorité des rôdeurs de ce monde a foi en une divinité tutélaire. Alors, comment se fait-il que toi-même ne possède aucune croyance d'aucune sorte ?~*/ GOTO ClicSyvane
IF ~RandomNum(3,1)~ THEN REPLY @900149 /*@900149 = ~Tu sembles heureux, Severian. A quoi penses-tu ?~*/ GOTO ClicHeureux1
IF ~RandomNum(3,2)~ THEN REPLY @900149 /*@900149 = ~Tu sembles heureux, Severian. A quoi penses-tu ?~*/ GOTO ClicHeureux2
IF ~RandomNum(3,3)~ THEN REPLY @900149 /*@900149 = ~Tu sembles heureux, Severian. A quoi penses-tu ?~*/ GOTO ClicHeureux3
IF ~RandomNum(3,1)~ THEN REPLY @900150 /*@900150 = ~(Vous adressez un clin d'oeil à Severian.)~*/ GOTO ClicClinOeil1
IF ~RandomNum(3,2)~ THEN REPLY @900150 /*@900150 = ~(Vous adressez un clin d'oeil à Severian.)~*/ GOTO ClicClinOeil2
IF ~RandomNum(3,3)~ THEN REPLY @900150 /*@900150 = ~(Vous adressez un clin d'oeil à Severian.)~*/ GOTO ClicClinOeil3
IF ~RandomNum(3,1)~ THEN REPLY @900151 /*@900151 = ~(Vous avisez sa pipe.) Dis-moi, tu permets que j'essaie ?~*/ GOTO ClicPipe1
IF ~RandomNum(3,1)~ THEN REPLY @900152 /*@900152 = ~Je me sens un peu rouillée. Que dirais-tu d'échanger quelques passes d'armes amicales ? Histoire de me montrer ce que tu sais faire...~*/ GOTO ClicPasse1
IF ~RandomNum(3,2)~ THEN REPLY @900152 /*@900152 = ~Je me sens un peu rouillée. Que dirais-tu d'échanger quelques passes d'armes amicales ? Histoire de me montrer ce que tu sais faire...~*/ GOTO ClicPasse2
IF ~RandomNum(3,3)~ THEN REPLY @900152 /*@900152 = ~Je me sens un peu rouillée. Que dirais-tu d'échanger quelques passes d'armes amicales ? Histoire de me montrer ce que tu sais faire...~*/ GOTO ClicPasse3
IF ~RandomNum(3,1)~ THEN REPLY @900153 /*@900153 = ~(Vous arrangez soigneusement votre chevelure.)~*/ GOTO ClicChevelure1
IF ~RandomNum(3,2)~ THEN REPLY @900153 /*@900153 = ~(Vous arrangez soigneusement votre chevelure.)~*/ GOTO ClicChevelure2
IF ~RandomNum(3,3)~ THEN REPLY @900153 /*@900153 = ~(Vous arrangez soigneusement votre chevelure.)~*/ GOTO ClicChevelure3
IF ~~ THEN REPLY @900168 /*@900168 = ~Et si tu me parlais un peu de tes conquêtes amoureuses, Severian ?~*/ GOTO ClicConquete
END

IF ~~ THEN BEGIN ClicTiraslyn
SAY @900155 /*@900155 = ~(Severian adopte un air prudent.) Tiraslyn ? Ma foi, mon ancienne patrie ne me manque pas au point que je souhaite disserter là-dessus mais soit, je vais satisfaire ta curiosité. Que voudrais-tu savoir en particulier ?~*/
IF ~~ THEN REPLY @900156 /*@900156 = ~Parle-moi des êtres qui la peuplent ?~*/ GOTO ClicPeuple
IF ~~ THEN REPLY @900157 /*@900157 = ~J'aimerais en savoir plus sur l'endroit où tu es né ?~*/ GOTO ClicPaysages
IF ~~ THEN REPLY @900158 /*@900158 = ~Qu'en est-il de vos dieux ? Sont-ils semblables à ceux de Toril ?~*/ GOTO ClicDieux
IF ~~ THEN REPLY @900159 /*@900159 = ~Pourquoi as-tu quitté ton plan, Severian ?~*/ GOTO ClicQuitter
IF ~~ THEN REPLY @900160 /*@900160 = ~Te reste-t-il de la famille là-bas, des êtres chers pour lesquels tu aurais toujours une pensée ?~*/ GOTO ClicFamille
END

IF ~~ THEN BEGIN ClicPeuple
SAY @900161 /*@900161 = ~Eh bien, crois-moi ou pas mais sache que nous avons des gnomes, qui vouent une grande énergie à la culture de la betterave -le pendant du navet sur Toril, si tu préfères. Tu peux également, si tu te rends dans les Monts Orrotiar, admirer des aigles géants, prêts à fondre sur l'imprudent chamois évoluant dans les escarpements rocheux. Nos eaux sont peuplées de tritons et de sirènes, cotoyant poissons et cétacés aux dimensions impressionnantes. Et aux abords de l'île d'Ysmer, on dit même que l'on peut apercevoir dans les profondeurs de l'océan les ruines d'une antique civilisation disparue...~*/
= @900162 /*@900162 = ~Si tu es patiente et chanceuse, tu peux réussir à apercevoir dans les forêts de Tiraslyn des troupeaux de licornes buvant à la rivière ; mais bien plus rares sont encore les chances d'apercevoir un cerf blanc, messager des dieux. Quant aux dragons, ils ne vivent heureusement que dans les plus hautes cimes des montagnes, et ils ont pratiquement disparu, décimés par nos armées et nos chevaliers intrépides.~*/
= @900163 /*@900163 = ~A vrai dire, je ne t'apprends sûrement rien de neuf, tant nos deux mondes se ressemblent. C'est pour cela que je ne suis pas prêt de quitter Toril, <CHARNAME> : de tous les plans que j'ai traversés, celui-ci est celui qui m'évoque le plus Tiraslyn. J'aime Toril, <CHARNAME> : je n'en partirai pour rien au monde.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPaysages
SAY @900164 /*@900164 = ~Je suis né dans le royaume d'Anshalar, dans une forêt aux abords d'Auriar, la cité-mère de ce royaume. C'est une contrée de l'extrême-nord de Tiraslyn, ainsi l'hiver s'y montre peu clément lorsqu'il s'abat et il est fréquent de voir les toits d'Auriar recouverts d'une houppelande de neige. Si tu remontes la rivière Antaluve depuis Auriar, tu peux admirer les antiques forêts de Damarion, jusqu'à atteindre les monts Orrotiar et leurs neiges éternelles. Mais si tu choisis de descendre la rivière vers le sud, tu atteins la Côte d'Opale et ses ports à l'activité débordante : là, de nombreux navires venus des lointaines îles d'Eté et du Désert Pourpre débarquent leurs innombrables marchandises en un joyeux tumulte.~*/
= @900165 /*@900165 = ~Je n'ai jamais pu visiter ces lointaines contrées, <CHARNAME>, et c'est un de mes grands regrets : les circonstances ne me l'ont pas permis. Mais qui sait, peut-être aurons-nous l'occasion un jour de visiter Toril ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDieux
SAY @900166 /*@900166 = ~Il n'y a rien de foncièrement différent entre les divinités Toriliennes et Tyréniennes. Comme beaucoup de cités, Auriar a basé une grande partie de son activité sur le commerce : par conséquent, tu peux trouver de nombreux temples dédiés à Redenor, le Seigneur de l'Argent. Dans les montagnes se vénèrent Rathiel et Denaïr, les divinités du Froid et des Tempêtes. Sur l'océan et les cours d'eau, c'est Urethor qui règne sans partage : il provoque naufrages et déluges, ainsi chaque marin un tant soit peu avisé prend soin de jeter quelque offrande dans les flots avant d'y naviguer.~*/
= @900167 /*@900167 = ~Dans les bois domine Syvane, Dame des Forêts. C'est elle qui forgea pour moi cette armure...mais c'est une autre histoire. Quant à Kelar, dieu de la guerre et de la mort, il est malheureusement bien plus vénéré que partout ailleurs sur Tiraslyn. Nombre de cités sont tombés au nom de sa gloire...Mais il existe nombre d'autres dieux plus ou moins puissants, ceux-là ne sont que les principaux. Et je ne saurais te sortir une phrase au sujet des dieux des îles d'Ete et du Désert Pourpre.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicQuitter
SAY @900169 /*@900169 = ~(L'expression de Severian s'assombrit.) Je n'ai aucunement envie de t'en parler, <CHARNAME>. Il y a des choses qu'il vaut mieux ignorer.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicFamille
SAY @900170 /*@900170 = ~(L'expression de Severian s'assombrit.) Il ne reste personne sur Tiraslyn qui aurait pu me retenir de franchir le Portail. Mais je chéris toujours le souvenir d'une époque heureuse qui n'est plus.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicHalfshade
SAY @900171 /*@900171 = ~(Le visage de Severian arbore une nuance d'appréhension et de fanfaronnade.) Cela ne me surprend guère : si les halfshades sont rares sur Tiraslyn, ils le sont davantage sur Toril. Je suis probablement le seul halfshade que tu rencontreras jamais, ma belle. Cela dit, c'est loin d'être un sujet propice au débat : tu as déjà vu de quoi j'étais capable contre Grutt-la-Montagne, et je suis impatient de t'en montrer davantage. Tu verras de tes propres yeux.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicBrigand
SAY @900172 /*@900172 = ~Et toi, qu'est-ce qui t'a poussé à mener une existence aussi dangereuse ? Ce sont les aléas de l'existence qui m'ont poussé dans cette voie ; le hasard si tu préfères, car je ne cautionne pas l'idée de destinée. (Severian fait jouer ses lames avec entrain.) Et puis, avoue : tu me verrais dans le rôle d'un pacifique marchand ? Je serai bien incapable de négocier le prix d'une paire de bottes...Le plus facile, c'est encore de les détrousser : il ne se suffit que de se servir en ce monde, pour qui sait se montrer un tant soit peu inventif et téméraire.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicVie
SAY @900173 /*@900173 = ~J'ai tant de fois risqué ma vie que ce périple-ci ne me paraît pas si insurmontable que ça. Et si ce doit être ma dernière aventure, alors j'aurais eu la satisfaction de la vivre aux côtés d'une belle femme courageuse et volontaire...Cela dit, nous sommes désormais liés par contrat, <CHARNAME>. Et je suis peut-être un brigand et un vaurien mais je sais me montrer loyal. Tu pourras toujours compter sur moi.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSyvane
SAY @900174 /*@900174 = ~Les idées reçues ont la vie dure. Je ne suis pas le rôdeur au grand coeur magnifié par les livres d'histoire et de contes, ou dont les bardes chantent les louanges dans leurs chansons. Avant de passer ce damné portail, Syvane, la Dame des Forêts de Tiraslyn, avait posé ses yeux sur moi. Mais sur Toril, elle n'existe pour ainsi dire pas : ce monde est soumis à d'autres lois divines.~*/
= @900175 /*@900175 = ~A mon arrivée sur Toril, je suis devenu un pillard, à Kara-Tur, au Calimshan ou encore au Téthyr et je n'ai guère l'espoir qu'une quelconque divinité sylvestre ne me prenne sous son aile. Je n'en ai à vrai dire nullement le désir : je me contente de temps à autre d'invoquer Tymora pour me porter chance. Impossible de savoir si cela fonctionne mais jusqu'ici, je m'en suis toujours tiré sans trop d'égratignures...~*/
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN ClicHeureux1
SAY @900176 /*@900176 = ~(Severian vous sourit derechef.) Heureux, peut-être pas. Mais serein, oui. J'éprouve de temps à autre le besoin de faire le vide en moi. Tel que tu me vois, c'est le cas en ce moment. Il ne manquerait plus qu'une bonne assiette de victuailles et un bon lit moëlleux pour me contenter pleinement.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicHeureux2
SAY @900177 /*@900177 = ~(Severian maîtrise une mèche rebelle qui lui chatouille le front, tirant sur sa pipe.) Eh bien, tels que nous voilà embarqués, je devrais logiquement dire que nous courons droit au suicide. Mais je dois bien admettre que tu te débrouilles toujours pour nous éviter le pire. Ta puissance contrebalance cette propension à nous embarquer dans les pires catastrophes alors oui, en ce moment, j'ai quelques raisons d'être serein, à défaut d'être pleinement heureux.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicHeureux3
SAY @900178 /*@900178 = ~(Le jeune homme vous contemple, malicieux.) Je ne suis pas certain de vouloir te dire à quoi je pense en ce moment, <CHARNAME>. ça fait partie du jardin secret de tout un chacun...(Il se ravise.) Pour être franc, j'admirais ton popotin mais pas la peine de me mettre une claque, hein ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicClinOeil1
SAY @900179 /*@900179 = ~(Le jeune homme retire la pipe de sa bouche pour répliquer, puis se ravise. Il se contente de vous observer de son air de séducteur des grands jours.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicClinOeil2
SAY @900180 /*@900180 = ~(Severian vous adresse une grimace des plus comiques, adoptant l'air le plus idiot que vous ne lui ayez jamais vu.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicClinOeil3
SAY @900181 /*@900181 = ~(Le hors-la-loi fait semblant de s'étonner.) Qu'est-ce qui t'arrive, <CHARNAME> ? Une poussière dans l'oeil ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPipe1
SAY @900182 /*@900182 = ~(Severian vous confie sa pipe et croise les bras, dubitatif, impatient de goûter à votre déconfiture.) En as-tu seulement l'habitude, <CHARNAME> ?~*/
IF ~RandomNum(2,1)~ THEN REPLY @900183 /*@900183 = ~Quoi, tu plaisantes ? Gorion fumait la pipe, et il m'est arrivé de la lui chiper sans qu'il ne s'en aperçoive le moins du monde. Tu vas voir un peu...~*/ GOTO ClicPipe2
IF ~RandomNum(2,2)~ THEN REPLY @900183 /*@900183 = ~Quoi, tu plaisantes ? Gorion fumait la pipe, et il m'est arrivé de la lui chiper sans qu'il ne s'en aperçoive le moins du monde. Tu vas voir un peu...~*/ GOTO ClicPipe3
IF ~RandomNum(2,1)~ THEN REPLY @900184 /*@900184 = ~Qui ne risque rien n'a rien. Je veux essayer et tu peux toujours conserver cet air moqueur, je m'en fiche.~*/ GOTO ClicPipe4
IF ~RandomNum(2,2)~ THEN REPLY @900184 /*@900184 = ~Qui ne risque rien n'a rien. Je veux essayer et tu peux toujours conserver cet air moqueur, je m'en fiche.~*/ GOTO ClicPipe5
END

IF ~~ THEN BEGIN ClicPipe2
SAY @900185 /*@900185 = ~(Severian se tord de rire tandis que vous crachez vos poumons, suffocante.) Et voilà : qu'est-ce que je disais ! Tu mens toujours aussi effrontément, <CHARNAME> ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPipe3
SAY @900186 /*@900186 = ~(Severian vous observe tirant sur la pipe avec aisance, les panaches de fumée venant tourbillonner autour de lui tandis que vous le considérez avec triomphe.) Bon, d'accord : je dois admettre que tu te débrouilles bien. Mais rends-la moi maintenant, ce n'est pas pour les fillettes.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPipe4
SAY @900187 /*@900187 = ~(Severian vous observe tirant péniblement sur la pipe, jusqu'à ce que vous suffoquiez. Il se met à rire aux éclats en se tenant les côtes.) ça fait toujours ça la première fois, <CHARNAME>...Allons, ah ah, respire un bon coup, voilà que tu as perdu toutes tes couleurs...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPipe5
SAY @900188 /*@900188 = ~(Severian vous observe en plein exercice, jusqu'à ce que parveniez à exhaler sans broncher une épaisse fumée blanche.) Bon, d'accord : j'avoue, tu m'as bluffée. Mais es-tu vraiment sûre que c'est la première fois que tu essaies ce truc ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPasse1
SAY @900189 /*@900189 = ~(Severian exhibe ses lames, goguenard.) Tu es sûre, <CHARNAME> ? C'est que je ne voudrais pas te blesser...~*/
IF ~RandomNum(2,1)~ THEN REPLY @900190 /*@900190 = ~(Vous lui portez un preste coup de taille, au débotté.) Voilà de quoi te faire ravaler ta frime !~*/ GOTO ClicDebotte1
IF ~RandomNum(2,2)~ THEN REPLY @900190 /*@900190 = ~(Vous lui portez un preste coup de taille, au débotté.) Voilà de quoi te faire ravaler ta frime !~*/ GOTO ClicDebotte2
IF ~~ THEN REPLY @900191 /*@900191 = ~(Vous levez prudemment votre garde, attentive.) Vraiment ? Qu'est-ce que tu attends, alors ? ~*/ GOTO ClicAttendre1
IF ~~ THEN REPLY @900211 /*@900211 = ~Finalement, ça ne me dit rien qui vaille. Je connais tes qualités de bretteur et je ne voudrais pas finir hachée menue. ~*/ GOTO ClicBretteur
IF ~~ THEN REPLY @900212 /*@900212 = ~Tout compte fait, oublie ça. Je n'ai pas de temps à perdre à ces jeux puérils.~*/ GOTO ClicPueril
END

IF ~~ THEN BEGIN ClicDebotte1
SAY @900194 /*@900194 = ~(Le jeune homme bondit en arrière, juste à temps pour éviter votre assaut. Il vous porte à son tour un coup d'estoc.) Qu'est-ce que je disais, <CHARNAME>. Te voilà avec une belle estafilade sur la main.~*/
IF ~RandomNum(2,1)~ THEN REPLY @900195 /*@900195 = ~(Vous sautez sur Severian pour le renverser à terre.) Je n'ai pas dit mon dernier mot !~*/ GOTO ClicTerre1
IF ~RandomNum(2,2)~ THEN REPLY @900195 /*@900195 = ~(Vous sautez sur Severian pour le renverser à terre.) Je n'ai pas dit mon dernier mot !~*/ GOTO ClicTerre2
IF ~RandomNum(2,1)~ THEN REPLY @900196 /*@900196 = ~(Vous épongez le filet de sang qui coule de votre égratignure, maussade.) C'est bon, je reconnais ma défaite. Tu as été le meilleur sur ce coup-là. Môssieur Severian est content ?~*/ GOTO ClicDefaite1
IF ~RandomNum(2,2)~ THEN REPLY @900196 /*@900196 = ~(Vous épongez le filet de sang qui coule de votre égratignure, maussade.) C'est bon, je reconnais ma défaite. Tu as été le meilleur sur ce coup-là. Môssieur Severian est content ?~*/ GOTO ClicDefaite2
END

IF ~~ THEN BEGIN ClicTerre1
SAY @900197 /*@900197 = ~(Vous roulez à terre et vous débattez comme des chiffonniers jusqu'à ce que Severian, triomphant, vous plaque les deux mains au sol. Malgré lui, son regard s'attarde un peu trop sur vos traits avant qu'il ne se relève pour se dépoussiérer. Il vous sourit.) Allons, <CHARNAME>, que croyais-tu pouvoir me faire, hein ? Mais si échanger quelques passes d'armes signifie t'avoir ainsi dans mes bras, ma foi, je veux bien recommencer autant de fois que tu voudras...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTerre2
SAY @900198 /*@900198 = ~(Vous roulez à terre et cette mêlée vous voit en sortir victorieuse. Vous vous asseyez triomphalement à califourchon sur Severian, qui peine encore à reprendre son souffle. Celui-ci étend ses mains en signe de reddition, hilare.) Je...Je me rends, <CHARNAME> ! Ah ah...~*/
= @900199 /*@900199 = ~(Ses yeux rencontrent les vôtres et l'espace d'un instant, vous éprouvez tous deux un curieux sentiment. Severian finit par se dégager pour tâter son front, agrémenté d'une bosse.) Ouille...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDefaite1
SAY @900200 /*@900200 = ~(Le jeune homme croise les bras, hilare.) Ah, <CHARNAME>, tu ne pensais pas sérieusement pouvoir me battre, si ? Fais contre mauvaise fortune bon coeur, montre-toi bonne joueuse !~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDefaite2
SAY @900201 /*@900201 = ~(Severian s'assoit sur le sol pour reprendre son souffle.) Je vois : Mademoiselle ne supporte pas la défaite. Bon, fais-moi signe quand tu seras disposée à prendre ta revanche, hein...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDebotte2
SAY @900202 /*@900202 = ~(Surpris par votre soudaine initiative, l'halfshade n'a pas le temps de l'éviter et, perdant l'équilibre, il se met à battre vainement des bras pour se raccrocher à quelque chose. Avant qu'il ne chute, vous le voyez disparaître dans l'éther.)~*/
= @900203 /*@900203 = ~Ouille...! Mais tu ne perds rien pour attendre, <CHARNAME>...~*/
IF ~RandomNum(2,1)~ THEN REPLY @900204 /*@900204 = ~(Vous vous tournez de tous les côtés, désorientée.) Eh ! C'est de la triche ! C'est ça, un duel dans les règles, selon toi ?~*/ GOTO ClicCotes1
IF ~RandomNum(2,2)~ THEN REPLY @900204 /*@900204 = ~(Vous vous tournez de tous les côtés, désorientée.) Eh ! C'est de la triche ! C'est ça, un duel dans les règles, selon toi ?~*/ GOTO ClicCotes2
IF ~RandomNum(2,1)~ THEN REPLY @900205 /*@900205 = ~(Vous restez immobile, l'oreille tendue pour percevoir ses mouvements.) Je ne te vois peut-être plus mais je t'entends toujours, gros malin !~*/ GOTO ClicMouvements1
IF ~RandomNum(2,2)~ THEN REPLY @900205 /*@900205 = ~(Vous restez immobile, l'oreille tendue pour percevoir ses mouvements.) Je ne te vois peut-être plus mais je t'entends toujours, gros malin !~*/ GOTO ClicMouvements2
END

IF ~~ THEN BEGIN ClicCotes1
SAY @900206 /*@900206 = ~(Avant que vous n'ayez eu le temps d'esquisser un mouvement, Severian vous propulse à terre où vous mangez allègrement la poussière. Il apparaît devant vous pour vous tendre une main amicale.) Il me semble que nous n'avions établi aucune règle au départ, par conséquent, tous les coups sont permis, ma jolie !~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCotes2
SAY @900207 /*@900207 = ~(Le bruit ténu de bottes foulant le sol vous parvient aux oreilles et vous esquissez un pas de côté pour esquiver l'attaque, envoyant votre main au hasard dans le vide. Severian réapparaît devant vous, se frottant la mâchoire.) Ouille...ça pour une claque, c'en est une...Et on dirait bien que tu as gagné, <CHARNAME>. Alors, heureuse ?~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMouvements1
SAY @900208 /*@900208 = ~(Le bruit d'un objet métallique chutant sur le sol vous distrait un instant avant que vous ne sentiez le bras de Severian glisser autour de votre cou. Il réapparaît et vous souffle dans l'oreille.) Te voilà prise au piège, ma belle.~*/ 
= @900209 /*@900209 = ~(Il vous vole un baiser au passage, posant ses lèvres sur la peau satinée de votre cou, avant de s'éloigner, satisfait.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMouvements2
SAY @900210 /*@900210 = ~(Un souffle d'air froid vous balaie le visage, trahissant la présence de Severian, prêt à fondre sur vous. D'un mouvement leste, vous aggrippez le vide et Severian se révèle à vous, déconfit, son bras retenu par votre main.) D'accord, d'accord : j'ai voulu jouer au plus malin et j'ai perdu. Euh, je crois que tu peux me lâcher maintenant, maîtresse...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPueril
SAY @900213 /*@900213 = ~(Le jeune homme hausse les épaules.) Comme tu veux, <CHARNAME>. Mais je soupçonne de la lâcheté derrière cette excuse.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicBretteur
SAY @900214 /*@900214 = ~(Le hors-la-loi vous adresse un clin d'oeil taquin.) Ce n'était qu'une boutade, <CHARNAME>. Je suis certain que tu parviendrais à te défendre quelques minutes avant que je ne t'étale à plate couture, eh !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAttendre1
SAY @900215 /*@900215 = ~(Emoustillé par votre provocation, Severian vous porte le premier assaut et rencontre votre garde. Il commence à aller et venir devant vous.) Mademoiselle est coriace, j'aime ça.~*/
IF ~RandomNum(2,1)~ THEN REPLY @900216 /*@900216 = ~(Vous conservez votre position défensive.) La meilleure défense, ce n'est pas toujours l'attaque, mon cher.~*/ GOTO ClicAttaque1
IF ~RandomNum(2,2)~ THEN REPLY @900216 /*@900216 = ~(Vous conservez votre position défensive.) La meilleure défense, ce n'est pas toujours l'attaque, mon cher.~*/ GOTO ClicAttaque2
IF ~RandomNum(2,1)~ THEN REPLY @900217 /*@900217 = ~(Vous vous ruez soudainement sur lui.) Encaisse un peu ça !~*/ GOTO ClicRuer1
IF ~RandomNum(2,2)~ THEN REPLY @900217 /*@900217 = ~(Vous vous ruez soudainement sur lui.) Encaisse un peu ça !~*/ GOTO ClicRuer2
END

IF ~~ THEN BEGIN ClicAttaque1
SAY @900218 /*@900218 = ~(Enhardi par votre apparent manque d'hardiesse, Severian finit par fondre sur vous, des éclats métalliques ponctuant votre lutte avant qu'il ne finisse par briser votre garde et ne vous gratifie d'une légère estafilade à la jambe.) Et tu es vraiment sûre de ça, <CHARNAME> ? Peut-être devrais-tu revoir ce point de vue.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAttaque2
SAY @900219 /*@900219 = ~(Votre tactique porte ses fruits : alors que Severian, lassé, tente une percée dans votre garde, vous le désarmez en quelques passes d'armes, envoyant ses armes au loin.) On peut dire que tu m'as bien eu mais la prochaine fois, je ne me laisserai pas prendre à ta provocation, tu peux en être certaine !~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRuer1
SAY @900220 /*@900220 = ~(Votre lame rencontre le vide alors que Severian plonge sur le côté pour disparaître dans l'éther. L'instant d'après, il vous envoie valdinguer sur le sol d'un coup de pied adroit dans votre fondement. Vous l'entendez rire.) Pas trop mal aux fesses, <CHARNAME> ?~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRuer2
SAY @900221 /*@900221 = ~(Vos armes s'entrechoquent, provoquant quelques étincelles. En un geste adroit et puissant, vous projetez Severian sur son séant. Il se relève, sonné.) Ma parole, une vraie diablesse ! Je...Je crois que je vois plein d'étoiles là...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPasse2
SAY @900222 /*@900222 = ~(Severian sort ses lames de leurs fourreaux, charmeur.) Comment refuser à une aussi belle femme ? Mais je te préviens, <CHARNAME> : apprête-toi à mordre la poussière !~*/
IF ~RandomNum(2,1)~ THEN REPLY @900190 /*@900190 = ~(Vous lui portez un preste coup de taille, au débotté.) Voilà de quoi te faire ravaler ta frime !~*/ GOTO ClicDebotte1
IF ~RandomNum(2,2)~ THEN REPLY @900190 /*@900190 = ~(Vous lui portez un preste coup de taille, au débotté.) Voilà de quoi te faire ravaler ta frime !~*/ GOTO ClicDebotte2
IF ~~ THEN REPLY @900191 /*@900191 = ~(Vous levez prudemment votre garde, attentive.) Vraiment ? Qu'est-ce que tu attends, alors ? ~*/ GOTO ClicAttendre1
IF ~~ THEN REPLY @900211 /*@900211 = ~Finalement, ça ne me dit rien qui vaille. Je connais tes qualités de bretteur et je ne voudrais pas finir hachée menue. ~*/ GOTO ClicBretteur
IF ~~ THEN REPLY @900212 /*@900212 = ~Tout compte fait, oublie ça. Je n'ai pas de temps à perdre à ces jeux puérils.~*/ GOTO ClicPueril
END

IF ~~ THEN BEGIN ClicPasse3
SAY @900223 /*@900223 = ~(Severian sort ses lames de leurs fourreaux, sûr de lui.) Je ne suis pas certain que ce soit une bonne idée, <CHARNAME>. Je ne te ferai pas de cadeau, tu sais !~*/
IF ~RandomNum(2,1)~ THEN REPLY @900190 /*@900190 = ~(Vous lui portez un preste coup de taille, au débotté.) Voilà de quoi te faire ravaler ta frime !~*/ GOTO ClicDebotte1
IF ~RandomNum(2,2)~ THEN REPLY @900190 /*@900190 = ~(Vous lui portez un preste coup de taille, au débotté.) Voilà de quoi te faire ravaler ta frime !~*/ GOTO ClicDebotte2
IF ~~ THEN REPLY @900191 /*@900191 = ~(Vous levez prudemment votre garde, attentive.) Vraiment ? Qu'est-ce que tu attends, alors ? ~*/ GOTO ClicAttendre1
IF ~~ THEN REPLY @900211 /*@900211 = ~Finalement, ça ne me dit rien qui vaille. Je connais tes qualités de bretteur et je ne voudrais pas finir hachée menue. ~*/ GOTO ClicBretteur
IF ~~ THEN REPLY @900212 /*@900212 = ~Tout compte fait, oublie ça. Je n'ai pas de temps à perdre à ces jeux puérils.~*/ GOTO ClicPueril
END

IF ~~ THEN BEGIN ClicChevelure1
SAY @900224 /*@900224 = ~(Severian semble admirer l'éclat de vos cheveux et leur opulence, mais rien n'est moins sûr : impossible de connaître ses pensées profondes.)~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicChevelure2
SAY @900225 /*@900225 = ~(Severian mordille le tuyau de sa pipe, perplexe.) Quand je vois les femmes se pomponner de la sorte, je ne peux m'empêcher de me demander ce qu'elles font sur les routes.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicChevelure3
SAY @900226 /*@900226 = ~(Le jeune homme contemple votre geste avec intérêt non sans se délecter furtivement du reste de votre personne.)~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicConquete
SAY @900227 /*@900227 = ~(Severian oublie sa pipe et fronce les sourcils.) Euh, je ne suis pas sûr que ce soit des récits à réserver à tes oreilles, <CHARNAME>. Et en quoi cela pourrait-il t'intéresser, du reste ?~*/
IF ~~ THEN REPLY @900228 /*@900228 = ~Eh bien, toi qui te fends d'être un grand séducteur, ma curiosité est titillée, voilà tout. Combien as-tu de conquêtes à ton tableau de chasse, alors ?~*/ GOTO ClicTableau
IF ~~ THEN REPLY @900229 /*@900229 = ~Pour être franche, j'aimerais bien connaître ton type de femme. Blonde ? Brune ? Rousse ?~*/ GOTO ClicType 
IF ~~ THEN REPLY @900240 /*@900240 = ~Ne crois pas que je sois si chaste. Allez, tu veux bien me raconter quelques-unes de tes frasques ?~*/ GOTO ClicJupons
IF ~RandomNum(2,1)~ THEN REPLY @900230 /*@900230 = ~A vrai dire, savoir combien de femmes tu as possédées est bien le cadet de mes soucis, cependant...~*/ GOTO ClicCadet1
IF ~RandomNum(2,2)~ THEN REPLY @900230 /*@900230 = ~A vrai dire, savoir combien de femmes tu as possédées est bien le cadet de mes soucis, cependant...~*/ GOTO ClicCadet2
IF ~~ THEN REPLY @900233 /*@900233 = ~Tu as raison : en fait, je pressens que tes exploits d'étalon ne m'intéresseront absolument pas.~*/ GOTO ClicEtalon
END

IF ~~ THEN BEGIN ClicCadet1
SAY @900231 /*@900231 = ~(Le hors-la-loi ronchonne en reprenant sa pipe.) Alors, pourquoi est-ce que tu me demandes ça ?~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCadet2
SAY @900232 /*@900232 = ~(Severian hausse un sourcil.) Alors, pourquoi est-ce que tu me demandes ça ? Parfois, j'ai vraiment du mal à te comprendre, tiens.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicJupons
SAY @900234 /*@900234 = ~Oh eh bien, si tu insistes pour entendre des histoires de jupons...Si tu mon avis, ce sont plutôt des histoires à échanger entre hommes autour d'une bière...~*/
= @900235 /*@900235 = ~Je vais être franc : j'ai longtemps sauté de maisons closes en maisons closes avant de te rencontrer, chaque fois que l'occasion se présentait. J'ai eu des calishites, des téthyriennes, des kara-turiennes et quelques Amniennes dans mes bras lorsque mes affaires me permettaient quelque répit propice au plaisir des sens. Il m'est cependant arrivé de passer quelques nuits torrides dans les bras d'une même femme, rencontrée lors d'un voyage ou d'une affaire, et qui ne réclamait aucun dû sitôt la bagatelle expédiée.~*/
= @900236 /*@900236 = ~Ma dernière aventure en date, c'était à la Couronne de Cuivre. Ils ont là-bas quelques catins qui valent le détour, crois-moi. Il a fallu que je défende vaille que vaille ma nuit avec Aïcha contre un noble de la ville, qui n'aspirait qu'à m'en défaire. J'ai bien réussi à défendre mes droits mais le lendemain, c'était une autre paire de manche. Cet imbécile buté est revenu avec deux matadors et j'ai dû sauter par une fenêtre. En bas se trouvait un tas de foin providentiel et je n'ai plus eu qu'à me faufiler dans les ombres de la ruelle.~*/
= @900237 /*@900237 = ~Souvent, les histoires avec les femmes finissent par une bonne gifle. Pour le coup, cette histoire-là avait failli finir bien pire ce jour-là...~*/
= @900238 /*@900238 = ~Qu'est-ce que tu dis de tout ça, <CHARNAME> ?~*/
IF ~RandomNum(2,1)~ THEN REPLY @900241 /*@900241 = ~J'en dis que mieux vaut entendre ça que d'être sourd...~*/ GOTO ClicSourd1
IF ~RandomNum(2,2)~ THEN REPLY @900241 /*@900241 = ~J'en dis que mieux vaut entendre ça que d'être sourd...~*/ GOTO ClicSourd2
IF ~RandomNum(2,1)~ THEN REPLY @900242 /*@900242 = ~C'est vraiment dégoûtant !~*/ GOTO ClicDegoutant1
IF ~RandomNum(2,2)~ THEN REPLY @900242 /*@900242 = ~C'est vraiment dégoûtant !~*/ GOTO ClicDegoutant2
IF ~RandomNum(2,1)~ THEN REPLY @900243 /*@900243 = ~Que tu ne réussiras pas à m'embobiner comme tu as embobiné la moitié des femmes de Féerune.~*/ GOTO ClicEmbobiner1
IF ~RandomNum(2,2)~ THEN REPLY @900243 /*@900243 = ~Que tu ne réussiras pas à m'embobiner comme tu as embobiné la moitié des femmes de Féerune.~*/ GOTO ClicEmbobiner2
IF ~RandomNum(2,1)~ THEN REPLY @900244 /*@900244 = ~J'en dis que tu sais profiter de la vie à ta façon et que tu as bien raison.~*/ GOTO ClicProfiter1
IF ~RandomNum(2,2)~ THEN REPLY @900244 /*@900244 = ~J'en dis que tu sais profiter de la vie à ta façon et que tu as bien raison.~*/ GOTO ClicProfiter2
IF ~RandomNum(2,1)~ THEN REPLY @900253 /*@900253 = ~(Vous le giflez.) Dorénavant, je te défends de me raconter encore de pareilles horreurs !~*/ GOTO ClicHorreurs1
IF ~RandomNum(2,2)~ THEN REPLY @900253 /*@900253 = ~(Vous le giflez.) Dorénavant, je te défends de me raconter encore de pareilles horreurs !~*/ GOTO ClicHorreurs2
END

IF ~~ THEN BEGIN ClicEtalon
SAY @900239 /*@900239 = ~Souvent femme varie. Tu fais bien de varier pour le coup, <CHARNAME>.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDegoutant1
SAY @900245 /*@900245 = ~(Le jeune homme vous considère, bouche bée.) Alors ça, pour quelqu'un qui ne se prétend pas chaste, c'est la meilleure...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDegoutant2
SAY @900246 /*@900246 = ~(Le hors-la-loi vous considère, surpris.) Quelque chose me dit que tu n'as pas rencontré beaucoup d'hommes dans ta vie pour tenir un tel discours, <CHARNAME>.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSourd1
SAY @900247 /*@900247 = ~(Le hors-la-loi affiche tous les signes de la surprise.) Je te rappelle que c'est toi qui as insisté pour entendre ça...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSourd2
SAY @900248 /*@900248 = ~(Severian hausse les épaules.) Tu demandes, je donne suite. Ne va pas me dire que tu n'as jamais entendu pareil récit de ta vie...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEmbobiner1
SAY @900249 /*@900249 = ~(Severian grince des dents.) Parce que tu crois que c'est mon intention ? Tu n'as pas encore exploré toutes les facettes de mon âme, <CHARNAME>.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEmbobiner2
SAY @900250 /*@900250 = ~(Severian se mord la lèvre.) Tu te montes la tête toute seule. Avec ton caractère, comment pourrais-je avoir seulement l'envie d'essayer ?~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicProfiter1
SAY @900251 /*@900251 = ~(Severian se gratte la tête.) Ah mince, je t'aurais cru plus jalouse que ça...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicProfiter2
SAY @900252 /*@900252 = ~(Severian hausse les sourcils.) Je n'aurais jamais cru entendre ça de la bouche d'une femme...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicHorreurs1
SAY @900254 /*@900254 = ~(Le jeune homme se caresse la joue, grimaçant.) Bon, ça illustre à merveille le dicton "La vérité fait mal".~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicHorreurs2
SAY @900255 /*@900255 = ~(Severian se frotte la joue avec vigueur, soupirant.) Encore une ! ça devient lassant...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTableau
SAY @900256 /*@900256 = ~(Severian hésite un instant puis se décide. Faisant jouer ses doigts, il entreprend d'en faire le décompte et visiblement, cela lui demande un intense effort de mémoire.)~*/
= @900257 /*@900257 = ~Sasuke, Hamoko, Ryazuke, Tananake, Homori...Ah oui, ça c'était à Kara-Tur. Mmmh, voyons voir après...~*/
= @900258 /*@900258 = ~Philys, Maïra, Aryane, Hanna, Loïse, Telandra...Des Téthyriennes, je m'en rappelle. Certaines de la bande à Yohn le Bronzé des forêts de Téthyr, d'autres des villages proches...Ah, je me perds...~*/
= @900259 /*@900259 = ~(Severian réfléchit intensément.)~*/
= @900260 /*@900260 = ~Azza, Bahia, Chirine, Djamila, Johar, Neïla, Tlidja...Toutes de purs joyaux des sables brûlants de Calimshan, tu peux m'en croire. Je me souviens particulièrement bien de Tlidja car elle avait l'habitude de se baigner dans du lait d'ânesse une fois le pillage accompli. Après cela, elle avait la peau aussi douce que du satin.~*/
= @900261 /*@900261 = ~Bon, j'en oublie, mais c'est déjà pas mal, hein ?~*/
IF ~RandomNum(2,1)~ THEN REPLY @900262 /*@900262 = ~*Pas mal* ? Moi je trouve ça grotesque et puéril.~*/ GOTO ClicGrotesque1
IF ~RandomNum(2,2)~ THEN REPLY @900262 /*@900262 = ~*Pas mal* ? Moi je trouve ça grotesque et puéril.~*/ GOTO ClicGrotesque2
IF ~RandomNum(2,1)~ THEN REPLY @900263 /*@900263 = ~Pas mal oui, mais si moi je t'énumerais la liste de mes propres conquêtes, nous serions encore là demain !~*/ GOTO ClicDemain1
IF ~RandomNum(2,2)~ THEN REPLY @900263 /*@900263 = ~Pas mal oui, mais si moi je t'énumérais la liste de mes propres conquêtes, nous serions encore là demain !~*/ GOTO ClicDemain2
IF ~RandomNum(2,1)~ THEN REPLY @900264 /*@900264 = ~'Impressionnant' serait plus approprié. Je comprends que tu en ressentes de la fierté.~*/ GOTO ClicFierte1
IF ~RandomNum(2,2)~ THEN REPLY @900264 /*@900264 = ~'Impressionnant' serait plus approprié. Je comprends que tu en ressentes de la fierté.~*/ GOTO ClicFierte2
IF ~RandomNum(2,1)~ THEN REPLY @900265 /*@900265 = ~Je ne sais pas si je dois me contenter d'une simple crise de jalousie ou bien t'arracher les yeux.~*/ GOTO ClicJalouse1
IF ~RandomNum(2,2)~ THEN REPLY @900265 /*@900265 = ~Je ne sais pas si je dois me contenter d'une simple crise de jalousie ou bien t'arracher les yeux.~*/ GOTO ClicJalouse2
END

IF ~~ THEN BEGIN ClicJalouse1
SAY @900266 /*@900266 = ~Je me demande vraiment ce qui me vaudrait de subir pareil traitement de ta part. Serais-tu jalouse ?~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicJalouse2
SAY @900267 /*@900267 = ~(Severian exhibe son couteau de chasse pour jongler avec, décontenancé.) Je n'ai pas de comptes à te rendre que je sache, si ? Que t'importe ?~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicGrotesque1
SAY @900268 /*@900268 = ~(Severian exhibe son couteau de chasse pour jongler avec, décontenancé.) Je me doutais bien que c'était une mauvaise idée de t'en parler mais ce que femme veut...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicGrotesque2
SAY @900269 /*@900269 = ~(Severian s'emploie à retendre la corde de son arc pour se donner une contenance.) Et voilà, ça m'apprendra à me laisser aller à des confidences...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDemain1
SAY @900270 /*@900270 = ~(Severian fait jouer sa pièce d'argent entre ses doigts.) Et voilà, ça m'apprendra à me laisser aller à des confidences...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDemain2
SAY @900271 /*@900271 = ~(Le jeune homme vous toise, vexé.) Ce n'est pas une compétition, tu sais...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicFierte1
SAY @900272 /*@900272 = ~(Le jeune homme vous regarde, incertain.) Je te trouve bien conciliante. En tout cas, je n'avais pas l'impression d'être aussi fier que ça quand je t'en dressais la liste.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicFierte2
SAY @900273 /*@900273 = ~(Le jeune homme vous regarde, bouche bée.) Eh bien, je ne m'attendais certainement pas à avoir ton aval, <CHARNAME>.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicType
SAY @900274 /*@900274 = ~Mon type de femme ? Eh bien, je suppose que je peux bien te le dire...Je n'ai pas de critère physique particulier : pour moi, que les femmes soient brunes, blondes ou rousses, c'est du pareil au même. Enfin, tu ne me verras quand même jamais au bras d'une maritorne, hein. Et toi, <CHARNAME>, as-tu des préférences précises en matière d'hommes ?~*/
IF ~RandomNum(2,1)~ THEN REPLY @900275 /*@900275 = ~J'ai une nette préférence pour les blonds bien musclés.~*/ GOTO ClicBlonds1
IF ~RandomNum(2,2)~ THEN REPLY @900275 /*@900275 = ~J'ai une nette préférence pour les blonds bien musclés.~*/ GOTO ClicBlonds2
IF ~RandomNum(2,1)~ THEN REPLY @900276 /*@900276 = ~J'ai un gros penchant pour les roux avec des taches de rousseur.~*/ GOTO ClicRoux1
IF ~RandomNum(2,2)~ THEN REPLY @900276 /*@900276 = ~J'ai un gros penchant pour les roux avec des taches de rousseur.~*/ GOTO ClicRoux2
IF ~RandomNum(2,1)~ THEN REPLY @900277 /*@900277 = ~Ce que j'aime par-dessus tout, ce sont les beaux bruns mal rasés à l'allure négligée.~*/ GOTO ClicBruns1
IF ~RandomNum(2,2)~ THEN REPLY @900277 /*@900277 = ~Ce que j'aime par-dessus tout, ce sont les beaux bruns mal rasés à l'allure négligée.~*/ GOTO ClicBruns2
IF ~RandomNum(2,1)~ THEN REPLY @900278 /*@900278 = ~Je crois bien que je n'ai pas de type particulier, moi non plus.~*/ GOTO ClicParticulier1
IF ~RandomNum(2,2)~ THEN REPLY @900278 /*@900278 = ~Je crois bien que je n'ai pas de type particulier, moi non plus.~*/ GOTO ClicParticulier2
IF ~RandomNum(2,1)~ THEN REPLY @900279 /*@900279 = ~Tout bien réfléchi, je n'ai nullement envie de t'en faire part.~*/ GOTO ClicPart1
IF ~RandomNum(2,2)~ THEN REPLY @900279 /*@900279 = ~Tout bien réfléchi, je n'ai nullement envie de t'en faire part.~*/ GOTO ClicPart2
END

IF ~~ THEN BEGIN ClicBlonds1
SAY @900280 /*@900280 = ~Dans ce cas, peut-être devrais-tu aller faire un tour du côté de l'Epine Dorsale du monde, qui grouille de barbares blonds à longues tresses. Sûre que tu adorerais te rouler dans leurs peaux de bêtes au coin du feu...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicBlonds2
SAY @900281 /*@900281 = ~(Severian vous présente un de ses bras et contracte son biceps en souriant.) Et ça, ce n'est pas du muscle, peut-être ? Bon, d'accord, moins que tes blondinets guerriers, mais je parie que je pourrais te porter sur plusieurs lieues sans te laisser choir.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRoux1
SAY @900282 /*@900282 = ~(Le jeune homme fait la moue.) Il faudrait donc que je me peinturlure pour rentrer dans tes critères ?~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRoux2
SAY @900283 /*@900283 = ~(Le jeune homme se fait blagueur.) Tu te compliques la tâche, <CHARNAME>. Des roux, on ne peut pas dire qu'il y en ait beaucoup sur Toril, alors bonne chance pour en trouver un qui soit à ton goût.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicBruns1
SAY @900284 /*@900284 = ~(Severian se met à tirer sur sa pipe, pensif.) Je vois. Cet aveu donne matière à réflexion, je l'avoue.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicBruns2
SAY @900285 /*@900285 = ~(Le hors-la-loi entreprend un examen de sa personne, l'air innocent.) Mal rasé ? C'est vrai...Négligé ? Bon, j'admets cela aussi. Brun, ça, il est difficile de le nier. Mais tu ne parles pas de moi quand même, si ?~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicParticulier1
SAY @900286 /*@900286 = ~(L'halfshade vous adresse un clin d'oeil.) Ce qui laisse pas mal de perspectives, hein <CHARNAME> ?~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicParticulier2
SAY @900287 /*@900287 = ~(La déception se fait jour sur les traits de Severian, vous en jureriez.) Vraiment ? Pourquoi pas...Toute latitude t'est ainsi donnée.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPart1
SAY @900288 /*@900288 = ~(Severian se détourne, de mauvaise humeur.) On m'y reprendra à me laisser aller aux confidences, tiens...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPart2
SAY @900289 /*@900289 = ~(Le hors-la-loi lève les mains en signe d'acceptation.) Bah, je ne fais que te retourner la question, quelle comique tu fais quand tu t'y mets...~*/ 
IF ~~ THEN EXIT
END

// FLIRT 3


IF ~IsGabber(Player1)
    Global("#SClicTalk","GLOBAL",2)
    RandomNum(2,1)
    CombatCounter(0)
    InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEGIN DialClicSecondPalier
SAY @900290 /*@900290 = ~(Severian observe votre approche avec un sourire subtilement nuancé, que vous ne lui aviez jamais vu auparavant.)~*/
IF ~RandomNum(3,1)~ THEN REPLY @900291 /*@900291 = ~(Vous lui rendez son sourire.)~*/ GOTO ClicSourire1
IF ~RandomNum(3,2)~ THEN REPLY @900291 /*@900291 = ~(Vous lui rendez son sourire.)~*/ GOTO ClicSourire2
IF ~RandomNum(3,3)~ THEN REPLY @900291 /*@900291 = ~(Vous lui rendez son sourire.)~*/ GOTO ClicSourire3
IF ~RandomNum(3,1)~ THEN REPLY @900292 /*@900292 = ~(Vous glissez votre main dans la sienne.)~*/ GOTO ClicMain1
IF ~RandomNum(3,2)~ THEN REPLY @900292 /*@900292 = ~(Vous glissez votre main dans la sienne.)~*/ GOTO ClicMain2
IF ~RandomNum(3,3)~ THEN REPLY @900292 /*@900292 = ~(Vous glissez votre main dans la sienne.)~*/ GOTO ClicMain3
IF ~RandomNum(3,1)~ THEN REPLY @900293 /*@900293 = ~(Vous l'embrassez sur la joue.)~*/ GOTO ClicJoue1
IF ~RandomNum(3,2)~ THEN REPLY @900293 /*@900293 = ~(Vous l'embrassez sur la joue.~*/ GOTO ClicJoue2
IF ~RandomNum(3,3)~ THEN REPLY @900293 /*@900293 = ~(Vous l'embrassez sur la joue.)~*/ GOTO ClicJoue3
IF ~RandomNum(3,1)~ THEN REPLY @900294 /*@900294 = ~(Vous passez une main dans l'entrelac de ses cheveux bruns.)~*/ GOTO ClicCheveux1
IF ~RandomNum(3,2)~ THEN REPLY @900294 /*@900294 = ~(Vous passez une main dans l'entrelac de ses cheveux bruns.)~*/ GOTO ClicCheveux2
IF ~RandomNum(3,3)~ THEN REPLY @900294 /*@900294 = ~(Vous passez une main dans l'entrelac de ses cheveux bruns.)~*/ GOTO ClicCheveux3
IF ~RandomNum(3,1)~ THEN REPLY @900295 /*@900295 = ~(Vous le chatouillez.)~*/ GOTO ClicChatouiller1
IF ~RandomNum(3,2)~ THEN REPLY @900295 /*@900295 = ~(Vous le chatouillez.)~*/ GOTO ClicChatouiller2
IF ~RandomNum(3,3)~ THEN REPLY @900295 /*@900295 = ~(Vous le chatouillez.)~*/ GOTO ClicChatouiller3
IF ~RandomNum(3,1)~ THEN REPLY @900296 /*@900296 = ~(Vous esquissez une grimace idiote.)~*/ GOTO ClicGrimace1
IF ~RandomNum(3,2)~ THEN REPLY @900296 /*@900296 = ~(Vous esquissez une grimace idiote.)~*/ GOTO ClicGrimace2
IF ~RandomNum(3,3)~ THEN REPLY @900296 /*@900296 = ~(Vous esquissez une grimace idiote.)~*/ GOTO ClicGrimace3
IF ~OR(2)
    TimeLT(7)
    TimeGT(21)~ THEN REPLY @900297 /*@900297 = ~(Vous levez le nez vers les étoiles pour les admirer.)~*/ GOTO ClicEtoiles
IF ~TimeGT(6)
    TimeLT(21)~ THEN REPLY @900298 /*@900298 = ~(Vous placez votre main en visière pour contempler le soleil.)~*/ GOTO ClicSoleil
IF ~RandomNum(3,1)~ THEN REPLY @900300 /*@900300 = ~(Vous volez une pomme dans son sac de voyage.)~*/ GOTO ClicPomme1
IF ~RandomNum(3,2)~ THEN REPLY @900300 /*@900300 = ~(Vous volez une pomme dans son sac de voyage.)~*/ GOTO ClicPomme2
IF ~RandomNum(3,3)~ THEN REPLY @900300 /*@900300 = ~(Vous volez une pomme dans son sac de voyage.)~*/ GOTO ClicPomme3
IF ~RandomNum(3,1)~ THEN REPLY @900405 /*@900405 = ~Que dirais-tu de me montrer un de tes tours de magie ?~*/ GOTO ClicTourMagie1
IF ~RandomNum(3,2)~ THEN REPLY @900405 /*@900405 = ~Que dirais-tu de me montrer un de tes tours de magie ?~*/ GOTO ClicTourMagie2
IF ~RandomNum(3,3)~ THEN REPLY @900405 /*@900405 = ~Que dirais-tu de me montrer un de tes tours de magie ?~*/ GOTO ClicTourMagie3
IF ~RandomNum(3,1)~ THEN REPLY @900301 /*@900301 = ~(Vous lui tournez le dos, indifférente.)~*/ GOTO ClicTournerDos1
IF ~RandomNum(3,2)~ THEN REPLY @900301 /*@900301 = ~(Vous lui tournez le dos, indifférente.)~*/ GOTO ClicTournerDos2
IF ~RandomNum(3,3)~ THEN REPLY @900301 /*@900301 = ~(Vous lui tournez le dos, indifférente.)~*/ GOTO ClicTournerDos3
END

IF ~~ THEN BEGIN ClicTournerDos1
SAY @900302 /*@900302 = ~(Le sourire du jeune homme meurt sur ses lèvres tandis qu'il devient hésitant, puis franchement déconcerté.)~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTournerDos2
SAY @900303 /*@900303 = ~(Le hors-la-loi vous imite, cependant désarçonné par votre attitude distante.)~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTournerDos3
SAY @900304 /*@900304 = ~(Severian se mord la lèvre, bridant toute velléité de dialogue qu'il pourrait avoir.)~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSourire1
SAY @900305 /*@900305 = ~(Severian conserve son sourire mais celui-ci se mut en tendresse légèrement timorée.)~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSourire2
SAY @900306 /*@900306 = ~(Le visage du jeune homme devient neutre alors qu'il tente de saisir vos pensées derrière cette manifestation d'affection.)~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSourire3
SAY @900307 /*@900307 = ~(L'halfshade persiste dans son sourire.) Que cache ce sourire, <CHARNAME> ?~*/ 
IF ~RandomNum(3,1)~ THEN REPLY @900308 /*@900308 = ~L'envie de te plaire, Severian.~*/ GOTO ClicPlaire1
IF ~RandomNum(3,2)~ THEN REPLY @900308 /*@900308 = ~L'envie de te plaire, Severian.~*/ GOTO ClicPlaire2
IF ~RandomNum(3,3)~ THEN REPLY @900308 /*@900308 = ~L'envie de te plaire, Severian.~*/ GOTO ClicPlaire3
IF ~RandomNum(3,1)~ THEN REPLY @900309 /*@900309 = ~Il exprime certaines idées que j'ai en tête, mais je ne suis pas prête à te les confier.~*/ GOTO ClicIdees1
IF ~RandomNum(3,2)~ THEN REPLY @900309 /*@900309 = ~Il exprime certaines idées que j'ai en tête, mais je ne suis pas prête à te les confier.~*/ GOTO ClicIdees2
IF ~RandomNum(3,3)~ THEN REPLY @900309 /*@900309 = ~Il exprime certaines idées que j'ai en tête, mais je ne suis pas prête à te les confier.~*/ GOTO ClicIdees3
IF ~RandomNum(3,1)~ THEN REPLY @900310 /*@900310 = ~De la confiance, Severian. Tu m'es un allié précieux et un ami cher.~*/ GOTO ClicAllie1
IF ~RandomNum(3,2)~ THEN REPLY @900310 /*@900310 = ~De la confiance, Severian. Tu m'es un allié précieux et un ami cher.~*/ GOTO ClicAllie2
IF ~RandomNum(3,3)~ THEN REPLY @900310 /*@900310 = ~De la confiance, Severian. Tu m'es un allié précieux et un ami cher.~*/ GOTO ClicAllie3
END

IF ~~ THEN BEGIN ClicAllie1
SAY @900311 /*@900311 = ~Et tu pourras toujours compter sur moi. Je n'ai qu'une parole lorsque le jeu en vaut la chandelle. Essayons juste de rester en vie tous les deux, d'accord ?~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAllie2
SAY @900312 /*@900312 = ~Tu te décides à faire confiance à un vaurien comme moi. Mais je ne te décevrai pas, <CHARNAME>.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAllie3
SAY @900313 /*@900313 = ~J'aime à penser que tu es comme une lumière dans l'obscurité. Et le papillon de nuit ne s'éloigne jamais de la flamme. Cette confiance est partagée.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPlaire1
SAY @900314 /*@900314 = ~(Le jeune homme ne dit rien mais la tendresse dans ses yeux s'accentue.)~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPlaire2
SAY @900315 /*@900315 = ~(Severian se fait taquin.) Ah bien sûr que c'est plaisant à voir, mais tu manques encore d'imagination, ma belle...~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPlaire3
SAY @900316 /*@900316 = ~(Severian vous prend la main pour y déposer un baiser.) Tout pour te plaire à mon tour aussi, dans ce cas.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicIdees1
SAY @900317 /*@900317 = ~(Severian lève les yeux au ciel.) Les femmes aiment les cachotteries au moins autant que leurs breloques.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicIdees2
SAY @900318 /*@900318 = ~(Le jeune homme réajuste sa mitaine, tous sourires.) Attention, <CHARNAME> : j'ai l'imagination fertile !~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicIdees3
SAY @900319 /*@900319 = ~(L'halfshade hausse les épaules sans se départir de son sourire.) Tu aimes faire des mystères, soit : alors je ferai de même et tu ne sauras rien de ce à quoi je pense en ce moment-même.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMain1
SAY @900320 /*@900320 = ~(Severian se laisse faire, incertain. Sa main est chaude dans la vôtre tandis qu'il vous observe avec curiosité. Vous demeurez ainsi quelques minutes, silencieux et heureux.)~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMain2
SAY @900321 /*@900321 = ~(Severian porte votre main à ses lèvres pour y déposer un baiser furtif.) Pardonne ce geste mais c'est plus fort que moi.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMain3
SAY @900322 /*@900322 = ~(Severian affermit sa main dans la vôtre. Elle est chaude à travers l'étoffe de la mitaine.) Que me vaut cette faveur, <CHARNAME> ?~*/ 
IF ~RandomNum(3,1)~ THEN REPLY @900323 /*@900323 = ~L'envie de t'être agréable. Serais-tu gêné ?~*/ GOTO ClicAgreable1
IF ~RandomNum(3,2)~ THEN REPLY @900323 /*@900323 = ~L'envie de t'être agréable. Serais-tu gêné ?~*/ GOTO ClicAgreable2
IF ~RandomNum(3,3)~ THEN REPLY @900323 /*@900323 = ~L'envie de t'être agréable. Serais-tu gêné ?~*/ GOTO ClicAgreable3
IF ~RandomNum(3,1)~ THEN REPLY @900324 /*@900324 = ~Un instant d'égarement, probablement. Parfois, il me passe des choses impossibles par la tête, tu sais.~*/ GOTO ClicEgarement1
IF ~RandomNum(3,2)~ THEN REPLY @900324 /*@900324 = ~Un instant d'égarement, probablement. Parfois, il me passe des choses impossibles par la tête, tu sais.~*/ GOTO ClicEgarement2
IF ~RandomNum(3,3)~ THEN REPLY @900324 /*@900324 = ~Un instant d'égarement, probablement. Parfois, il me passe des choses impossibles par la tête, tu sais.~*/ GOTO ClicEgarement3
END

IF ~~ THEN BEGIN ClicAgreable1
SAY @900325 /*@900325 = ~(Severian caresse sa barbe.) Gêné ? Moi ? Ah ah !Je ne m'attendais pas à cela, c'est tout.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAgreable2
SAY @900326 /*@900326 = ~Si je suis *gêné* ? J'ai l'air d'être gêné, vraiment ? Je ne suis pas prêt de lâcher cette jolie main, <CHARNAME>.~*/ 
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAgreable3
SAY @900327 /*@900327 = ~Un peu de chaleur humaine dans ce monde de brutes ? ça me plaît. Et non, je ne suis pas *gêné* !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEgarement1
SAY @900328 /*@900328 = ~Je vois. Dans ce cas, mettons à profit ce moment d'égarement de ta part. Pour ma part, je suis tout à fait lucide.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEgarement2
SAY @900329 /*@900329 = ~(Severian se met à rire.) Et c'est ainsi que je t'apprécie, <CHARNAME>. Avec ce petit grain de folie.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEgarement3
SAY @900330 /*@900330 = ~(Le jeune homme acquiesce, déçu.) Probablement. Un instant d'égarement, comme tu dis...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicJoue1
SAY @900331 /*@900331 = ~(Severian arbore une expression éberluée. Il vous regarde vous en aller, fière de vous, planté comme un idiot.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicJoue2
SAY @900332 /*@900332 = ~(Le hors-la-loi frémit un instant avant de caresser sa joue du bout de son index, stupéfait.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicJoue3
SAY @900333 /*@900333 = ~(Le jeune homme sourit prudemment.) Allons bon ! Qu'ai-je fait pour mériter pareille récompense ?~*/
IF ~RandomNum(3,1)~ THEN REPLY @900334 /*@900334 = ~Il est bon de temps en temps de laisser libre court à ses envies, tu ne crois pas ?~*/ GOTO ClicEnvies1
IF ~RandomNum(3,2)~ THEN REPLY @900334 /*@900334 = ~Il est bon de temps en temps de laisser libre court à ses envies, tu ne crois pas ?~*/ GOTO ClicEnvies2
IF ~RandomNum(3,3)~ THEN REPLY @900334 /*@900334 = ~Il est bon de temps en temps de laisser libre court à ses envies, tu ne crois pas ?~*/ GOTO ClicEnvies3
IF ~RandomNum(3,1)~ THEN REPLY @900335 /*@900335 = ~Désolée, je regrette : à la réflexion, c'était un geste insensé.~*/ GOTO ClicInsense1
IF ~RandomNum(3,2)~ THEN REPLY @900335 /*@900335 = ~Désolée, je regrette : à la réflexion, c'était un geste insensé.~*/ GOTO ClicInsense2
IF ~RandomNum(3,3)~ THEN REPLY @900335 /*@900335 = ~Désolée, je regrette : à la réflexion, c'était un geste insensé.~*/ GOTO ClicInsense3
END

IF ~~ THEN BEGIN ClicEnvies1
SAY @900336 /*@900336 = ~(Severian grimace.) Si seulement c'était aussi simple...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEnvies2
SAY @900337 /*@900337 = ~(Severian se mord la lèvre.) Il serait en effet bon de savoir se laisser aller. Mais je crains de n'avoir aucune limite, dans ce cas.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEnvies3
SAY @900338 /*@900338 = ~Si je t'écoutais, je t'inciterai à tout laisser tomber pour parcourir Féerune, rien que toi et moi. Alors, on a beau avoir des envies, ce n'est pas toujours possible de leur laisser tout loisir d'expression.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicInsense1
SAY @900339 /*@900339 = ~Un acte sans raison ni sens mais parfois, il n'a pas besoin de raison pour être appréciable.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicInsense2
SAY @900340 /*@900340 = ~Peut-être n'est-il pas aussi insensé que tu le suggères, <CHARNAME>.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicInsense3
SAY @900341 /*@900341 = ~(Severian vous embrasse à son tour sur la joue.) Oh, pardon : moi non plus, l'espace d'un instant, je n'ai pas réfléchi.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCheveux1
SAY @900342 /*@900342 = ~(Severian vous laisse taquiner ses mèches indociles, appréciant sans vergogne votre caresse.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCheveux2
SAY @900343 /*@900343 = ~(L'halfshade adopte un air sur la défensive.) Je te jure, <CHARNAME> : si c'est des poux que tu me cherches dans la tête, il n'y en a pas un seul !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCheveux3
SAY @900344 /*@900344 = ~(L'halfshade se met à rire, tentant de vous échapper avant de faire de même avec votre chevelure. Il vous décoiffe d'un geste preste.) Et alors, qu'est-ce que c'est que ces manières ?~*/
IF ~RandomNum(3,1)~ THEN REPLY @900345 /*@900345 = ~Ah, laisse-toi faire ! Crois-moi, tu as sérieusement besoin d'un bon coup de peigne.~*/ GOTO ClicPeigne1
IF ~RandomNum(3,2)~ THEN REPLY @900345 /*@900345 = ~Ah, laisse-toi faire ! Crois-moi, tu as sérieusement besoin d'un bon coup de peigne.~*/ GOTO ClicPeigne2
IF ~RandomNum(3,3)~ THEN REPLY @900345 /*@900345 = ~Ah, laisse-toi faire ! Crois-moi, tu as sérieusement besoin d'un bon coup de peigne.~*/ GOTO ClicPeigne3
IF ~RandomNum(3,1)~ THEN REPLY @900346 /*@900346 = ~Tu as besoin que quelqu'un s'occupe un peu de toi. Ne me dis pas que tu n'aimes pas ça, si ?~*/ GOTO ClicOccuper1
IF ~RandomNum(3,2)~ THEN REPLY @900346 /*@900346 = ~Tu as besoin que quelqu'un s'occupe un peu de toi. Ne me dis pas que tu n'aimes pas ça, si ?~*/ GOTO ClicOccuper2
IF ~RandomNum(3,3)~ THEN REPLY @900346 /*@900346 = ~Tu as besoin que quelqu'un s'occupe un peu de toi. Ne me dis pas que tu n'aimes pas ça, si ?~*/ GOTO ClicOccuper3
IF ~RandomNum(3,1)~ THEN REPLY @900347 /*@900347 = ~(Vous sautez sur Severian.) Ah, tu veux jouer au plus malin, c'est ça ?~*/ GOTO ClicJouer1
IF ~RandomNum(3,2)~ THEN REPLY @900347 /*@900347 = ~(Vous sautez sur Severian.) Ah, tu veux jouer au plus malin, c'est ça ?~*/ GOTO ClicJouer2
IF ~RandomNum(3,3)~ THEN REPLY @900347 /*@900347 = ~(Vous sautez sur Severian.) Ah, tu veux jouer au plus malin, c'est ça ?~*/ GOTO ClicJouer3
END

IF ~~ THEN BEGIN ClicPeigne1
SAY @900348 /*@900348 = ~(Severian saisit vos poignets sans s'arrêter de rire, vous maîtrisant à grand peine jusqu'à ce que vous cessiez la lutte et que vos rires meurent sur vos lèvres, tandis que vos yeux se trouvent et peinent à se quitter.) ~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPeigne2
SAY @900349 /*@900349 = ~(Severian fourrage dans sa chevelure en désordre, perplexe, avant de sourire.) Tu crois ? Allons, <CHARNAME> : avoue que cette tignasse rebelle te manquerait !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPeigne3
SAY @900350 /*@900350 = ~(Severian se prend à rire.) Si c'est de cette manière que tu t'improvises barbier, <CHARNAME>, je préfère que tu n'ailles pas plus loin.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicOccuper1
SAY @900351 /*@900351 = ~(Alors que Severian vous retient par les poignets, il vous attire subitement à lui. Ses yeux s'attardent sur vos lèvres tandis que ses sens sont mis à l'épreuve. Il finit par vous libérer.) Je dois dire que j'aime ça, c'est vrai.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicOccuper2
SAY @900352 /*@900352 = ~(Vous pouvez lire le dilemne sur le visage de Severian tandis qu'il vous retient par les poignets, avant qu'il ne se décide.) Je n'ai pas besoin que l'on s'occupe de moi, <CHARNAME>. Je suis un grand garçon, tu sais.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicOccuper3
SAY @900353 /*@900353 = ~(Severian se laisse malmener sans se départir de son entrain.) Si ça te plaît de me traiter comme une poupée, <CHARNAME>, alors je peux bien me laisser un peu faire.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicJouer1
SAY @900354 /*@900354 = ~(Alors que vous vous jetez sur Severian, vous glissez sur le sol et vous l'entraînez dans votre chute. Il se relève et se masse le dos, grimaçant de douleur.) Quand tu auras fini de faire l'imbécile, fais-moi signe, <CHARNAME>...Aïe...!~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicJouer2
SAY @900355 /*@900355 = ~(Vous vous agrippez au dos de Severian et ce dernier tourne en tous sens pour se défaire de votre fardeau.) Ouille ! <CHARNAME> ! Ce...Ce n'est pas la délicatesse qui t'étouffe...Mais tu...Tu vas descendre, oui ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicJouer3
SAY @900356 /*@900356 = ~(Severian fait un pas de côté et votre assaut se solde par une belle chute. Il vous tend la main, beau joueur.) Et alors, qu'est-ce que tu croyais, hein ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicChatouiller1
SAY @900357 /*@900357 = ~(Le jeune homme vous laisse le chatouiller à travers son pourpoint, impassible, mais vous devinez qu'il se maîtrise à grand-peine d'éclater de rire.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicChatouiller2
SAY @900358 /*@900358 = ~(Le hors-la-loi tente sans succès d'écarter vos mains de sa taille. Il est manifestement très chatouilleux, à en juger par les spasmes hilares qui l'agitent.) A...Arr...Arrête, <CHARNAME> !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicChatouiller3
SAY @900359 /*@900359 = ~(Severian parvient à vous attraper par la taille et maintient fermement ses bras plaqués sur les vôtres. Sa chaleur vous pénètre et vous enveloppe, tel un écrin réconfortant. Vous pouvez sentir son coeur battre à travers l'étoffe.) Je connais des jeux encore plus amusants, <CHARNAME>...~*/
= @900360 /*@900360 = ~(Le jeune homme dépose un baiser insolent dans votre cou avant de se sauver, satifait de son tour.) Celui-là, par exemple !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicGrimace1
SAY @900433 /*@900433 = ~(Le jeune homme vous rend votre mimique, tirant la langue tout en louchant affreusement.) Je parie que tu ne pourrais pas faire mieux !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicGrimace2
SAY @900361 /*@900361 = ~(Severian vous observe avec curiosité, un sourire en coin.) Rien ne peut altérer ta bonne humeur, hein ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicGrimace3
SAY @900362 /*@900362 = ~(Severian prend un air faussement naïf.) Tu lances le concours de la plus affreuse grimace, <CHARNAME> ? Laisse-moi te dire que tu as toutes les chances de le remporter...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEtoiles
SAY @900363 /*@900363 = ~(Severian vous imite et vous observez de concert les myriades de paillettes qui parsèment le ciel d'un noir d'encre où seule, brille Séluné. Severian vous regarde, songeur.) Tu ne t'es jamais demandée ce que cela pouvait bien être, <CHARNAME> ? Nous les appelons 'étoiles' mais dans le fond que savons-nous de ces points lumineux ?~*/
IF ~~ THEN REPLY @900364 /*@900364 = ~Probablement des sphères chaudes et brûlantes semblables à notre soleil. Oui, c'est forcément ça : je ne vois pas d'autre explication.~*/ GOTO ClicSphere
IF ~~ THEN REPLY @900365 /*@900365 = ~Je dois avouer que ça ne m'a jamais effleuré l'esprit.~*/ GOTO ClicEsprit
IF ~~ THEN REPLY @900366 /*@900366 = ~De bêtes lucioles sur un bête drap tendu, voilà ce que c'est.~*/ GOTO ClicLuciole
IF ~~ THEN REPLY @900367 /*@900367 = ~Je ne t'avais rarement vu aussi sérieux, Severian...~*/ GOTO ClicSerieux
IF ~~ THEN REPLY @900368 /*@900368 = ~J'ai autre chose à faire que de m'intéresser à la voûte céleste, crois-moi !~*/ GOTO ClicVoute
END

IF ~~ THEN BEGIN ClicVoute
SAY @900369 /*@900369 = ~Celui qui ne s'interroge pas sur le monde est à sa merci. La connaissance apporte un certain pouvoir, <CHARNAME>. Tu devrais y réfléchir.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSerieux
SAY @900370 /*@900370 = ~Eh, quoi ? Je sais que je suis parfois puéril et stupide, mais je suis loin d'être un imbécile. Il y a des choses qui m'interpellent, <CHARNAME>. Il y a tant de choses à voir en ce monde que je n'aurais hélas pas assez d'une vie pour tout découvrir.~*/
IF ~~ THEN REPLY @900371 /*@900371 = ~Lorsque tout sera fini, je te promets que nous irons explorer Toril, là où il nous plaira d'aller, libres comme l'air.~*/ GOTO ClicExploration
IF ~~ THEN REPLY @900372 /*@900372 = ~J'aimerais faire ces voyages avec toi mais je ne peux rien te promettre, Severian. Nous pouvons perdre la vie à tout instant et à jamais, et notre voyage s'arrêtera là.~*/ GOTO ClicPerdreVie
IF ~~ THEN REPLY @900373 /*@900373 = ~Quant à moi, je préfère trouver un coin tranquille où me retirer en paix, une fois tout ça terminé.~*/ GOTO ClicCoin
END

IF ~~ THEN BEGIN ClicCoin
SAY @900374 /*@900374 = ~Je comprends que tu sois lasse de vivre sur le fil du rasoir, <CHARNAME>. Alors oublions ça...pour le moment, car je ne désespère pas de te convaincre un jour.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPerdreVie
SAY @900375 /*@900375 = ~Tu n'as pas besoin de me faire de promesse. Contente-toi de conserver la vie, ce sera déjà bien assez précieux à mes yeux.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicExploration
SAY @900376 /*@900376 = ~Eh bien, <CHARNAME>, si nous voulons éviter que ce plan sur la comète ne tombe à l'eau, tâchons de rester en vie et de cingler les fesses une bonne fois pour toutes à cet Irénicus. Une fois cela fait, nous pourrions bel et bien partir dans le Nord, qu'est-ce que tu en dis ? Voir l'Epine Dorsale du Monde, flâner dans les Dix-Cités, tenir entre nos mains la neige des glaciers...Assurément, cela me rappellerait Anshalar, mon royaume natal.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicLuciole
SAY @900377 /*@900377 = ~(Severian vous regarde, les yeux ronds.) Des lucioles ? Euh...Tu te sens bien, <CHARNAME> ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEsprit
SAY @900378 /*@900378 = ~J'ai du mal à te croire. A moins qu'à force de les côtoyer, tu finisses par ne plus vraiment les voir ? Les étoiles finissent alors par ne plus être qu'un élément du cadre rassurant qui forme notre quotidien. Je m'interroge sur nombre de choses quant à moi, et ces points lumineux n'en sont qu'une infime partie.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSphere
SAY @900379 /*@900379 = ~Cela me donne le vertige d'imaginer ces millions de soleils que tu dépeins, mais ton explication est intéressante. Je crains toutefois que nous ne sachions jamais la vérité, comme beaucoup de choses ici-bas.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSoleil
SAY @900380 /*@900380 = ~(Le jeune homme dirige son attention vers son carquois, dont il extrait une flèche pour en refaire l'empennage abîmée, jetant de temps à autre un regard vers l'astre solaire.) Joli spectacle, hein ?~*/
IF ~~ THEN REPLY @900381 /*@900381 = ~Tu es troublé, Severian. Je le vois bien.~*/ GOTO ClicTrouble
IF ~~ THEN REPLY @900382 /*@900382 = ~Très joli. Je ne m'en lasse jamais.~*/ GOTO ClicJamais
IF ~~ THEN REPLY @900383 /*@900383 = ~Assez banal, en fait. Je vois ça tous les matins au réveil.~*/ GOTO ClicReveil
END

IF ~~ THEN BEGIN ClicReveil
SAY @900384 /*@900384 = ~Rien ne peut plus te surprendre, alors ? Dommage que tu penses cela : chaque aube est pour moi comme un renouveau.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTrouble
SAY @900385 /*@900385 = ~Sans cette armure, je ne serai pas là pour en parler, ou contraint à vivre dans l'obscurité, en permanence. Tu le vois comme un spectacle inoffensif et grandiose, moi je le vois comme une entité magnifique et malveillante...Alors oui, chaque fois que mes yeux se posent dessus, je ressens un trouble difficile à combattre.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicJamais
SAY @900386 /*@900386 = ~Moi non plus. Mais si je n'y prends pas garde, ce spectacle pourrait bel et bien se transformer en cauchemar pour moi.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPomme1
SAY @900387 /*@900387 = ~(Le jeune homme vous observe déguster la pomme avec effronterie.) En voilà des manières...Continue comme ça et tu es bonne pour me racheter des pommes à la prochaine halte !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPomme2
SAY @900388 /*@900388 = ~(Le jeune homme étudie son sac traînant sur le sol et le ramasse pour le mettre sur son dos, railleur.) Attention, <CHARNAME> : je n'aimerais pas que tu tombes sur certaines affaires que je garde là-dedans. Demande-moi la prochaine fois, hein ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPomme3
SAY @900389 /*@900389 = ~(Le hors-la-loi récupère sa pomme d'un preste tour de main. Il commence à la faire danser dans ses mains, jusque derrière son dos.) Ah ah ? Si tu veux absolument une pomme, <CHARNAME>, il va falloir l'attraper.~*/
IF ~~ THEN REPLY @900390 /*@900390 = ~(Vous commencez à essayer d'attraper la pomme.)~*/ GOTO ClicPomme4
IF ~~ THEN REPLY @900391 /*@900391 = ~Je n'ai pas le temps de jouer, Severian. Donne-la moi : il n'y en avait plus dans mon sac.~*/ GOTO ClicPomme5
IF ~~ THEN REPLY @900392 /*@900392 = ~(Sans préambule, vous l'embrassez sur la joue.) Et si je te fais ça, je peux la récupérer ? Après tout, c'est bien le symbole du vice sur Tiraslyn, non ?~*/ GOTO ClicPomme6
END

IF ~~ THEN BEGIN ClicPomme5
SAY @900393 /*@900393 = ~(Severian vous lance la pomme, lassé.) Je vois. Tu es aussi accommodante qu'un kobold aujourd'hui. Alors tiens, voilà ton butin et ne viens plus me casser les pieds.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPomme4
SAY @900394 /*@900394 = ~(Le hors-la-loi jongle avec la pomme comme il le ferait avec ses lames. Chaque fois que vos mains s'apprêtent à se refermer sur le fruit, le voilà qui se soustrait à votre portée.)~*/
IF ~~ THEN REPLY @900395 /*@900395 = ~(Vous lui donnez une claque.) ça suffit ! J'en ai marre de tes gamineries, Severian. Donne-la moi, je meurs de faim !~*/ GOTO ClicPomme7
IF ~~ THEN REPLY @900396 /*@900396 = ~(Vous le chatouillez.) Donne-la moi et j'arrêterai. Sinon...~*/ GOTO ClicPomme8
IF ~~ THEN REPLY @900397 /*@900397 = ~(Vous sautez pour attraper la pomme que Severian a placé en bout de bras.)~*/ GOTO ClicPomme9
END

IF ~~ THEN BEGIN ClicPomme6
SAY @900398 /*@900398 = ~(Severian affiche un air héberlué avant de vous lancer le fruit, tout sourires.) Je vois que tu sais user d'arguments convaincants. Alors tiens, voilà ton butin, il est mérité !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPomme9
SAY @900399 /*@900399 = ~(Severian vous dépasse d'une tête et maintient obstinément l'objet de votre convoitise hors de votre portée.) Allez, je vais être bon prince : prends-la. Mais tu aurais pu faire preuve de davantage d'imagination...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPomme7
SAY @900400 /*@900400 = ~(L'halfshade apprécie moyennement le traitement et son expression nargueuse se mue en mécontentement. Il envoie la pomme au diable, d'un geste par-dessus son épaule.) Oh et puis zut : si c'est pour que je reçoive des claques, ce n'est pas la peine.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPomme8
SAY @900401 /*@900401 = ~(Le jeune homme est plié en deux sous vos attaques. Il vous donne le fruit, bon gré, mal gré.) D'a...D'accord, tu as gagné ! Je me rends, arrête, c'est bon !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicIndifferente1
SAY @900402 /*@900402 = ~Qu'est-ce qui te prends, <CHARNAME> ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicIndifferente2
SAY @900403 /*@900403 = ~Allons bon : qu'ai-je encore bien pu te faire ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicIndifferente3
SAY @900404 /*@900404 = ~Oh tu peux bien faire la tête, mais je suis certain que ça ne durera pas.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTourMagie1
SAY @900406 /*@900406 = ~(Severian retrousse ses manches, révélant des bras bronzés, conservant toutefois ses mitaines.) Ce n'est pas du haut vol comme tu pourrais en voir dans les théâtres ou sur les marchés mais c'est le genre de chose que l'on développe lorsque l'on s'ennuie à attendre un convoi de marchandises. Prête ?~*/
= @900407 /* @900407 = ~(Il exhibe un tas de cartes miteuses de son pourpoint et vous les présente en éventail. Il vous invite à en prendre une pour que vous en mémorisiez la figure puis vous la replacez dans l'éventail qu'il se met à battre consciencieusement.)~*/
= @900408 /* @900408 = ~(Cela fait, il finit par exhiber du tas de cartes celle que vous aviez choisie et vous la présente.) La voilà, ta carte.~*/
IF ~~ THEN REPLY @900409 /*@900409 = ~C'est bien celle-là, en effet. Tu maîtrises à merveille les illusions, comme je devais m'y attendre de la part d'un halfshade.~*/ GOTO ClicMarotte
IF ~~ THEN REPLY @900410 /*@900410 = ~(Vous mentez.) Tu t'es trompé, Severian. Ce n'est pas celle-là.~*/ GOTO ClicMentir
IF ~~ THEN REPLY @900411 /*@900411 = ~Ah, d'accord...Eh bien c'est vraiment le tour le plus minable que j'ai jamais vu.~*/ GOTO ClicMinable
END

IF ~~ THEN BEGIN ClicMentir
SAY @900412 /*@900412 = ~(Le jeune homme fronce les sourcils et fixe bêtement ses cartes, comme si la raison de son échec pouvait s'y trouver.) ça, c'est la meilleure...Tu es sûre, <CHARNAME> ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMinable
SAY @900413 /*@900413 = ~(Le jeune homme fronce les sourcils.) Je n'ai jamais prétendu que c'était grandiose. Tu espérais peut-être voir quelque colombe sortir de mes manches ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMarotte
SAY @900414 /*@900414 = ~Ce n'est qu'une marotte personnelle. Impossible de te dire si tous les halfshades ont ce genre de loisir. Content que cela t'ait plu, en tout cas. ~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTourMagie2
SAY @900415 /*@900415 = ~(Severian retrousse ses manches, révélant des bras bronzés, conservant toutefois ses mitaines.) Ce n'est pas du haut vol comme tu pourrais en voir dans les théâtres ou sur les marchés mais c'est le genre de chose que l'on développe lorsque l'on s'ennuie à attendre un convoi de marchandises. Prête ?~*/
= @900416 /* @900416 = ~(Il exhibe un petit foulard rouge de sa poche puis vous le présente avant de le manipuler jusqu'à ce qu'il ait disparu d'entre ses doigts.)~*/
= @900417 /* @900417 = ~(Puis il écarte un pan de sa cape et vous pouvez voir le foulard entortillé autour de la garde de son épée.)~*/
IF ~~ THEN REPLY @900418 /*@900418 = ~Tu m'as bluffée. Comment as-tu fait ?~*/ GOTO ClicBluff
IF ~~ THEN REPLY @900419 /*@900419 = ~Facile : il y a en fait deux foulards.~*/ GOTO ClicFoulard
IF ~~ THEN REPLY @900420 /*@900420 = ~Pfff...Il y a de bien meilleurs artistes que toi au Théâtre des Cinq Chopes.~*/ GOTO ClicTheatre
END

IF ~~ THEN BEGIN ClicBluff
SAY @900421 /*@900421 = ~(Severian vous fait un clin d'oeil.) Si je te le disais, cela perdrait tout son charme, tu ne penses pas ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicFoulard
SAY @900422 /*@900422 = ~(Severian dénoue le foulard et le range dans son pourpoint.) Ah, je t'assure que non. Tu peux toujours me fouiller, tu n'en trouveras pas d'autre.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTheatre
SAY @900423 /*@900423 = ~(Severian dénoue le foulard et le range tranquillement dans son pourpoint.) Ah mais je n'ai jamais prétendu le contraire, que je sache.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTourMagie3
SAY @900424 /*@900424 = ~(Severian retrousse ses manches, révélant des bras bronzés, conservant toutefois ses mitaines.) Ce n'est pas du haut vol comme tu pourrais en voir dans les théâtres ou sur les marchés mais c'est le genre de chose que l'on développe lorsque l'on s'ennuie à attendre un convoi de marchandises. Prête ?~*/
= @900425 /* @900425 = ~(Il vous présente le talisman de Tymora qui ne le quitte jamais et le fait tomber dans sa bouche.)~*/
= @900426 /* @900426 = ~(Puis, après avoir fait mine de s'étouffer, il soulève le bord de sa mitaine et en exhibe la pièce d'argent.)~*/
IF ~~ THEN REPLY @900427 /*@900427 = ~Alors là, j'exige une explication de toute urgence !~*/ GOTO ClicUrgence
IF ~~ THEN REPLY @900428 /*@900428 = ~Laisse-moi voir...Je parie que ce sont deux pièces différentes !~*/ GOTO ClicPiece
IF ~~ THEN REPLY @900429 /*@900429 = ~Mouais, vraiment pas de quoi fouetter un chat, si tu veux mon avis.~*/ GOTO ClicChat
END

IF ~~ THEN BEGIN ClicChat
SAY @900430 /*@900430 = ~(Le jeune homme replace le talisman dans sa poche.) Tu n'es pas très bon public, ma belle.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicUrgence
SAY @900431 /*@900431 = ~(L'halfshade sourit.) Permets-moi de te la refuser sinon, comment pourrais-je bien te distraire ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPiece
SAY @900432 /*@900432 = ~(Severian sourit.) Ah, je suis peut-être un peu tricheur lorsque je joue dans les tavernes, mais aucun de mes tours n'y a recours, je te l'assure.~*/
IF ~~ THEN EXIT
END

// FLIRT 4

IF ~IsGabber(Player1)
    Global("#SClicTalk","GLOBAL",2)
    RandomNum(2,2)
    CombatCounter(0)
    InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEGIN DialClicSecondPalier2
SAY @900434 /*@900434 = ~(Severian est assis et s'emploie à aiguiser une de ses lames à l'aide d'une pierre. Il vous observe vous approcher, l'air guilleret.)~*/
IF ~RandomNum(3,1)~ THEN REPLY @900435 /*@900435 = ~Rien n'entame jamais ta bonne humeur, Severian ?~*/ GOTO ClicEntamer1
IF ~RandomNum(3,2)~ THEN REPLY @900435 /*@900435 = ~Rien n'entame jamais ta bonne humeur, Severian ?~*/ GOTO ClicEntamer2
IF ~RandomNum(3,3)~ THEN REPLY @900435 /*@900435 = ~Rien n'entame jamais ta bonne humeur, Severian ?~*/ GOTO ClicEntamer3
IF ~~ THEN REPLY @900436 /*@900436 = ~Lorsque tout sera fini, est-ce que tu me...quitteras, Severian ?~*/ GOTO ClicFini
IF ~RandomNum(3,1)~ THEN REPLY @900438 /*@900438 = ~(Vous venez vous placer derrière lui.) Un petit massage, peut-être ? Pour te détendre ?~*/ GOTO ClicDetendre1
IF ~RandomNum(3,2)~ THEN REPLY @900438 /*@900438 = ~(Vous venez vous placer derrière lui.) Un petit massage, peut-être ? Pour te détendre ?~*/ GOTO ClicDetendre2
IF ~RandomNum(3,3)~ THEN REPLY @900438 /*@900438 = ~(Vous venez vous placer derrière lui.) Un petit massage, peut-être ? Pour te détendre ?~*/ GOTO ClicDetendre3
IF ~~ THEN REPLY @900439 /*@900439 = ~D'où te vient la maîtrise de l'arme blanche, Severian ?~*/ GOTO ClicEpee
IF ~~ THEN REPLY @900440 /*@900440 = ~(Vous roulez des hanches.) Je me demande ce que je pourrais bien faire pour te détourner de cette maudite épée...~*/ GOTO ClicHanches
IF ~~ THEN REPLY @900441 /*@900441 = ~J'ai une furieuse envie de boire quelque chose de fort. N'aurais-tu pas quelque alcool en réserve ?~*/ GOTO ClicAlcool
IF ~RandomNum(3,1)~ THEN REPLY @900442 /*@900442 = ~Comment me trouves-tu, Severian ? Je veux dire, est-ce que je te plais ?~*/ GOTO ClicTePlaire1
IF ~RandomNum(3,2)~ THEN REPLY @900442 /*@900442 = ~Comment me trouves-tu, Severian ? Je veux dire, est-ce que je te plais ?~*/ GOTO ClicTePlaire2
IF ~RandomNum(3,3)~ THEN REPLY @900442 /*@900442 = ~Comment me trouves-tu, Severian ? Je veux dire, est-ce que je te plais ?~*/ GOTO ClicTePlaire3
IF ~RandomNum(3,1)~ THEN REPLY @900443 /*@900443 = ~Je suis heureuse de t'avoir à mes côtés, tu sais...~*/ GOTO ClicAvoirCote1
IF ~RandomNum(3,2)~ THEN REPLY @900443 /*@900443 = ~Je suis heureuse de t'avoir à mes côtés, tu sais...~*/ GOTO ClicAvoirCote2
IF ~RandomNum(3,3)~ THEN REPLY @900443 /*@900443 = ~Je suis heureuse de t'avoir à mes côtés, tu sais...~*/ GOTO ClicAvoirCote3
IF ~RandomNum(3,1)~ THEN REPLY @900444 /*@900444 = ~Qu'est-ce qui te guide dans cette violence sans fin, Severian ?~*/ GOTO ClicViolence1
IF ~RandomNum(3,2)~ THEN REPLY @900444 /*@900444 = ~Qu'est-ce qui te guide dans cette violence sans fin, Severian ?~*/ GOTO ClicViolence2
IF ~RandomNum(3,3)~ THEN REPLY @900444 /*@900444 = ~Qu'est-ce qui te guide dans cette violence sans fin, Severian ?~*/ GOTO ClicViolence3
IF ~RandomNum(3,1)~ THEN REPLY @900445 /*@900445 = ~(Vous venez vous asseoir près de lui.)~*/ GOTO ClicAssis1
IF ~RandomNum(3,2)~ THEN REPLY @900445 /*@900445 = ~(Vous venez vous asseoir près de lui.)~*/ GOTO ClicAssis2
IF ~RandomNum(3,3)~ THEN REPLY @900445 /*@900445 = ~(Vous venez vous asseoir près de lui.)~*/ GOTO ClicAssis3
END

IF ~~ THEN BEGIN ClicAssis3
SAY @900446 /*@900446 = ~(Severian en oublie ses épées et place son bras autour de votre épaule. Il vous sourit, radieux.) Me voilà en bien agréable compagnie...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAssis2
SAY @900447 /*@900447 = ~(Le jeune homme demeure silencieux et hasarde sa main sous votre menton pour en dessiner les contours, tandis que ses yeux gris plongent dans les vôtres.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAssis1
SAY @900448 /*@900448 = ~(Severian continue son manège, imperturbable. Vous le regardez faire, aiguisant, polissant la lame jusqu'à lui conférer un parfait éclat meurtrier.) C'est ainsi que je l'aime, <CHARNAME> : bien entretenue, cette épée me sera toujours fidèle. C'est un peu comme une belle femme que l'on se plaît à chérir.~*/
IF ~~ THEN REPLY @900449 /*@900449 = ~(Vous esquissez un clin d'oeil.) 'Comme Une belle femme que l'on se plaît à chérir'? C'est une drôle de comparaison mais je ne suis pas surprise.~*/ GOTO ClicCherir
IF ~~ THEN REPLY @900450 /*@900450 = ~Si tu les chéris, tes amis seront tout autant fidèles que cette épée.~*/ GOTO ClicAmis
IF ~~ THEN REPLY @900451 /*@900451 = ~(Vous soupirez.) J'aurais vraiment tout entendu aujourd'hui.~*/ GOTO ClicEntendu
END

IF ~~ THEN BEGIN ClicEntendu
SAY @900452 /*@900452 = ~Mais c'est plein de bon sens, si tu prends la peine d'y réfléchir un instant. Je ne me laisserai jamais surprendre désarmé, quant à moi.~*/
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN ClicAmis
SAY @900453 /*@900453 = ~Je les chéris, <CHARNAME>. Toi plus que tout autre, d'ailleurs. Je revis parfois en pensée notre première rencontre au Mithrest et je me demande où j'en serai aujourd'hui si je ne t'avais pas suivie.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCherir
SAY @900454 /*@900454 = ~(Le hors-la-loi lâche un petit rire sans cesser de faire chanter la pierre sur le métal.) Je la trouve appropriée. Ces lames sont en quelque sorte mes compagnes d'aventure.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicViolence1
SAY @900455 /*@900455 = ~Lorsque la violence t'est une compagne familière depuis l'adolescence, tu finis par t'en accommoder et je crois que je ne t'apprends rien. Au reste, je n'ai jamais vraiment eu beaucoup le choix et s'il y a une chose que la vie m'a apprise, c'est que la loi du plus fort prévaut sur tout autre règle. Si tu ne fais rien, tu n'as plus qu'à te coucher là et mourir.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicViolence2
SAY @900456 /*@900456 = ~Je crois que la réponse que tu attends se trouve déjà dans ta propre histoire, <CHARNAME>. Après tout, tu as bien fui de Château-Suif pour sauver ta vie, non ? Et tu as combattu par la suite pour la conserver, poussée par ton instinct de survie. C'est la même chose pour moi, tout simplement.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicViolence3
SAY @900457 /*@900457 = ~Ne crois pas que j'en retire du plaisir, <CHARNAME>. Je défends mon droit à la vie, tout comme toi. Trop de gens ont cru pouvoir s'arroger le droit de m'en retirer la jouissance, au nom de quoi ? User de violence m'a permis de rester en vie jusqu'ici...(Severian esquisse un sourire malicieux.) Et si je m'étais fait massacrer, qui aurait protégé tes arrières, hein ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAvoirCote1
SAY @900458 /*@900458 = ~(Le sourire du jeune homme s'estompe peu à peu tandis qu'il prend conscience de votre expression débordante de tendresse.) Moi aussi, <CHARNAME>. Moi aussi...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAvoirCote2
SAY @900459 /*@900459 = ~(Le crissement de la pierre sur le métal s'interrompt.) Avant de te rencontrer, je n'étais pas spécialement enclin à faire le bien, vois-tu. J'ai toujours agi égoïstement et si j'ai parfois fréquenté des bandes, c'était dans mes seuls intérêts. Aujourd'hui, avec toi, je sais que je peux devenir meilleur. Je suis heureux d'être en ta compagnie, <CHARNAME>.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAvoirCote3
SAY @900460 /*@900460 = ~Et que trouves-tu chez moi qui te rende si heureuse ?~*/
IF ~~ THEN REPLY @900461 /*@900461 = ~Ta vaillance et ta maîtrise de l'épée, voilà ce que j'aime chez toi.~*/ GOTO ClicVaillance
IF ~~ THEN REPLY @900462 /*@900462 = ~Eh bien, je dois avouer que tu es très séduisant, Severian.~*/ GOTO ClicTresSeduisant
IF ~~ THEN REPLY @900463 /*@900463 = ~Tes taquineries et ton optimisme me manqueraient cruellement.~*/ GOTO ClicManquer
IF ~~ THEN REPLY @900464 /*@900464 = ~C'est un tout, Severian. Tu possèdes de multiples facettes qui forment un tout harmonieux et agréable.~*/ GOTO ClicFacette
END

IF ~~ THEN BEGIN ClicVaillance
SAY @900465 /*@900465 = ~(Severian fait pivoter la garde de son épée entre ses doigts, songeur. Il semble un peu déçu par votre réponse.) S'il n'y a que ça pour te rendre heureuse, je veux bien être ton garde du corps aussi longtemps que tu le voudras.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTresSeduisant
SAY @900466 /*@900466 = ~(Le jeune homme lâche un petit rire.) Prends garde dans ce cas que je n'abuse de mon pouvoir de séduction car ce n'est pas l'envie qui m'en manque, ma foi...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicManquer
SAY @900467 /*@900467 = ~(Le hors-la-loi ébauche une grimace cocasse.) Je suis toujours prêt à te distraire entre deux batailles, <CHARNAME>. Tu as besoin d'oublier l'amertume des combats.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicFacette
SAY @900468 /*@900468 = ~(Severian place son épée à côté de lui, pose ses coudes sur ses genoux et croise les mains, pensif.) J'ai l'impression que tu m'idéalises un peu trop, <CHARNAME>. Je suis loin d'être l'homme parfait.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTePlaire1
SAY @900469 /*@900469 = ~(Severian délaisse son arme et semble réfléchir à sa réponse.) Es-tu donc si peu consciente de tes atouts que tu te sentes obligée de me poser cette question ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTePlaire2
SAY @900470 /*@900470 = ~(Le jeune homme s'interrompt un instant avant de se repencher sur son épée, sans vous regarder le moins du monde.) Tu as le chic pour me poser de ces questions, parfois...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTePlaire3
SAY @900471 /*@900471 = ~(L'halfshade laisse sa pierre de côté et jauge des yeux le tranchant de sa lame.) Tu es une belle femme pleine d'énergie et d'intelligence, <CHARNAME>. Beaucoup d'hommes envieront celui qui gagnera tes faveurs...Rassurée ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAlcool
SAY @900472 /*@900472 = ~(Severian exhibe une outre d'alcool de son sac de voyage et l'agite sous votre nez, sceptique.) Quelque chose à oublier, peut-être ?~*/
IF ~~ THEN REPLY @900473 /*@900473 = ~L'envie de partager quelque chose avec toi, tout simplement.~*/ GOTO ClicSimplement
IF ~~ THEN REPLY @900474 /*@900474 = ~Oublier la mort et la tristesse, quelques instants, oui.~*/ GOTO ClicMort
IF ~~ THEN REPLY @900475 /*@900475 = ~Tu ne me crois pas capable de descendre ce truc ?~*/ GOTO ClicDescendre
END

IF ~~ THEN BEGIN ClicDescendre
SAY @900476 /*@900476 = ~(Le jeune homme vous observe boire le contenu de l'outre avant d'attraper votre main. Il vous sourit.) Eh ! Je ne pensais rien de tel...Tu n'es pas obligée de tout boire pour m'en mettre plein la vue, tu sais...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMort
SAY @900477 /*@900477 = ~(Le jeune homme vous regarde boire sans conviction.) Tu n'as pourtant pas l'air convaincu. Mais il est vrai que si cela peut te faire oublier, ce ne sera que pour quelques instants. Et le remède peut parfois être pire que le mal...(Severian sourit.) Eh, fais quand même en sorte de ne pas rouler par terre...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSimplement
SAY @900478 /*@900478 = ~(Vous buvez jusqu'à plus soif avant de lui rendre le breuvage. Le hors-la-loi s'y met aussi franchement puis s'essuie la bouche du revers de sa manche.) Ta conception du partage me plaît, ma belle. En tout cas, j'ai rarement vu de femmes boire comme tu le fais. Rappelle-moi de toujours la garder remplie, à ton intention.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicHanches
SAY @900479 /*@900479 = ~(L'halfshade lève un sourcil avant d'étendre ses jambes, les mains derrière la nuque.) Tu n'aurais pas besoin de chercher longtemps, <CHARNAME>. Fais marcher ton imagination. Alors ?~*/
IF ~~ THEN REPLY @900480 /*@900480 = (Vous vous installez sur lui à califourchon et placez vos bras autour de son cou.) Qu'est-ce que tu penses de ça ?~*/ GOTO ClicCalifourchon
IF ~~ THEN REPLY @900481 /*@900481 = ~Si tu t'attends à ce que j'exécute une danse du ventre comme tes calishites, tu te mets le doigt dans l'oeil.~*/ GOTO ClicDanse
IF ~~ THEN REPLY @900482 /*@900482 = ~Tu ne t'arrêtes jamais, Severian ?~*/ GOTO ClicSarreter
END

IF ~~ THEN BEGIN ClicSarreter
SAY @900483 /*@900483 = ~Eh bien, à ce que je sache, c'est toi qui as commencé à me chercher, ma jolie.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDanse
SAY @900484 /*@900484 = ~Il faut savoir un peu ce que tu veux, à la fin. Tu t'es montrée plus que suggestive, il me semble.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCalifourchon
SAY @900485 /*@900485 = ~(Le jeune homme cligne des yeux, pris de court.) Oh...Eh bien, je dois dire que ta tactique marche à merveille. Mon épée me paraît bien insignifiante, à présent...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEpee
SAY @900486 /*@900486 = ~Avant que ma mère ne disparaisse, j'avais l'habitude de courir dans les bois avec Onyx. Un jour, je suis tombé sur une ancienne sépulture, de celles que l'on disait appartenir aux Premiers-Nés de Tiraslyn. En poussant quelques pierres, j'ai déniché une épée et l'ai traîné à la maison, à la seule force de mes bras d'enfant. C'est la première arme qui m'est tombée sous la main et elle me servit bien par la suite.~*/
= @900487 /* @900487 = ~Et comme tu le vois, deux épées entre les mains d'un halfshade sont bien plus meurtrières qu'un arc maladroitement bandé...~ */
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDetendre1
SAY @900488 /*@900488 = ~(Severian vous abandonne ses épaules, penchant la tête en avant.) Il est vrai que depuis que nous voyageons ensemble, j'ai plus que ma dose de tensions quotidiennes. Ce sera une agréable compensation.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDetendre2
SAY @900489 /*@900489 = ~(L'halfshade hésite avant de vous laisser agir.) Tu as des mains de déesse, <CHARNAME>. Devant tant de douceur, j'ai peine à croire qu'elles peuvent aussi donner la mort.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDetendre3
SAY @900490 /*@900490 = ~(L'halfshade se met à rire en secouant la tête.) Inutile, je ne suis pas tendu, <CHARNAME>. Non : je réfléchis simplement. J'aime me retrouver seul avec moi-même, parfois.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicFini
SAY @900491 /*@900491 = ~Je n'ai pas l'intention de te quitter, <CHARNAME>, ni pendant, ni après. A vrai dire, la seule chose qui pourrait m'empêcher de demeurer à tes côtés serait la mort (Severian sourit.) Dit comme ça, c'est un peu trop solennel, mais c'est pourtant la vérité.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEntamer1
SAY @900492 /*@900492 = ~C'est que tu ne m'as encore jamais vu grognon. Je t'assure que dans ce cas, il ne fait pas bon être dans les parages.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEntamer2
SAY @900493 /*@900493 = ~Je dois dire que dans l'ensemble, nous nous débrouillons plutôt bien. Voilà qui contribue à alimenter ma bonne humeur coutumière.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEntamer3
SAY @900494 /*@900494 = ~Certaines choses le peuvent assurément mais jusqu'ici, ma bonne humeur n'a pas eu à en souffrir, <CHARNAME>.~*/
IF ~~ THEN EXIT
END

// FLIRT 5 (JOUR, EXTERIEUR)

IF ~IsGabber(Player1)
    Global("#SClicTalk","GLOBAL",4)
    TimeGT(6)
    TimeLT(21)
    OR(16)
    !AreaCheck("AR0021")
    !AreaCheck("AR0022")
    !AreaCheck("AR0313")
    !AreaCheck("AR0314")
    !AreaCheck("AR0406")
    !AreaCheck("AR0509")
    !AreaCheck("AR0510")
    !AreaCheck("AR0511")
    !AreaCheck("AR0704")
    !AreaCheck("AR2010")
    !AreaCheck("AR2202")
    !AreaCheck("AR2203")
    !AreaCheck("AR0709")
    !AreaCheck("AR0712")
    !AreaCheck("AR1105")
    !AreaCheck("AR1602")
    CombatCounter(0)
    InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEGIN DialClicPalierTrois1
SAY @900496 /*@900496 = ~(Comme à son habitude, Severian tient le rôle de l'arrière-garde, bien que de temps à autre, il vienne vous tenir compagnie, pour un baiser volé, ou un échange de regards. Vous le rejoignez et il vous prend spontanément la main.)~*/
IF ~RandomNum(3,1)~ THEN REPLY @900497 /*@900497 = ~(Vous l'embrassez avec fougue.)~*/ GOTO ClicFougue1
IF ~RandomNum(3,2)~ THEN REPLY @900497 /*@900497 = ~(Vous l'embrassez avec fougue.)~*/ GOTO ClicFougue2
IF ~RandomNum(3,3)~ THEN REPLY @900497 /*@900497 = ~(Vous l'embrassez avec fougue.)~*/ GOTO ClicFougue3
IF ~~ THEN REPLY @900498 /*@900498 = ~(Vous tirez Severian par la manche, lubrique à souhait.) Et si tu venais par là, Severian ? J'ai quelque chose à te montrer...~*/ GOTO ClicQuelqueChose1
IF ~RandomNum(3,1)~ THEN REPLY @900499 /*@900499 = ~(Vous glissez vos bras autour de sa taille.)~*/ GOTO ClicTaille1
IF ~RandomNum(3,2)~ THEN REPLY @900499 /*@900499 = ~(Vous glissez vos bras autour de sa taille.)~*/ GOTO ClicTaille2
IF ~RandomNum(3,3)~ THEN REPLY @900499 /*@900499 = ~(Vous glissez vos bras autour de sa taille.)~*/ GOTO ClicTaille3
IF ~~ THEN REPLY @900500 /*@900500 = ~(Vous placez vos mains sur ses épaules et l'embrassez sensuellement dans le cou.)~*/ GOTO ClicEpaules
IF ~~ THEN REPLY @900501 /*@900501 = ~(Vous aventurez vos mains sous son pourpoint pour caresser sa poitrine.)~*/ GOTO ClicPoitrine
IF ~RandomNum(3,1)~ THEN REPLY @900502 /*@900502 = ~(Vous le regardez avec amour.) Je t'aime, Severian.~*/ GOTO ClicAmour1
IF ~RandomNum(3,2)~ THEN REPLY @900502 /*@900502 = ~(Vous le regardez avec amour.) Je t'aime, Severian.~*/ GOTO ClicAmour2
IF ~RandomNum(3,3)~ THEN REPLY @900502 /*@900502 = ~(Vous le regardez avec amour.) Je t'aime, Severian.~*/ GOTO ClicAmour3
IF ~RandomNum(2,1)~ THEN REPLY @900503 /*@900503 = ~Comment ça va, Sevychou ?~*/ GOTO ClicSevychou1
IF ~RandomNum(2,2)~ THEN REPLY @900503 /*@900503 = ~Comment ça va, Sevychou ?~*/ GOTO ClicSevychou2
IF ~RandomNum(2,1)~ THEN REPLY @900504 /*@900504 = ~(Vous lui caressez les cheveux et le dos avant de descendre plus bas, vers ses fesses.)~*/ GOTO ClicDescendre1
IF ~RandomNum(2,2)~ THEN REPLY @900504 /*@900504 = ~(Vous lui caressez les cheveux et le dos avant de descendre plus bas, vers ses fesses.)~*/ GOTO ClicDescendre2
IF ~RandomNum(3,1)~ THEN REPLY @900509 /*@900509 = ~(Vous aventurez une main au niveau de son entrejambe, dans l'espoir de susciter chez lui un certain émoi.)~*/ GOTO ClicPantalon1
IF ~RandomNum(3,2)~ THEN REPLY @900509 /*@900509 = ~(Vous aventurez une main au niveau de son entrejambe, dans l'espoir de susciter chez lui un certain émoi.)~*/ GOTO ClicPantalon2
IF ~RandomNum(3,3)~ THEN REPLY @900509 /*@900509 = ~(Vous aventurez une main au niveau de son entrejambe, dans l'espoir de susciter chez lui un certain émoi.)~*/ GOTO ClicPantalon3
IF ~RandomNum(3,1)~ THEN REPLY @900505 /*@900505 = ~(Vous prenez son visage au creux de vos mains et l'embrassez sur le nez, les yeux, la bouche, les joues, le front.)~*/ GOTO ClicVisage1
IF ~RandomNum(3,2)~ THEN REPLY @900505 /*@900505 = ~(Vous prenez son visage au creux de vos mains et l'embrassez sur le nez, les yeux, la bouche, les joues, le front.)~*/ GOTO ClicVisage2
IF ~RandomNum(3,3)~ THEN REPLY @900505 /*@900505 = ~(Vous prenez son visage au creux de vos mains et l'embrassez sur le nez, les yeux, la bouche, les joues, le front.)~*/ GOTO ClicVisage3
IF ~~ THEN REPLY @900506 /*@900506 = ~Comment te sens-tu depuis que Mailikki a posé les yeux sur toi ?~*/ GOTO ClicMailikki
IF ~~ THEN REPLY @900507 /*@900507 = ~Est-ce qu'il t'arrive de penser encore à Hariel ?~*/ GOTO ClicHariel
IF ~~ THEN REPLY @900508 /*@900508 = ~Sorkailen et Vesthara sont morts de notre main, et ils partageaient ton sang. Ressens-tu quelque chose ?~*/ GOTO ClicSang
END

IF ~~ THEN BEGIN ClicSang
SAY @900510 /*@900510 = ~Qu'ils aient partagé mon sang, qu'il aient été fils et fille de mon père, cela me trouble. Si je ne t'avais pas rencontré, sans doute aurais-je fini comme eux, le coeur envahi de noirceur. Cependant, je ne regrette rien, <CHARNAME>. Ils ont tué Elvaar, Hariel et m'ont traqué durant des années, sans aucun répit. Ils m'ont forcé à fuir toujours plus loin à travers les Plans jusque sur Toril. Ils ont mérité leur sort.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicHariel
SAY @900511 /*@900511 = ~J'ignore si ta question est motivée par la jalousie mais je te répondrai franchement, <CHARNAME> : oui, je pense toujours à Hariel. Comment pourrais-je l'oublier ? Mais tu le sais, je ne l'ai jamais aimé comme aurais aimé un amant. Je l'ai chérie comme une soeur. Je crains de vivre avec son souvenir jusqu'à la fin de ma vie mais c'est ainsi pour tous ceux qui ont perdu des êtres chers. Tu ne peux avoir oublié Gorion, toi non plus.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMailikki
SAY @900512 /*@900512 = ~Mailikki est si semblable à Syvane...Me savoir béni par elle, sur Toril, me donne l'impression d'avoir retrouvé Tiraslyn. Et puis...(Severian vous serre contre lui.) S'il advenait que je meurs, je ne serai cependant jamais bien loin de toi, demeurant aux côtés de la Dame de la Forêt au lieu de disparaître dans les limbes à tout jamais. Mais je te rassure : le plus tard sera le mieux ! Je n'ai pas l'intention de te quitter de mon propre chef.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicVisage1
SAY @900513 /*@900513 = ~(Le jeune homme ferme les yeux sous vos caresses, passant ses mains dans votre chevelure avant de chercher votre cou pour y goûter la douceur de votre peau. Ses mains, quant à elle, vont chercher au niveau de votre poitrine, pour y apprécier le galbe attrayant.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicVisage2
SAY @900514 /*@900514 = ~(La respiration de Severian s'intensifie légèrement sous l'effet du désir qui l'anime tandis que vous lui dispensez vos cajôleries.) Tu me fais tourner la tête, <CHARNAME>. Je suis fou de toi, il n'y a pas d'autre expression.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicVisage3
SAY @900515 /*@900515 = ~(L'halfshade reçoit vos baisers, fiévreux, non sans vous les rendre au centuple. Prenant votre visage entre ses mains, il vous embrasse à pleine bouche.) Tes lèvres ont le goût du miel. Je ne m'en lasserai jamais.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPantalon1
SAY @900516 /*@900516 = ~(Le jeune homme prend une inspiration et détourne les yeux, vérifiant que personne ne vous voit.) Euh, <CHARNAME>...Je...Je ne crois pas que ce soit...le moment pour ce genre de chose...Euh...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPantalon2
SAY @900517 /*@900517 = ~(Severian retire votre main avec une précipitation gênée.) Il y a un moment pour tout, <CHARNAME>. Et là, ce n'est vraiment, mais alors vraiment pas le moment...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPantalon3
SAY @900518 /*@900518 = ~(Severian pousse un 'ouf' surpris et éloigne votre main.) Voudrais-tu par hasard, me faire perdre tous mes moyens face à l'ennemi ? Continue comme ça et je vais réellement devenir fou !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDescendre1
SAY @900519 /*@900519 = ~(L'halfshade vous toise d'un air complice avant de faire de même avec votre postérieur.) Jusqu'ici, je n'avais que le droit de l'admirer. Il est temps que je me rattrape, hein ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicDescendre2
SAY @900520 /*@900520 = ~(En retour, le jeune homme vous pince légèrement la fesse.) Dis-donc, ça manque de fermeté, tout ça...~*/
IF ~~ THEN REPLY @900521 /*@900521 = ~Tu plaisantes, j'espère ! Je fais de l'exercice tous les jours.~*/ GOTO ClicExercice
IF ~~ THEN REPLY @900522 /*@900522 = ~C'est peut-être vrai mais tu n'es pas mieux !~*/ GOTO ClicMieux
IF ~~ THEN REPLY @900523 /*@900523 = ~Si ça te déplaît à ce point, ôte donc tes mains de là !~*/ GOTO ClicOter
END

IF ~~ THEN BEGIN ClicOter
SAY @900524 /*@900524 = ~Mes mains sont très bien là où elles sont. Je plaisantais, <CHARNAME>...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicExercice
SAY @900525 /*@900525 = ~Depuis le temps que tu es habituée à mes taquineries, je n'aurais pas cru que tu tomberais encore dans le piège, <CHARNAME>.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMieux
SAY @900526 /*@900526 = ~Ah, mon coeur...J'aime quand tu prends la mouche ainsi. En colère, tu es tout aussi charmante.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSevychou1
SAY @900527 /*@900527 = ~(Le jeune homme grimace.) Comment veux-tu que le rude aventurier que je suis accepte ce surnom ridicule ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSevychou2
SAY @900528 /*@900528 = ~(Severian ouvre des yeux ronds.) "Sevychou"?~*/
IF ~~ THEN REPLY @900529 /*@900529 = ~Oui : tu es tellement chou que cela te va comme un gant.~*/ GOTO ClicGant
IF ~~ THEN REPLY @900530 /*@900530 = ~Ah sil te plaît ! Je me suis creusée la tête plusieurs jours pour te dénicher ce surnom adorable.~*/ GOTO ClicSurnom
IF ~~ THEN REPLY @900531 /*@900531 = ~Je sais, c'est ridicule et c'est pour ça que ça te va si bien.~*/ GOTO ClicRidicule
END

IF ~~ THEN BEGIN ClicGant
SAY @900532 /*@900532 = ~(Les yeux gris de Severian s'agrandissent davantage.) "Chou" ? <CHARNAME>, je ne suis pas "chou"!...Ah, on aura tout vu !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicSurnom
SAY @900533 /*@900533 = ~(Le jeune homme se mord la lèvre, grognon.) "Adorable", ça c'est toi qui le dit...Non, vraiment, c'est imprononçable tellement c'est ridicule !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicRidicule
SAY @900534 /*@900534 = ~(Severian vous chatouille.) Est-ce que tu me chercherais par hasard, <CHARNAME> ? Parce que dans ce cas, je te garantis que tu vas me trouver !~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAmour1
SAY @900535 /*@900535 = ~(L'halfshade glisse votre main sous son bras et admire votre beauté en silence, la passion couvant au fond de ses prunelles.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAmour2
SAY @900536 /*@900536 = ~(Severian vous attire à lui et se met à vous embrasser le cou, remontant jusqu'à votre oreille. Sa passion pour vous est évidente.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAmour3
SAY @900537 /*@900537 = ~(Vous sentez sa main se raffermir dans la vôtre.) Tu es la première femme à qui je décide de donner mon coeur sans condition, <CHARNAME>.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPoitrine
SAY @900538 /*@900538 = ~(Le jeune homme arbore un air dépité.) S'il y en a une qui doit apprécier tes caresses, c'est bien mon armure. Maudit soleil...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEpaules
SAY @900539 /*@900539 = ~(L'halfshade vous étreint avec convoitise tandis que vos lèvres courent sur la peau douce et bronzée de sa gorge.) S'il n'y avait pas ce soleil, je ne répondrais plus de moi-même...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTaille1
SAY @900540 /*@900540 = ~(Severian vous entoure de ses bras pour vous frictionner doucement le dos et la nuque, avec sérénité et douceur.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTaille2
SAY @900541 /*@900541 = ~(Sans prévenir, le hors-la-loi vous soulève du sol.) Humpff...Je ne t'aurais pas cru aussi lourde...~*/
IF ~~ THEN REPLY @900542 /*@900542 = ~Ah, descends-moi au lieu de dire des bêtises !~*/ GOTO ClicBetises
IF ~~ THEN REPLY @900543 /*@900543 = ~(Vous commencez à le bécoter sur la bouche et le menton.) Je suis peut-être lourde mais toi, tu es sacrément mal rasé...ça pique, c'est horrible.~*/ GOTO ClicBecoter
IF ~~ THEN REPLY @900544 /*@900544 = ~ça me rappelle un certain épisode avec une mare de boue...~*/ GOTO ClicEpisode
END

IF ~~ THEN BEGIN ClicEpisode
SAY @900545 /*@900545 = ~(Vous retenez un cri alors que Severian fait mine de vous lâcher.) Je t'ai bien eu, hein ? Allons, détends-toi ma puce, il n'y a aucune mare de boue dans les parages...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicBetises
SAY @900546 /*@900546 = ~(Severian obtempère non sans vous dérober un baiser.) Ah, tu n'es vraiment pas à prendre avec des pincettes, si je puis dire...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicBecoter
SAY @900547 /*@900547 = ~(Severian se frotte la mâchoire, goguenard.) Ma virilité te déplaît, <CHARNAME> ? Pourtant, il me semble que tu en étais ravie la dernière fois...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicTaille3
SAY @900548 /*@900548 = ~(Le hors-la-loi joue avec le médaillon, pendu à votre cou, celui-là même qu'il vous a offert à Imnesvale.) Il te va à ravir, mon coeur. Te savoir en sa possession me réconforte : je suis assuré de ta bonne fortune.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicQuelqueChose1
SAY @900549 /*@900549 = ~(Le jeune homme se laisse entraîner à mi-chemin avant de se rétracter, à regret. Il porte sa main en visière pour observer le soleil.) Je crois que tu vas un peu trop vite, <CHARNAME>. Il y en a un ici qui serait trop heureux que je retire mon armure. Tu ne voudrais pas me voir agoniser comme les vampires, si ?~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicFougue2
SAY @900550 /*@900550 = ~<CHARNAME>, tu...Hhmmffff...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicFougue3
SAY @900551 /*@900551 = ~(Severian ouvre de grands yeux hébétés devant la force de votre désir.) Wow...Attends que je reprenne mon souffle et ma riposte sera à la hauteur...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicFougue1
SAY @900551 /*@900552 = ~Severian goûte vos lèvres, sa langue cherchant la vôtre, à la fois avide et tendre. Vous emprisonnez sa nuque dans vos bras, l’attirant à vous. Il répond à votre empressement, ses mains dans votre chevelure, ses baisers se faisant plus pressants. Le sang bat à vos tempes alors que vous perdez le contrôle de vos sens face à ces délicieux assauts...Vos souffles saccadés se mêlent alors que vous le libérez, tous deux fiévreux.~*/
IF ~~ THEN EXIT
END


// FLIRT 5 (NUIT, EXTERIEUR)

IF ~IsGabber(Player1)
    Global("#SClicTalk","GLOBAL",4)
    OR(2)
    TimeLT(6)
    TimeGT(21)
    AreaType(OUTDOOR)
    CombatCounter(0)
    InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEGIN DialClicPalierTrois2
SAY @900553 /*@900553 = ~(La nuit est tombée et vous pouvez déceler la flamme du désir dans les prunelles de Severian alors qu'il se dresse non loin de là, telle une ombre.)~*/
IF ~RandomNum(3,1)~ THEN REPLY @900497 /*@900497 = ~(Vous l'embrassez avec fougue.)~*/ GOTO ClicFougue1
IF ~RandomNum(3,2)~ THEN REPLY @900497 /*@900497 = ~(Vous l'embrassez avec fougue.)~*/ GOTO ClicFougue2
IF ~RandomNum(3,3)~ THEN REPLY @900497 /*@900497 = ~(Vous l'embrassez avec fougue.)~*/ GOTO ClicFougue3
IF ~~ THEN REPLY @900498 /*@900498 = ~(Vous tirez Severian par la manche, lubrique à souhait.) Et si tu venais par là, Severian ? J'ai quelque chose à te montrer...~*/ GOTO ClicQuelqueChose2
IF ~RandomNum(3,1)~ THEN REPLY @900499 /*@900499 = ~(Vous glissez vos bras autour de sa taille.)~*/ GOTO ClicTaille1
IF ~RandomNum(3,2)~ THEN REPLY @900499 /*@900499 = ~(Vous glissez vos bras autour de sa taille.)~*/ GOTO ClicTaille2
IF ~RandomNum(3,3)~ THEN REPLY @900499 /*@900499 = ~(Vous glissez vos bras autour de sa taille.)~*/ GOTO ClicTaille3
IF ~~ THEN REPLY @900500 /*@900500 = ~(Vous placez vos mains sur ses épaules et l'embrassez sensuellement dans le cou.)~*/ GOTO ClicEpaules1
IF ~~ THEN REPLY @900585 /*@900585 = ~(Severian a retiré son armure et Vous pouvez caresser sa poitrine douce et chaude, sous sa chemise.)~*/ GOTO ClicPoitrine1
IF ~RandomNum(3,1)~ THEN REPLY @900502 /*@900502 = ~(Vous le regardez avec amour.) Je t'aime, Severian.~*/ GOTO ClicAmour1
IF ~RandomNum(3,2)~ THEN REPLY @900502 /*@900502 = ~(Vous le regardez avec amour.) Je t'aime, Severian.~*/ GOTO ClicAmour2
IF ~RandomNum(3,3)~ THEN REPLY @900502 /*@900502 = ~(Vous le regardez avec amour.) Je t'aime, Severian.~*/ GOTO ClicAmour3
IF ~RandomNum(2,1)~ THEN REPLY @900503 /*@900503 = ~Comment ça va, Sevychou ?~*/ GOTO ClicSevychou1
IF ~RandomNum(2,2)~ THEN REPLY @900503 /*@900503 = ~Comment ça va, Sevychou ?~*/ GOTO ClicSevychou2
IF ~RandomNum(2,1)~ THEN REPLY @900504 /*@900504 = ~(Vous lui caressez les cheveux et le dos avant de descendre plus bas, vers ses fesses.)~*/ GOTO ClicDescendre1
IF ~RandomNum(2,2)~ THEN REPLY @900504 /*@900504 = ~(Vous lui caressez les cheveux et le dos avant de descendre plus bas, vers ses fesses.)~*/ GOTO ClicDescendre2
IF ~~ THEN REPLY @900509 /*@900509 = ~(Vous aventurez une main au niveau de son entrejambe, dans l'espoir de susciter chez lui un certain émoi.)~*/ GOTO ClicPantalon4
IF ~RandomNum(3,1)~ THEN REPLY @900505 /*@900505 = ~(Vous prenez son visage au creux de vos mains et l'embrassez sur le nez, les yeux, la bouche, les joues, le front.)~*/ GOTO ClicVisage1
IF ~RandomNum(3,2)~ THEN REPLY @900505 /*@900505 = ~(Vous prenez son visage au creux de vos mains et l'embrassez sur le nez, les yeux, la bouche, les joues, le front.)~*/ GOTO ClicVisage2
IF ~RandomNum(3,3)~ THEN REPLY @900505 /*@900505 = ~(Vous prenez son visage au creux de vos mains et l'embrassez sur le nez, les yeux, la bouche, les joues, le front.)~*/ GOTO ClicVisage3
IF ~~ THEN REPLY @900506 /*@900506 = ~Comment te sens-tu depuis que Mailikki a posé les yeux sur toi ?~*/ GOTO ClicMailikki
IF ~~ THEN REPLY @900507 /*@900507 = ~Est-ce qu'il t'arrive de penser encore à Hariel ?~*/ GOTO ClicHariel
IF ~~ THEN REPLY @900508 /*@900508 = ~Sorkailen et Vesthara sont morts de notre main, et ils partageaient ton sang. Ressens-tu quelque chose ?~*/ GOTO ClicSang
END
 

IF ~~ THEN BEGIN ClicQuelqueChose2
SAY @900564 /*@900564 = ~(Le jeune homme se laisse entraîner dans votre sillage, à l'écart des regards indiscrets, la curiosité aiguisée.) Et alors, que voulais-tu me montrer, <CHARNAME> ?~*/
IF ~~ THEN REPLY @900565 /*@900565 = ~(Vous lui retirez son pourpoint et sa chemise.)~*/ GOTO ClicChemise
IF ~~ THEN REPLY @900566 /*@900566 = ~(Vous commencez à défaire votre corsage, mutine.)~*/ GOTO ClicCorsage
IF ~~ THEN REPLY @900567 /*@900567 = ~Oh, excuse-moi : j'avais cru voir quelque chose d'intéressant par ici mais non, il n'y a rien.~*/ GOTO ClicInteressant
END

IF ~~ THEN BEGIN ClicInteressant
SAY @900568 /*@900568 = ~(Severian vous dévisage, sceptique) Mouais...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCorsage
SAY @900569 /*@900569 = ~(L'expression surprise de Severian se mue en un mélange d'adoration et de désir lorsque vous lui dévoilez vos charmes. Sans un mot, il vous saisit par les cuisses et vous porte pour mieux vous embrasser la gorge et la poitrine, avant que vous ne tombiez tous deux, enflammés par le désir.)~*/
= @900570 /*@900570 = ~(Sa peau est un délice alors que vous y portez vos lèvres ; sa chaleur vous enveloppe et vous vous laissez entraîner tous les deux dans les étapes du plaisir, jusqu'à ce que la réalité ne se rappelle à vous. Un dernier baiser et vous ramassez vos vêtements éparpillés sur le sol.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicChemise
SAY @900571 /*@900571 = ~(En silence, Severian saisit votre main dans la sienne pour la poser contre son coeur, avant de retirer son armure aux reflets miroitants, révélant son corps bronzé. Vous l'embrassez passionnément avant de basculer sur lui, à califourchon, retirant vos vêtements un par un.)~*/
= @900572 /*@900572 = ~(Le temps s'écoule comme dans un rêve à mesure que vous déployez les trésors de sensualité insufflés par votre désir, jusqu'à ce que vous demandiez grâce tous deux, vaincus par l'ivresse de l'étreinte.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicPoitrine1
SAY @900554 /*@900554 = ~(Vous laissez courir vos doigts sur sa peau bronzée, déposant ça et là quelques baisers, puis le jeune homme place ses mains sur vos tempes pour mieux vous cajôler : le nez, les oreilles, la gorge, les seins, la bouche, le front, Severian vous couvre de baisers tandis que ses mains vous caressent le fondement, poussé par une passion dévorante. Un regard sur votre décolleté vous indique que Severian a déjà commencé à vous en défaire.) <CHARNAME>...Eloignons-nous un peu, tu veux ?~*/
IF ~~ THEN REPLY @900556 /*@900556 = ~Quoi ? Comme ça ? Ici ? Maintenant ? Tu as perdu la tête ou quoi ?~*/ GOTO ClicPerdu
IF ~~ THEN REPLY @900557 /*@900557 = ~(Vous chuchotez sensuellement à son oreille.) Je vois ce que tu veux dire. Un gros câlin, c'est ça ? Suis-moi...~*/ GOTO ClicCalin
IF ~~ THEN REPLY @900558 /*@900558 = ~Désolée, mais j'ai une affreuse migraine ce soir...~*/ GOTO ClicMigraine
END

IF ~~ THEN BEGIN ClicPantalon4
SAY @900555 /*@900555 = ~(L'obscurité installée vous permet de parvenir à vos fins sans éveiller le moindre soupçon. A peine quelques faibles protestations de Severian, guère plus que des chuchotements dans la nuit, vous parviennent tandis que l'émoi se fait de plus en plus grand en lui.) <CHARNAME>...Trouvons un endroit tranquille, veux-tu ? Sinon, je crois que je vais devenir fou...~*/
IF ~~ THEN REPLY @900556 /*@900556 = ~Quoi ? Comme ça ? Ici ? Maintenant ? Tu as perdu la tête ou quoi ?~*/ GOTO ClicPerdu
IF ~~ THEN REPLY @900557 /*@900557 = ~(Vous chuchotez sensuellement à son oreille.) Je vois ce que tu veux dire. Un gros câlin, c'est ça ? Suis-moi...~*/ GOTO ClicCalin
IF ~~ THEN REPLY @900558 /*@900558 = ~Désolée, mais j'ai une affreuse migraine ce soir...~*/ GOTO ClicMigraine
END

IF ~~ THEN BEGIN ClicPerdu
SAY @900559 /*@900559 = ~(L'halfshade écarte votre main.) Bon, ce que femme veut...Mais dans ce cas, je refuse de me laisser tenter de la sorte car c'est une véritable torture.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicMigraine
SAY @900560 /*@900560 = ~(Le hors-la-loi se mord la lèvre.) Une excuse cent fois rabâchée par la gente féminine, <CHARNAME>. Je me demande ce que je dois en penser, du coup...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCalin
SAY @900561 /*@900561 = ~(Vous entraînez votre amour à l'écart, loin des regards indiscrets. Lorsque vous êtes certains que plus personne ne peut vous épier, vous vous déshabillez mutuellement avec frénésie, échangeant ça et là quelques avides baisers qui vous laissent étourdis et encore plus fébriles. Vous finissez par entraîner Severian sur vous alors que vous sentez sa main se glisser entre vos cuisses.)~*/
= @900562 /*@900562 = ~(Vous poussez des gémissements de plaisir à mesure que celui-ci se fait plus intense tandis que Severian, tout entier consacré à l'effort, vous domine et vous enveloppe de sa chaleur.)~*/
= @900563 /*@900563 = ~(Mais la réalité vous rattrape à mesure que le temps passe et que la fièvre du désir s'estompe. Vous vous rhabillez en silence, sereins et complices.)~*/
IF ~~ THEN EXIT
END


// FLIRT 5 (AUBERGES)

IF ~IsGabber(Player1)
    Global("#SClicTalk","GLOBAL",4)
    OR(16)
    AreaCheck("AR0021")
    AreaCheck("AR0022")
    AreaCheck("AR0313")
    AreaCheck("AR0314")
    AreaCheck("AR0406")
    AreaCheck("AR0509")
    AreaCheck("AR0510")
    AreaCheck("AR0511")
    AreaCheck("AR0704")
    AreaCheck("AR2010")
    AreaCheck("AR2202")
    AreaCheck("AR2203")
    AreaCheck("AR0709")
    AreaCheck("AR0712")
    AreaCheck("AR1105")
    AreaCheck("AR1602")
    CombatCounter(0)
    InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN BEGIN DialClicPalierTrois3
SAY @900573 /*@900573 = ~(Severian observe l'intérieur accueillant de l'auberge et vous jette un coup d'oeil plein d'entrain.)~*/
IF ~RandomNum(3,1)~ THEN REPLY @900497 /*@900497 = ~(Vous l'embrassez avec fougue.)~*/ GOTO ClicFougue1
IF ~RandomNum(3,2)~ THEN REPLY @900497 /*@900497 = ~(Vous l'embrassez avec fougue.)~*/ GOTO ClicFougue2
IF ~RandomNum(3,3)~ THEN REPLY @900497 /*@900497 = ~(Vous l'embrassez avec fougue.)~*/ GOTO ClicFougue3
IF ~~ THEN REPLY @900574 /*@900574 = ~(Vous tirez Severian par la manche.) Que dirais-tu de nous choisir une chambre, Severian ?~*/ GOTO ClicChambre
IF ~RandomNum(3,1)~ THEN REPLY @900499 /*@900499 = ~(Vous glissez vos bras autour de sa taille.)~*/ GOTO ClicTaille1
IF ~RandomNum(3,2)~ THEN REPLY @900499 /*@900499 = ~(Vous glissez vos bras autour de sa taille.)~*/ GOTO ClicTaille2
IF ~RandomNum(3,3)~ THEN REPLY @900499 /*@900499 = ~(Vous glissez vos bras autour de sa taille.)~*/ GOTO ClicTaille3
IF ~~ THEN REPLY @900500 /*@900500 = ~(Vous placez vos mains sur ses épaules et l'embrassez sensuellement dans le cou.)~*/ GOTO ClicEpaules1
IF ~~ THEN REPLY @900586 /*@900586 = ~Je t'offre un verre, Seva ?~*/ GOTO ClicVerre
IF ~RandomNum(3,1)~ THEN REPLY @900502 /*@900502 = ~(Vous le regardez avec amour.) Je t'aime, Severian.~*/ GOTO ClicAmour1
IF ~RandomNum(3,2)~ THEN REPLY @900502 /*@900502 = ~(Vous le regardez avec amour.) Je t'aime, Severian.~*/ GOTO ClicAmour2
IF ~RandomNum(3,3)~ THEN REPLY @900502 /*@900502 = ~(Vous le regardez avec amour.) Je t'aime, Severian.~*/ GOTO ClicAmour3
IF ~RandomNum(2,1)~ THEN REPLY @900503 /*@900503 = ~Comment ça va, Sevychou ?~*/ GOTO ClicSevychou1
IF ~RandomNum(2,2)~ THEN REPLY @900503 /*@900503 = ~Comment ça va, Sevychou ?~*/ GOTO ClicSevychou2
IF ~RandomNum(2,1)~ THEN REPLY @900504 /*@900504 = ~(Vous lui caressez les cheveux et le dos avant de descendre plus bas, vers ses fesses.)~*/ GOTO ClicDescendre1
IF ~RandomNum(2,2)~ THEN REPLY @900504 /*@900504 = ~(Vous lui caressez les cheveux et le dos avant de descendre plus bas, vers ses fesses.)~*/ GOTO ClicDescendre2
IF ~RandomNum(3,1)~ THEN REPLY @900509 /*@900509 = ~(Vous aventurez une main au niveau de son entrejambe, dans l'espoir de susciter chez lui un certain émoi.)~*/ GOTO ClicPantalon1
IF ~RandomNum(3,2)~ THEN REPLY @900509 /*@900509 = ~(Vous aventurez une main au niveau de son entrejambe, dans l'espoir de susciter chez lui un certain émoi.)~*/ GOTO ClicPantalon2
IF ~RandomNum(3,3)~ THEN REPLY @900509 /*@900509 = ~(Vous aventurez une main au niveau de son entrejambe, dans l'espoir de susciter chez lui un certain émoi.)~*/ GOTO ClicPantalon3
IF ~RandomNum(3,1)~ THEN REPLY @900505 /*@900505 = ~(Vous prenez son visage au creux de vos mains et l'embrassez sur le nez, les yeux, la bouche, les joues, le front.)~*/ GOTO ClicVisage1
IF ~RandomNum(3,2)~ THEN REPLY @900505 /*@900505 = ~(Vous prenez son visage au creux de vos mains et l'embrassez sur le nez, les yeux, la bouche, les joues, le front.)~*/ GOTO ClicVisage2
IF ~RandomNum(3,3)~ THEN REPLY @900505 /*@900505 = ~(Vous prenez son visage au creux de vos mains et l'embrassez sur le nez, les yeux, la bouche, les joues, le front.)~*/ GOTO ClicVisage3
IF ~~ THEN REPLY @900506 /*@900506 = ~Comment te sens-tu depuis que Mailikki a posé les yeux sur toi ?~*/ GOTO ClicMailikki
IF ~~ THEN REPLY @900507 /*@900507 = ~Est-ce qu'il t'arrive de penser encore à Hariel ?~*/ GOTO ClicHariel
IF ~~ THEN REPLY @900508 /*@900508 = ~Sorkailen et Vesthara sont morts de notre main, et ils partageaient ton sang. Ressens-tu quelque chose ?~*/ GOTO ClicSang
END

IF ~~ THEN BEGIN ClicVerre
SAY @900575 /*@900575 = ~(Vous choisissez une table à l'écart, près de la cheminée. Severian pose ses pieds sur la table et s'étire comme un chat avant de bourrer sa pipe. Il vous sourit.) Tu te rappelles notre première rencontre au Mithrest ?~*/
IF ~~ REPLY @900576 /*@900576 = ~Comme si c'était hier. Tu avais alors ce même aplomb que je te vois aujourd'hui.~*/ GOTO ClicAplomb
IF ~~ REPLY @900577 /*@900577 = ~Tu m'as fait craquer dès que je t'ai vu. Comment puis-je l'oublier ?~*/ GOTO ClicCraquer
IF ~~ REPLY @900578 /*@900578 = ~Je ne m'en souviens que trop bien. Ce jour-là, j'ai failli finir en pâté pour demi-ogre, par ta faute.~*/ GOTO ClicDemiOgre
END

IF ~~ THEN BEGIN ClicDemiOgre
SAY @900579 /*@900579 = ~(Le hors-la-loi lève sa chope, grinçant.) Ma faute ? Hou hou, ce qu'elle est bonne ! Allons donc, c'est toi qui es venu me parler, je te le rappelle...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicAplomb
SAY @900580 /*@900580 = ~Qui l'eût crû, que nous en serions là aujourd'hui, n'est-ce pas ? Mais il faut dire que tu avais des arguments convaincants...(Severian lève sa chope.) Je trinque à nous deux, mon coeur. Que rien ne se mette entre nous, jamais.~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicCraquer
SAY @900581 /*@900581 = ~(Severian cogne sa chope contre la vôtre en un joyeux tintement.) Et toi, tu n'as pas non plus fini de me faire craquer, avec ton caractère, tes sourires, tes grimaces, tes...ton...euh...~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicChambre
SAY @900582 /*@900582 = ~(Le jeune homme vous suit jusqu'au comptoir où quelques pièces vous assure l'acquisition d'une chambre pour la nuit. Vous montez l'escalier quatre à quatre, riant et blaguant comme des enfants. Lorsque la porte de la chambre se referme sur vous, vous attirez Severian sur le lit.)~*/
= @900583 /*@900583 = ~(Le lit est confortable et le feu crépitant dans l'âtre diffuse une douce chaleur qui vient se mêler à celles de vos corps en proie au désir. Vos langues se cherchent tandis que vous vous prodiguez mutuellement toutes les caresses dictées par la passion.)~*/
= @900584 /*@900584 = ~(Lorsque vous vous réveillez, quelques heures plus tard, vous vous sentez reposée et heureuse, les bras de Severian ensommeillé entourant votre taille, tel un écrin doux et tendre. La route vous appelle.)~*/
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ClicEpaules1
SAY @900585 /*@900585 = ~(L'halfshade vous étreint avec convoitise, énivré par votre parfum.) Te sentir ainsi contre moi est un supplice. Qu'est-ce que tu en dis, <CHARNAME> ? Nous pourrions...~*/
IF ~~ THEN EXIT
END


////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
///////////// INTERJECTIONS


  // CELVAN

  IF ~~ THEN BEGIN SeverCelvan1
    SAY @600041
    IF ~~ THEN EXIT
  END

  // WAYLANE

  IF ~~ THEN BEGIN SeverWaylane2
    SAY @600080
    IF ~~ THEN EXTERN WAYLANE SeverWaylane3
END

IF ~~ THEN BEGIN SeverWaylane4
    SAY @600082
    IF ~~ THEN EXTERN WAYLANE SeverWaylane5
END

// WILFRED LE ROUGE


  IF ~~ THEN BEGIN SeverTrple
    SAY @600084
    IF ~~ THEN EXTERN TRPLE01 18
  END

// AMALAS

  IF ~~ THEN BEGIN SeverAmalas2
   SAY @600259
   IF ~~ THEN EXTERN RUFFIAN SeverAmalas3
  END

  IF ~~ THEN BEGIN SeverAmalas4
   SAY @600261
   IF ~~ THEN EXTERN RUFFIAN SeverAmalas5
  END

// SALVANAS

  IF ~~ THEN BEGIN SeverSalvanas2
   SAY @600405
   IF ~~ THEN EXTERN SALVANAS SeverSalvanas3
  END

  IF ~~ THEN BEGIN SeverSalvanas4
   SAY @600179
   IF ~~ THEN EXTERN SALVANAS SeverSalvanas5
  END

  IF ~~ THEN BEGIN SeverSalvanas6
   SAY @600181
   IF ~~ THEN DO ~SetGlobal("#SeverSalvanas","GLOBAL",1)
                  ActionOverride("Salvanas",EscapeArea())~ EXIT
  END



// RIBALD - MARCHE DE L'AVENTURIER

INTERJECT_COPY_TRANS RIBALD 0 SeverRibald1

  == "#SeverJ"    IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600000
  == RIBALD     IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600001
  == "#SeverJ"    IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600002
  == RIBALD    IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600003
  == "#SeverJ"    IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600004
  == RIBALD    IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600005
END


// ARAN LINVAIL - GUILDE DES VOLEURS DE L'OMBRE


INTERJECT_COPY_TRANS ARAN 0 SeverAran1

  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600015
  == ARAN        IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600016
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600017
  == ARAN        IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600018
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600019
  == ARAN        IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600020
END

// ESCLAVE A DEMI-NUE - CIRQUE

INTERJECT_COPY_TRANS KSLAVE01 8 SeverSlave
  == "#SeverJ"   
IF ~Gender(Player1,"female")
InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600021
END

// LEHTINAN

INTERJECT_COPY_TRANS LEHTIN 8 SeverLehtin
  == LEHTIN   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600022
  == "#SeverJ" IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600023
END


// DOMPTEUR - COURONNE DE CUIVRE

INTERJECT_COPY_TRANS BEAST 0 SeverBeast
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600028
END

// OEIL AVEUGLE

INTERJECT_COPY_TRANS BHEYE 0 SeverBheye
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600029
END

// VALEN

INTERJECT_COPY_TRANS BOANASTE 5 SeverBoanaste1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600036
END

// GARCON CIRQUE

INTERJECT_COPY_TRANS BOY1 0 SeverBoy1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600037
END

// MESSAGER D'ARAN

INTERJECT_COPY_TRANS C6MESS 3 SeverMess1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600038
END

// CALAHAN

INTERJECT_COPY_TRANS CALAHA 0 SeverCalahan
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600039
END



APPEND CELVAN

  IF WEIGHT #-1 ~See("#Severian")
  InParty("#Severian")
 !StateCheck("#Severian",CD_STATE_NOTVALID)
  RandomNum(2,1)
  Global("#SeverCelvan","AR0300",0)~ THEN BEGIN SeverCelvan
    SAY @600040
    IF ~~ THEN DO ~SetGlobal("#SeverCelvan","AR0300",1)~ EXTERN ~#SeverJ~ SeverCelvan1
  END
END

// PORTE SPHERE PLANAIRE

INTERJECT_COPY_TRANS CONPANEL 0 SeverCompanel
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600042
  == CONPANEL IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600043
END


// ROMEO & JULIETTE

INTERJECT_COPY_TRANS CROTHF01 3 SeverRomeo
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600047
END

// ABOLETH

INTERJECT_COPY_TRANS DAABOL 9 SeverAbol
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600048
END

// MARCHAND D'ESCLAVE

INTERJECT_COPY_TRANS DADROW3 6 Severdadr1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600049
END

// DELON

INTERJECT_COPY_TRANS DELON 15 SeverDelon
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600050
END

// DRAGON D'OMBRE

INTERJECT_COPY_TRANS DRAGBLAC 0 Severdragblac
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600051
END

// FIRKRAAG - COURONNE DE CUIVRE

INTERJECT_COPY_TRANS FIRKRA01 5 Severfirkra1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600051
END

INTERJECT_COPY_TRANS FIRKRA01 9 Severfirkra2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600052
  == FIRKRA01 IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600053
END


// FIRKRAAG DRAGON

INTERJECT_COPY_TRANS FIRKRA02 5 Severfirkra3
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600054
END


// LOUPS-GAROUS DONJON DE FIRKRAAG

INTERJECT_COPY_TRANS FIRWLF01 0 Severfirwlf
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600056
END

// ONCLE GERHAR - FAMILLE JANSEN

INTERJECT_COPY_TRANS GERHAR 0 Severgerhar
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600057
END

// PHILOSOPHE PACIFISTE

INTERJECT_COPY_TRANS GPHIL01 3 SeverGphilo
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600058
END

// HABIB

INTERJECT_COPY_TRANS HABIB 0 Severhabib
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600059
END

// RAMPAH

INTERJECT_COPY_TRANS MURDBEGG 12 Severmurdbegg
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600061
END

// ROSE

INTERJECT_COPY_TRANS MURDGIRL 1 Severmurdgirl
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600062
== MURDGIRL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600063
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)
                     Gender(Player1,"male")~ THEN
  @600064
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)
                     Gender(Player1,"female")~ THEN
  @600065
  == MURDGIRL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600572
END

INTERJECT_COPY_TRANS MURDGIRL 0 Severmurdgirl
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600062
== MURDGIRL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600063
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)
                     Gender(Player1,"male")~ THEN
  @600064
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)
                     Gender(Player1,"female")~ THEN
  @600065
  == MURDGIRL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600072
END


// NEEBER - FRANC-MARCHE

INTERJECT_COPY_TRANS NEEBER 5 Severneeber
  == NEEBER   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600066
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600067
  == NEEBER   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600068
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600069
END

INTERJECT_COPY_TRANS NEEBER 10 Severneeber
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600070
END

// CLAIRE

INTERJECT_COPY_TRANS PIRMUR10 4 Severclaire
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600071
END

// SARLES 

INTERJECT_COPY_TRANS SCSARLES 8 SeverSarles
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600072
END

// AVENTURIERS DES VAUX

INTERJECT_COPY_TRANS SEVPAT01 1 SeverSevpat
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600073
END

INTERJECT_COPY_TRANS SEVPAT01 2 kimsevpat2
  == "#SeverJ"  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600074
END

// TANNEUR

INTERJECT_COPY_TRANS TANNER 7 SeverTanneur
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600075
END

// AVENTURIERS EGOUTS

INTERJECT_COPY_TRANS TARNOR 1 SeverTarnor
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600076
END

INTERJECT_COPY_TRANS TARNOR 4 Severtarnor
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600077
  == TARNOR   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600078
END

// PRETRE DE HELM

INTERJECT_COPY_TRANS BHOISIG 11 SeverBhoisig2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600031
  == BHOISIG IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600032
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600033
  == BHOISIG   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600034
END

INTERJECT_COPY_TRANS BHOISIG 33 SeverBhoisig3
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600035
END

// WAYLANE

APPEND WAYLANE

  IF WEIGHT #-5~See("#Severian")
InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)
!StateCheck("#Severian",STATE_SLEEPING)
RandomNum(2,1)
Global("#SeverWaylane","LOCALS",0)~ THEN BEGIN SeverWaylane1
    SAY @600079
    IF ~~ THEN DO ~SetGlobal("#SeverWaylane","LOCALS",1)~ EXTERN ~#SeverJ~ SeverWaylane2
  END

  IF ~~ THEN BEGIN SeverWaylane3
    SAY @600081
    IF ~~ THEN EXTERN ~#SeverJ~ SeverWaylane4
  END

  IF ~~ THEN BEGIN SeverWaylane5
    SAY @600083
    IF ~~ THEN EXIT
  END
END

// WILFRED LE ROUGE


EXTEND_BOTTOM TRPLE01 9
IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN EXTERN ~#SeverJ~ SeverTrple
END

// OGRE - CHEZ LES ILLITHIDS

INTERJECT_COPY_TRANS UDOGRE 6 Severudogre
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600085
  == UDOGRE   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600086
    == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600087
  == UDOGRE   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600088
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600089
END

// SVIRFNEBLIN

INTERJECT_COPY_TRANS UDSVIR03 12 SeverSvirf
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600090
END


// ELHAN

INTERJECT_COPY_TRANS C6ELHAN2 6 SeverElhan1
  == "#SeverJ"  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600096
END

INTERJECT_COPY_TRANS C6ELHAN2 24 SeverElhan2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600097
END

INTERJECT_COPY_TRANS C6ELHAN2 73 SeverElhan3
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600098
END

// CARBOS

INTERJECT_COPY_TRANS CARBOS 2 SeverCarbos
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600099
END


//// FALDORN 

INTERJECT_COPY_TRANS CEFALDOR 2 SeverFaldorn
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600101
== CEFALDOR IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600102
== "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600103
  == CEFALDOR IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600104
END

// LOGAN, SEIGNEUR MARCHAND DE FRANC MARCHE

INTERJECT_COPY_TRANS CELOGAN 11 Severlogan
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600105
END

INTERJECT_COPY_TRANS CELOGAN 59 Kimlogan2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600106
END

// MERE DANS QUARTIER TEMPLE

INTERJECT_COPY_TRANS CLMOM 5 SeverMom
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600107
END

// GAAL 

INTERJECT_COPY_TRANS CSGAAL 11 SeverGaal
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600108
END

// TRAITRE GAAL 

INTERJECT_COPY_TRANS CTRAITOR 2 SeverTraitre
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600109
END

// PRETRESSE DROW

INTERJECT_COPY_TRANS DADROW17 3 SeverPretresse
  == "#SeverJ" IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600110
END

// LADY DELCIA

INTERJECT_COPY_TRANS DELCIA 35 SeverDelcia
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600111
  == DELCIA   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600112
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600113
END

//// DRAGON NOIR

INTERJECT_COPY_TRANS DRAGBLAC 0 SeverDragonnoir
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600114
END

// ELGEA


INTERJECT_COPY_TRANS ELGEA 0 SeverElgea
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600115
END

// LAQUAIS DE FIRKRAAG 

INTERJECT_COPY_TRANS FIRBAN02 0 SeverFirban
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600116
END

// CUISINIER TROLL

INTERJECT_COPY_TRANS FIRTRL01 0 SeverCuisinier
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600117
END

// GARREN WINDSPEAR

INTERJECT_COPY_TRANS GARREN 2 SeverGarren
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600118
END

INTERJECT_COPY_TRANS GARREN 18 SeverGarren2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600119
END

// PAYSAN GEMME

INTERJECT_COPY_TRANS GEMJEB01 0 SeverGemJeb
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600120
 == GEMJEB01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600580
 == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600581
END

INTERJECT_COPY_TRANS GEMJEB01 10 SeverGemJeb2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600121
END

// HENDAK 

INTERJECT_COPY_TRANS HENDAK 1 SeverHendak
  == "#SeverJ" IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600122
END

INTERJECT_COPY_TRANS HENDAK 18 SeverHendak1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600123
END

INTERJECT_COPY_TRANS HENDAK 31 SeverHendak2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600124
  == HENDAK   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600582
END

// HAEGAN

INTERJECT_COPY_TRANS HAEGAN 0 SeverHaegan
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600125
END

// KANGAXX 

INTERJECT_COPY_TRANS HLSKULL 8 SeverDemiliche
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600126
END


INTERJECT_COPY_TRANS HLDEMI 0 SeverDemiliche1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600127
END


INTERJECT_COPY_TRANS HLKANG 1 SeverDemiliche2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600128
  == HLKANG IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600129
END

// COMPOUND

INTERJECT_COPY_TRANS HLKETTA 0 SeverHlketta
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600130
END


// KALAH

INTERJECT_COPY_TRANS KALAH2 13 SeverKalah
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600132
END


// LUSETTE

INTERJECT_COPY_TRANS LUSETTE 15 Severlusette
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600133
END

// MOOK

INTERJECT_COPY_TRANS MOOK 0 SeverMook
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600134
  == MOOK   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600135
END

INTERJECT_COPY_TRANS MOOK 15 SeverMook2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600136
  == MOOK   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600137
END

// ARAN BATEAU

INTERJECT_COPY_TRANS PPARAN2 0 SeverPparan
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600138
END

// BODHI BATEAU

INTERJECT_COPY_TRANS PPBODHI3 0 SeverPpbodhi1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600138
END

// BODHI LABYRINTHE

INTERJECT_COPY_TRANS PPBODHI4 6 SeverPpBodhi2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600139
END

INTERJECT_COPY_TRANS PPBODHI4 20 SeverPpbodhi3
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600140
  == PPBODHI4   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600141
END


// CHEF PIRATE

INTERJECT_COPY_TRANS PPDESH2 0 SeverPpdesh
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600144
END

// IRENICUS ASILE


INTERJECT_COPY_TRANS PPIRENI2 31 SeverIrenicus2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600146
END

// RAELIS

INTERJECT_COPY_TRANS RAELIS 9 SeverRaelis
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600148
END

// ROI SAHUAGIN

INTERJECT_COPY_TRANS SAHKNG01 36 SeverSahkng
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600150
END

INTERJECT_COPY_TRANS SAHKNG01 63 SeverSahkng2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600151
END

// PRINCE SAHUAGIN

INTERJECT_COPY_TRANS SAHPR2 6 SeverSahpr
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600152
END

INTERJECT_COPY_TRANS SAHPR2 5 SeverSahpr2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600153
END

// SAMIA


INTERJECT_COPY_TRANS2 SAMIA 25 SeverSamia2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600155
  == SAMIA   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600156
END

// DRAGON ARGENT

INTERJECT_COPY_TRANS UDSILVER 0 SeverUdsilver
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600157
END

INTERJECT_COPY_TRANS UDSILVER 14 SeverUdsilver2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600158
END

// THUMB

INTERJECT_COPY_TRANS THUMB 0 SeverThumb
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600159
END

// ARDULACE

INTERJECT_COPY_TRANS UDARDUL 16 SeverUdardul
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600160
END

INTERJECT_COPY_TRANS UDARDUL 63 SeverUdardul2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600161
  == UDARDUL IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600162
END

// SOLAUFEIN


INTERJECT_COPY_TRANS UDSOLA01 50 SeverSola
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600164
END


// VISAJ

INTERJECT_COPY_TRANS BREG01 7 SeverBreg1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600166
END

INTERJECT_COPY_TRANS BREG01 34 SeverBreg2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600167
END


// MAGE VS BODHI1

INTERJECT_COPY_TRANS ARNFGT06 0 SeverArnfgt06
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600169
END

// ARAN LINVAIL ENNEMI

INTERJECT_COPY_TRANS ARAN02 0 SeverAran02
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600170
  == ARAN02 IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600171
END

// AVATAR D'AMAUNATOR

INTERJECT_COPY_TRANS RIFTCR04 0 SeverRiftcr
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600172
  == RIFTCR04 IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600173
END

INTERJECT_COPY_TRANS RIFTM01 7 SeverRiftm1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600174
END

INTERJECT_COPY_TRANS RIFTM01 11 SeverRiftm2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600175
END

INTERJECT_COPY_TRANS RIFTM01 12 SeverRiftm3
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600176
END

// MINISTRE LLOYD

INTERJECT_COPY_TRANS UHMAY01 0 SeverLloyd
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600182
END

INTERJECT_COPY_TRANS UHMAY01 5 SeverLloyd1
== UHMAY01 IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600183
  == UHFEM01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600184
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600185
END


INTERJECT_COPY_TRANS UHMAY01 30 SeverLloyd6
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600188
== UHFEM01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600189
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600190
  == UHFEM01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600191
END

INTERJECT_COPY_TRANS UHMAY01 40 SeverLloyd7
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600183
== UHFEM01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600184
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600185
END

// IRENICUS

INTERJECT_COPY_TRANS SUJON 14 SeverSujon
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600192
  == SUJON  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600193
END

// ANNATH

INTERJECT_COPY_TRANS RNGWLF01 14 SeverAnnath
  == RNGWLF01  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600194
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600195
END

// BODHI CHAPITRE 3

INTERJECT_COPY_TRANS BODHI2 5 SeverBodhi
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600196
END

INTERJECT_COPY_TRANS BODHI2 14 SeverBodhi2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600197
  == BODHI2 IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600198
END


// BODHI COMBAT FINAL

INTERJECT_COPY_TRANS C6BODHI 0 SeverBodend
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600199
  == C6BODHI IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN
  @600200
END

INTERJECT_COPY_TRANS C6BODHI 5 SeverBodend
  == "#SeverJ"   IF ~IfValidForPartyDialog("#Severian")~ THEN 
  @600201
END

// 1ERE MORT D'IRENICUS

INTERJECT_COPY_TRANS Player1 16 SeverIrenicus1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600202
END


INTERJECT_COPY_TRANS Player1 25 SeverIrenicus2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)
!Global("#SeverRomanceActive","GLOBAL",2)~ THEN 
  @600203
END

INTERJECT_COPY_TRANS Player1 25 SeverIrenicus3
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)
Global("#SeverRomanceActive","GLOBAL",2)~ THEN 
  @600204
END

// SAEMON

INTERJECT_COPY_TRANS PPSAEM2 0 SeverSaemon
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600205
END

INTERJECT_COPY_TRANS PPSAEM2 19 SeverSaemon2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600206
END

INTERJECT_COPY_TRANS PPSAEM3 1 SeverSaemon3
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600207
END


INTERJECT_COPY_TRANS PPSAEM3 37 SeverSaemon5
  == "#SeverJ"  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600210
  == PPSAEM3 IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
@600211
END

INTERJECT_COPY_TRANS PPSAEM3 57 SeverSaemon6
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600212
END

INTERJECT_COPY_TRANS PPSAEM 1 SeverSaemon7
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600213
END

INTERJECT_COPY_TRANS PPSAEM 13 SeverSaemon8
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600214
  == PPSAEM   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600215
END

INTERJECT_COPY_TRANS PPSAEM 27 SeverSaemon9
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600216
END

INTERJECT_COPY_TRANS PPSAEM 32 SeverSaemon9
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600216
END

INTERJECT_COPY_TRANS PPSAEM 42 SeverSaemon7
    == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600213
END

INTERJECT_COPY_TRANS PPSAEM 52 SeverSaemon8
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600214
  == PPSAEM   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600215
END

INTERJECT_COPY_TRANS PPSAEM 58 SeverSaemon9
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600217
  == PPSAEM   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600218
END

// L'ARBRE DE VIE

EXTEND_BOTTOM Player1 33
IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)
Global("#SeverRomanceActive","GLOBAL",2)~ THEN GOTO SeverTree1
END

EXTEND_BOTTOM Player1 33 
IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)
!Global("#SeverRomanceActive","GLOBAL",2)~ THEN GOTO SeverTree2
END

APPEND Player1
  IF ~~ THEN BEGIN SeverTree1
    SAY @600219 = @600220
    IF ~~ THEN EXTERN "#SeverJ" SeverArbre1
  END

  IF ~~ THEN BEGIN SeverTree2
    SAY @600223
    IF ~~ THEN REPLY @600224 EXTERN "#SeverJ" SeverArbre2
    IF ~~ THEN REPLY @600225 EXTERN "#SeverJ" SeverArbre2
  END

  IF ~~ THEN BEGIN SeverTree3
    SAY @600222
    COPY_TRANS PLAYER1 33
    END

END

APPEND "#SeverJ"
  IF ~~ THEN BEGIN SeverArbre1
    SAY @600221
    IF ~~ THEN EXTERN Player1 SeverTree3
  END

  IF ~~ THEN BEGIN SeverArbre2
    SAY @600226
    COPY_TRANS PLAYER1 33
  END
END

// PHAERE

INTERJECT_COPY_TRANS UDPHAE01 7 SeverPhae
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600227
  == UDPHAE01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600231
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600232
== UDPHAE01   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600233
END

INTERJECT_COPY_TRANS UDPHAE01 24 SeverPhae2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600228
END

INTERJECT_COPY_TRANS UDPHAE01 61 SeverPhae3
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID) !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600229
END

INTERJECT_COPY_TRANS UDPHAE01 84 SeverPhae4
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID) !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600230
END

// PREMIERS VERTIGES

EXTEND_BOTTOM Player1 3
     IF ~IsValidForPartyDialog("#Severian")~ THEN DO ~SetGlobal("SelfTalk","GLOBAL",2)~ EXTERN "#SeverJ" SeverSlayer1
END

APPEND "#SeverJ"

  IF ~~ THEN BEGIN SeverSlayer1
    SAY @600234
    IF ~~ THEN REPLY @600235 GOTO SeverSollicitude
    IF ~~ THEN REPLY @600236 GOTO SeverRecupere
    IF ~~ THEN REPLY @600237 GOTO SeverBesoinAir
  END

  IF ~~ THEN BEGIN SeverSollicitude
    SAY @600238
    IF ~~ THEN  EXIT
  END

  IF ~~ THEN BEGIN SeverRecupere
    SAY @600239
    IF ~~ THEN  EXIT
  END

  IF ~~ THEN BEGIN SeverBesoinAir
    SAY @600240
    IF ~~ THEN  EXIT
  END

END

// PREMIERE TRANSFORMATION

EXTEND_BOTTOM Player1 5
  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN EXTERN "#SeverJ" SeverSlayer2
END

APPEND "#SeverJ"

  IF ~~ THEN BEGIN SeverSlayer2
    SAY @600241
  = @600242
  = @600243
  COPY_TRANS Player1 5
  END
END

// DEUXIEME TRANSFORMATION

EXTEND_BOTTOM PLAYER1 7
IF ~OR(2)
Global("#SeverRomanceActive","GLOBAL",1)
Global("#SeverRomanceActive","GLOBAL",2)
InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN EXTERN "#SeverJ" SeverSlayer3
END

EXTEND_BOTTOM PLAYER1 10
IF ~Global("#SSlayerAttackSeverian","GLOBAL",1) Dead("#Severian")~ THEN DO ~SetGlobal("#SSlayerAttackSeverian","GLOBAL",0)~ GOTO 12
IF ~Global("#SSlayerAttackSeverian","GLOBAL",1) !Dead("#Severian")~ THEN DO ~SetGlobal("#SSlayerAttackSeverian","GLOBAL",0)~ EXTERN "#SeverJ" SeverSlayer4
END	


APPEND "#SeverJ"

  IF ~~ THEN BEGIN SeverSlayer3
    SAY @600244
    IF ~~ THEN REPLY @600245 GOTO PerteControle
    IF ~~ THEN REPLY @600246 GOTO PerteControle
    IF ~~ THEN REPLY @600247 GOTO PerteControle
  END

  IF ~~ THEN BEGIN PerteControle
    SAY @600248
    IF ~~ THEN DO ~SetGlobal("#SSlayerAttackSeverian","GLOBAL",1) 
                   ActionOverride(Player1,ReallyForceSpell(Myself,SLAYER_CHANGE))
                   ActionOverride(Player1,Attack("#Severian"))~ EXIT
  END

  IF ~~ THEN BEGIN SeverSlayer4
    SAY @600249 = @600250 
    IF ~~ THEN EXIT
  END

END

// BERNARD, COURONNE DE CUIVRE

INTERJECT_COPY_TRANS BERNARD 22 SeverBernard
  == BERNARD   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600251
  == "#SeverJ"  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600252
== BERNARD   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600253
  == "#SeverJ"  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600254
== BERNARD   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600255
== BERNARD   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600401
END

// AMALAS, LA COURONNE DE CUIVRE

EXTEND_BOTTOM RUFFIAN 0
IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN EXTERN RUFFIAN SeverAmalas
END

APPEND RUFFIAN

  IF ~~ THEN BEGIN SeverAmalas
    SAY @600258
    IF ~~ THEN DO ~SetGlobal("#SeverAmalas","GLOBAL",1)~ EXTERN ~#SeverJ~ SeverAmalas2
  END

  IF ~~ THEN BEGIN SeverAmalas3
    SAY @600260
    IF ~~ THEN EXTERN ~#SeverJ~ SeverAmalas4
  END

  IF ~~ THEN BEGIN SeverAmalas5
    SAY @600262
    IF ~~ THEN DO ~SetGlobal("#SeverAmalas","GLOBAL",2)
                   ActionOverride("RUFPAL1",EscapeArea())
                   ActionOverride("RUFPAL2",EscapeArea())
                   EscapeArea()~ EXIT
  END
END

// SALVANAS, LA COURONNE DE CUIVRE

EXTEND_BOTTOM SALVANAS 20
IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN EXTERN SALVANAS SeverSalvanas
END

APPEND SALVANAS

  IF ~~ THEN BEGIN SeverSalvanas
   SAY @600177
   IF ~~ THEN EXTERN ~#SeverJ~ SeverSalvanas2
  END

  IF ~~ THEN BEGIN SeverSalvanas3
   SAY @600400
   IF ~~ THEN EXTERN ~#SeverJ~ SeverSalvanas4
  END

  IF ~~ THEN BEGIN SeverSalvanas5
   SAY @600180
   IF ~~ THEN EXTERN ~#SeverJ~ SeverSalvanas6
  END

END

// RENAL BLOODSCALP

INTERJECT_COPY_TRANS RENAL 30 SeverRenal
  == RENAL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600263
  == RENAL  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600264
  == "#SeverJ"  IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600265
== RENAL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600266
== "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600267
== RENAL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600268
END


// KVEROSLAVA, ROM DE FRANC MARCHE

INTERJECT_COPY_TRANS TRGYP02 2 SeverKveroslava
  == TRGYP02   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600276
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600277
  == TRGYP02   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600530
END

// LORD DE LA PENOMBRE

INTERJECT_COPY_TRANS SHADEL 3 SeverShadel
  == SHADEL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600278
 == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600279
 == SHADEL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600280
END

INTERJECT_COPY_TRANS SHADEL 7 SeverShadel
  == SHADEL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600278
 == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600279
 == SHADEL   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600280
END

// DRIZZT

INTERJECT_COPY_TRANS C6DRIZZ1 39 SeverDrizzt
 == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600091

END

// ELLESIME

INTERJECT_COPY_TRANS SUELLEAP 1 SeverEllesime
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600510
END

// MEKRATH

INTERJECT_COPY_TRANS MEKRAT 0 SeverMekrath
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600515
  == MEKRAT   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600516
END

INTERJECT_COPY_TRANS MEKRATH 0 SeverMekrath1
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600515
  == MEKRATH   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600516
END

// IRENICUS COMBAT FINAL

INTERJECT_COPY_TRANS HELLJON 7 SeverHelljon
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600560
END

INTERJECT_COPY_TRANS HELLJON 8 SeverHelljon2
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600560
END

INTERJECT_COPY_TRANS HELLJON 9 SeverHelljon3
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600560
END

INTERJECT_COPY_TRANS HELLJON 10 SeverHelljon4
  == "#SeverJ"   IF ~InParty("#Severian") !StateCheck("#Severian",CD_STATE_NOTVALID)~ THEN 
  @600560
END








