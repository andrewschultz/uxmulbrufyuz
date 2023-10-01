"Uxmulbrufyuz" by Andrew Schultz

the story description is "Bod, bed: bad bid, bud"

release along with an interpreter.

release along with cover art.

the release number is 2.

volume headers

include Trivial Niceties by Andrew Schultz.

include Old School Verb Total Carnage by Andrew Schultz.

include basic screen effects by Emily Short.

paths is a number that varies.

starts is a number that varies.

loops is a number that varies.

a room has a direction called od-dir.

volume beginning

The print final score rule is not listed in for printing the player's obituary.

section nfr - not for release

when play begins:
	now debug-state is true;
	now ignore-wait is true;

section for release

when play begins:
	now right hand status line is "[paths]/[starts]/[loops]";
	now left hand status line is "[location of player] ([number of solved rooms])";
	repeat with Q running through directions:
		if the room Q of Odosto is not nothing, now od-dir of the room Q of Odosto is opposite of Q;
	say "Stupid nightmares. Uxmulbrufyuz only appears at Halloween, though, after you've eaten too much candy. With no way out. Wandering around the various other places. You always felt tongue tied, like you had to do something weird or special to make it so you had no chance to get to Odosto. The place, you heard, where everything was okay. Or, well, it should be. You just needed to...well, you'd figure it when the time came.";
	wfak;
	say "You're older and wiser now. You remember the landscape, and you have the words for what some of the weirder stuff is. But can you actually, you know, make it?";
	wfak;

after looking (this is the where is Odosto rule):
	say "Odosto is to the [od-dir of location of player]. But you feel it pushing you back";
	repeat with Q running through directions:
		let Q2 be the room Q of location of player;
		if Q2 is not nothing:
			if Q2 is visited and Q2 is not solved, say ". [Q2]'s [Q]";
	if number of unknown directions > 0, say ". Mysterious land lies [list of unknown directions]";
	say "."

definition: a direction (called d) is unknown:
	if the room d of location of player is nothing, no;
	if the room d of location of player is Odosto, no;
	if the room d of location of player is not visited, yes;
	no;

volume verbs

instead of waking up:
	say "Well, that's one way to rid yourself of the whole mess.";
	if paths is 0:
		say "[line break]What a weird place. And places. You didn't get anywhere, but sometimes, it's good just to admit you can't and move on with life.";
	else if paths > 11:
		say "[line break]You figured a lot out, but why should you have to get too pedantic and figure everything? That sort of thing takes away time you like to spend watching boring TV reruns.";
	else if starts > 0 or loops > 0:
		say "[line break]You got a few huge chunks in order and the rest is just shifting stuff around. Why bother?";
	else:
		say "[line break]You got the general idea. You're not one for tracing every way you have to go.";
	end the story saying "Bye Bye Uxmulbrufyuz";

carry out looking when location of player is solved:
	say "[location of player] has nothing worth looking at now. It's time to move on.";
	the rule succeeds;

rule for supplying a missing noun when entering:
	say "[if player is in Ebekelmenc]This would be the place to enter, but[else]This isn't the place to enter, and besides,[end if] there's nothing to enter.";

book thinking

instead of thinking:
	if location of player is solved, say "You need to move on!" instead;
	if player is in Aphafaja, say "You need to acclimate yourself...or something." instead;
	if player is in Ebekelmenc, say "There must be several ways to get rid of things." instead;
	if player is in Igwivriqi, say "Maybe you can accuse things of not being real. Or give them, or yourself, character. Or remember what they are." instead;
	if player is in Uxmulbrufyuz, say "Hmm. Maybe a usual prefix would work here. You could take charge, or make things poweless, or something." instead;
	say "This shouldn't have appeared, but it did." instead;

book going

check going:
	if noun is northeast or noun is northwest or noun is southeast or noun is southwest, say "You can't move diagonally, and you don't need to--there's always a cardinal direction that can replace it." instead;
	if noun is up, say "You can't fly. At least, not in this dream." instead;
	if noun is down, say "You don't want to sink into the earth, here." instead;

book score

check requesting the score:
	if number of solved rooms is 0, say "You haven't solved any rooms yet." instead;
	say "You've solved [number of solved rooms]/4 rooms." instead;

book attacking

instead of attacking:
	if player is in Aphafaja, say "That should work, but then, you can't. You're not violent." instead;
	if player is in Ebekelmenc, say "Enfeeblement! Every enzyme emmeshed! ";
	if player is in Igwivriqi, say "Instinct! ";
	if player is in Uxmulbrufyuz, say "Un-fun! ";
	say "This isn't the right place to attack. Even in the right place to attack, it won't work." instead; [okdup]

book waiting

to ring-up (r - a room):
	now r is solved;
	add r to solverooms;

check waiting:
	if flyby is true:
		if location of player is Uxmulbrufyuz:
			ring-up Uxmulbrufyuz;
			say "Right... Uxmulbrufyuz ... dealt with." instead;
		else:
			say "Waiting only works in Uxmulbrufyuz. You now solve a room immediately.";
	if location of player is solved, say "You need to get a move on!" instead;
	if player is in Aphafaja, say "Apathy!" instead;
	if player is in Ebekelmenc, say "Effect: engender eventless evenness." instead; [okdup]
	if player is in Igwivriqi, say "Idling? Insipid!" instead;
	if player is in Uxmulbrufyuz, say "Up! Rush!" instead;

book taking

book singing

instead of singing:
	if player is in Ebekelmenc, say "Elegy, esthete? Elsewhere!" instead;
	continue the action;

book cussing

instead of swearing mildly, try swearing obscenely instead;

instead of swearing obscenely:
	if player is in Aphafaja, say "Aghast!" instead;
	if player is in Ebekelmenc, say "Excess! Excrement!" instead;
	if player is in Igwivriqi, say "Impish incivility, ickily!" instead;
	if player is in Uxmulbrufyuz, say "Unfunny!" instead;
	say "Ssh." instead;

book smelling

before smelling:
	if player is in Ebekelmenc, say "Ethylene? Ethylbenzene?" instead;

volume map

book room definitions

a room can be normal, solved or unreachable. a room is usually normal.

check going to an unreachable room:
	say "Odosto repels you. You haven't earned the right." instead;

check going to a solved room:
	say "No, you escaped, and you don't want to have to find a new idea to get back from there." instead;

every turn when number of normal rooms is 0 (this is the ux rule):	:
	move player to Odosto;
	end the story finally saying "YOU WIN";
	the rule succeeds;

book room names

Uxmulbrufyuz is a room.

Aphafaja is east of Uxmulbrufyuz.

Ebekelmenc is east of Aphafaja.

Igwivriqi is east of Ebekelmenc.

Odosto is east of Igwivriqi.

Uxmulbrufyuz is east of Odosto.

Ebekelmenc is north of Uxmulbrufyuz.

Igwivriqi is north of Aphafaja.

Odosto is north of Ebekelmenc.

Uxmulbrufyuz is north of Igwivriqi.

Aphafaja is north of Odosto.

Odosto is unreachable.

Yuyoyiea is a room. description is "It's nice and relaxed here, with nothing to do, but you miss the challenge, even if it was a grind. You feel stronger for having navigated the four lesser countries, and you realize that even if you don't know how much challenge and conflict you want, you'd like to find it in real life. You were able to see something through and look at it from all sides, even if it wasn't super complex. You wake up, a bit more ready for real life."

chapter room descriptions

description of Uxmulbrufyuz is "Unburnt, unruly undrunk urnfuls. Unsunny, unfussy upbursts uprush.".

description of Aphafaja is "Alfalfa amalgam. Abysmal ashram. Abstact aardvark. Award awash. Arrant arcana. Awkward archway, almanac, acanthas, ashplant, adamant avatar. Aargh! Alack! Alarm!".

description of Ebekelmenc is "Eek! Eel. Even edges ebbed. Elect egrets. Eleven Embers. Entremets ensemble. Esses enmesh entrees. Epergnes, essences. Elderly exercycle. Extreme eyelets. Element emblems. Everymen's etrennes. Elderberry excrescence. Extremely expressly evergreen. Endlessly ensteeped, encrypted. Emergency! Emergency!".

description of Igwivriqi is "Infirm icing. Imbibing ibis. Invincible, invitingly infringing inking. Illicit?".

description of Odosto is "Oozy odor. Oblong oxbow. Octopod offshoots. Ontology onflow!".

instead of doing something with scenery, say "It's just ... there. You can't do much with it." instead;

description of player is "[if player is in Uxmulbrufyuz]U B U. U C U. U R U.[else if player is in Igwivriqi]I C I.[else if player is in Aphafaja]Aww, a sad sack.[else if player is in Ebekelmenc]Eeee! Meee![end if]"

chapter silliness

section a

understand "alas" as a mistake ("Don't give up!") when player is in Aphafaja.

section e

understand "erect" as a mistake ("Eeeep!") when player is in Ebekelmenc.
understand "excrete" as a mistake ("Eeeeewwww.") when player is in Ebekelmenc.
understand "estrepe" as a mistake ("Nothing worth destroying here.") when player is in Ebekelmenc.
understand "embezzle" as a mistake ("Nothing to take here.") when player is in Ebekelmenc.
understand "exegeses" as a mistake ("There is no deeper meaning to all this. Sorry.") when player is in Ebekelmenc.
understand "expert" as a mistake ("You need to do something to show you ARE an expert.") when player is in Ebekelmenc.

section i

understand "insight" as a mistake ("You need an insight here.") when player is in Igwivriqi.
understand "icily" as a mistake ("It's not how you say it, but what you say.") when player is in Igwivriqi.

section u

understand "usury" as a mistake ("You're in a nightmare. You'd get arrested!") when player is in Uxmulbrufyuz.
understand "upturn" as a mistake ("How to make an upturn, though?") when player is in Uxmulbrufyuz.

book solving

to solve (r - a room):
	now r is solved;
	if number of solved rooms is 4, fake-end;

solverooms is a list of rooms variable. solverooms is {}.

to fake-end:
	say "You've made it [one of][or]back [stopping]to Odosto! You pat yourself on the back.";
	say "[line break]'Oho!'[paragraph break]'Conform! Orthodox!'[paragraph break]'Noooo!'[paragraph break]Oops ... oof.";
	if debug-state is true, say "HERE IS THE ORDER YOU DID THINGS IN: [solverooms].";
	repeat through table of end lists:
		if r1 entry is entry 1 of solverooms and r2 entry is entry 2 of solverooms and r3 entry is entry 3 of solverooms and r4 entry is entry 4 of solverooms:
			if done entry is true:
				say "You already did this!";
			else:
				say "Another chunk of Odosto slides into place.";
				now done entry is true;
				let temp be category entry;
				if completed of temp:
					say "[line break]A big chunk, in fact.";
					increment loops;
				if roomcomp of r1 entry:
					say "[line break][r1 entry] begins to shimmer but quickly goes back to normal.";
					increment starts;
				increment paths;
				if paths is 24:
					say "[line break]But you've been through every which way. So you wind up in...[paragraph break]"; [okdup]
					move the player to Yuyoyiea;
					end the story finally saying "More challenges";
					continue the action;
	say "Try again?";
	if paths is 1, say "[line break](Oh! By the way, you won't have to type in all those commands. You can just [bold type]FLYBY[roman type] and solve whatever room you walk next to. Waiting will solve your current room.)[paragraph break]";
	if paths is 2, say "[line break](Oh! Another verb: [bold type]SCRYTRY[roman type] or [bold type]SCRY[roman type] will show you the ways you've been through.)[paragraph break]";
	if the player yes-consents:
		reset-game;
	else:
		end the game saying "Well, you escaped";

to endgame-check:
	if number of solved rooms is 4, fake-end;

to decide whether completed of (i - a number):
	repeat through table of end lists:
		if category entry is i and done entry is false, decide no;
	decide yes;

to decide whether roomcomp of (r - a room):
	repeat through table of end lists:
		if r1 entry is r and done entry is false, decide no;
	decide yes;

to reset-game:
	now solverooms is {};
	now all solved rooms are normal;
	let Q be auto-solve;
	now auto-solve is false;
	move player to Uxmulbrufyuz;
	now auto-solve is Q;

table of end lists
r1	r2	r3	r4	done	category	pathy
Aphafaja	Ebekelmenc	Igwivriqi	Uxmulbrufyuz	false	0	"aeiu"
Aphafaja	Ebekelmenc	Uxmulbrufyuz	Igwivriqi	false	4	"aeui"
Aphafaja	Igwivriqi	Ebekelmenc	Uxmulbrufyuz	false	1	"aieu"
Aphafaja	Igwivriqi	Uxmulbrufyuz	Ebekelmenc	false	2	"aiue"
Aphafaja	Uxmulbrufyuz	Ebekelmenc	Igwivriqi	false	3	"auei"
Aphafaja	Uxmulbrufyuz	Igwivriqi	Ebekelmenc	false	5	"auie"
Ebekelmenc	Aphafaja	Igwivriqi	Uxmulbrufyuz	false	2	"eaiu"
Ebekelmenc	Aphafaja	Uxmulbrufyuz	Igwivriqi	false	5	"eaui"
Ebekelmenc	Igwivriqi	Aphafaja	Uxmulbrufyuz	false	3	"eiau"
Ebekelmenc	Igwivriqi	Uxmulbrufyuz	Aphafaja	false	0	"eiua"
Ebekelmenc	Uxmulbrufyuz	Aphafaja	Igwivriqi	false	1	"euai"
Ebekelmenc	Uxmulbrufyuz	Igwivriqi	Aphafaja	false	4	"euia"
Igwivriqi	Aphafaja	Ebekelmenc	Uxmulbrufyuz	false	4	"iaeu"
Igwivriqi	Aphafaja	Uxmulbrufyuz	Ebekelmenc	false	3	"iaue"
Igwivriqi	Ebekelmenc	Aphafaja	Uxmulbrufyuz	false	5	"ieau"
Igwivriqi	Ebekelmenc	Uxmulbrufyuz	Aphafaja	false	1	"ieua"
Igwivriqi	Uxmulbrufyuz	Aphafaja	Ebekelmenc	false	0	"iuae"
Igwivriqi	Uxmulbrufyuz	Ebekelmenc	Aphafaja	false	2	"iuea"
Uxmulbrufyuz	Aphafaja	Ebekelmenc	Igwivriqi	false	0	"uaei"
Uxmulbrufyuz	Aphafaja	Igwivriqi	Ebekelmenc	false	1	"uaie"
Uxmulbrufyuz	Ebekelmenc	Aphafaja	Igwivriqi	false	2	"ueai"
Uxmulbrufyuz	Ebekelmenc	Igwivriqi	Aphafaja	false	3	"ueia"
Uxmulbrufyuz	Igwivriqi	Aphafaja	Ebekelmenc	false	4	"uiae"
Uxmulbrufyuz	Igwivriqi	Ebekelmenc	Aphafaja	false	5	"uiea"

volume odd verbs

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.

understand "about" as abouting.

carry out abouting:
	say "Ux was the original name for The Problems Compound, my 2015 IFComp entry. The game shifted enough I had to ditch the name, but when Anssi Raisanen mentioned a title with only u's as vowels in his 2017 IFComp prediction, I laughed a bit, then wondered if I could dust the name off and do something with it. The result is this, which I submitted to the 2017 EctoComp Petite Mort division.";
	say "[line break]If you're confused what to do, just type anything. A list of what you can do will pop up on any verb the game doesn't understand. Typing nothing gives a clue, as does THINKing.";
	the rule succeeds;

chapter flybying

flybying is an action applying to nothing.

understand the command "flyby" as something new.

understand "flyby" as flybying.

carry out flybying:
	now flyby is whether or not flyby is false;
	say "[if flyby is true]You see how to fly by rooms as needed. If you start over again in Uxmulbrufyuz, you can just wait to solve it. Otherwise, the next room you go to, you solve as you did before[else]Flyby is now off. You'll have to solve rooms manually[end if].";
	the rule succeeds;

auto-solve is a truth state that varies.

flyby is a truth state that varies.

after going when flyby is true:
	now auto-solve is true;
	continue the action;

this-solve is a truth state that varies.

after looking when auto-solve is true:
	say "Yeah, yeah. You've been here, before. You know what to do, and you do it.";
	ring-up location of player;
	if debug-state is true, say "SOLVED: [solverooms].";
	endgame-check;
	if number of solved rooms is 0, the rule succeeds;
	continue the action;

chapter scrying

scrying is an action out of world.

understand the command "scry" as something new.
understand the command "tryscry" as something new.
understand the command "scrytry" as something new.

understand "scry" as scrying.
understand "tryscry" as scrying.
understand "scrytry" as scrying.

carry out scrying:
	let scry be 0;
	repeat through table of end lists:
		if done entry is true:
			if scry is 0:
				say "Ways to Odosto (in alphabetical order):[line break][fixed letter spacing]";
			else if remainder after dividing scry by 6 is 0:
				say "[line break]";
			if remainder after dividing scry by 6 is not 0, say ", ";
			say "[pathy entry]";
			increment scry;
	if scry is 0:
		say "You haven't found any ways to Odosto yet.";
	else:
		say "[variable letter spacing]";
	the rule succeeds;

volume moving

last-dir is a direction that varies. last-dir is up.

check going:
	if noun is down, say "You can't burrow." instead;
	if noun is up, say "You can't fly." instead;
	[if noun is opposite of last-dir, say "You can't go backwards. You just can't." instead;]
	unless the room noun of location of player is nowhere:
		if the room noun of location of player is normal, now last-dir is noun;

volume advancing verbs

to say not-here-dude of (rm - a room):
	say "That would [if rm is not solved]work[else]have worked[end if] [if rm is visited]in [rm][else]somewhere else[end if] but not here."

book a

chapter a solving

adapting is an action applying to nothing.

understand the command "adapt" as something new.
understand the command "anyway" as something new.
understand the command "appall" as something new.
understand the command "abracadabra" as something new.
understand the command "anarchy" as something new.

understand "adapt" as adapting.
understand "anyway" as adapting.
understand "appall" as adapting.
understand "abracadabra" as adapting.
understand "anarchy" as adapting.

carry out adapting:
	if location of player is not Aphafaja, say "[not-here-dude of Aphafaja]." instead;
	if Aphafaja is solved, say "You've done enough here." instead;
	ring-up Aphafaja;
	say "Aphafaja's scenery crumbles as you realize you don't have to let it limit you.";
	endgame-check;
	the rule succeeds;

book e

chapter e solving

emending is an action applying to nothing.

understand the command "emend" as something new.
understand the command "egress" as something new.
understand the command "excel" as something new.
understand the command "expel" as something new.
understand the command "esteem" as something new.
understand the command "exceed" as something new.
understand the command "exept" as something new.
understand the command "enerve" as something new.
understand the command "exert" as something new.
understand the command "emerge" as something new.
understand the command "eject" as something new.
understand the command "embed" as something new.
understand the command "eschew" as something new.
understand the command "expend" as something new.
understand the command "effervesce" as something new.
understand the command "express" as something new.
understand the command "extend" as something new.
understand the command "entrench" as something new.
understand the command "emcee" as something new.
understand the command "except" as something new.

understand "except" as emending.
understand "emcee" as emending.
understand "egress" as emending.
understand "excel" as emending.
understand "expel" as emending.
understand "esteem" as emending.
understand "exceed" as emending.
understand "exept" as emending.
understand "enerve" as emending.
understand "exert" as emending.
understand "eject" as emending.
understand "embed" as emending.
understand "eschew" as emending.
understand "expend" as emending.
understand "effervesce" as emending.
understand "express" as emending.
understand "extend" as emending.
understand "entrench" as emending.
understand "emerge" as emending.
understand "emend" as emending.

carry out emending:
	if location of player is not Ebekelmenc, say "[not-here-dude of Ebekelmenc]." instead;
	if Ebekelmenc is solved, say "You've done enough here." instead;
	ring-up Ebekelmenc;
	say "Excellent! Perhaps there were many ways to clear Ebekelmenec, but you figured one and didn't get distracted which might be better."; [okdup]
	endgame-check;
	the rule succeeds;

book i

chapter i solving

indicting is an action applying to nothing.

understand the command "indict" as something new.
understand the command "imprint" as something new.
understand the command "instill" as something new.

understand "imprint" as indicting.
understand "instill" as indicting.
understand "indict" as indicting.

carry out indicting:
	if location of player is not Igwivriqi, say "[not-here-dude of Igwivriqi]." instead;
	if Igwivriqi is solved, say "You've done enough here." instead;
	ring-up Igwivriqi;
	say "Everything crumbles a bit. You showed discipline in suggesting it wasn't you that was weird, but your surroundings. Go, you!";
	endgame-check;
	the rule succeeds;

book u

chapter u solving

usurping is an action applying to nothing.

understand the command "usurp" as something new.
understand the command "unplug" as something new.
understand the command "upchuck" as something new.
understand the command "unfurl" as something new.

understand "upchuck" as usurping.
understand "usurp" as usurping.
understand "unplug" as usurping.
understand "unfurl" as usurping.

carry out usurping:
	if location of player is not Uxmulbrufyuz, say "[not-here-dude of Uxmulbrufyuz]." instead;
	if Uxmulbrufyuz is solved, say "You've done enough here." instead;
	ring-up Uxmulbrufyuz;
	say "The scenery around you crumbles. Yay! UPTURN!";
	endgame-check;
	the rule succeeds;

volume parser schtuff

after reading a command:
	if the player's command matches the text " ", say "(NOTE: you only need one-word commands to get through.)[paragraph break]";
	continue the action;

to say right-track:
	say "[if location of player is solved]You don't need to do anything more[else]Something almost happens, but not quite. Maybe you started things wrong[end if]"

to say so-right-track:
	say "[if location of player is solved]You don't need to do anything more here[else if character number 2 in the player's command is character number 1 in the player's command]No, that's a bit too much at the start[else]Something almost happens, but not quite[end if]"

rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "The individual scenery sways and blurs. It seems unimportant. You don't need to meddle with it. Apparently you need to look inside yourself for a solution, and all that self-help jazz."

rule for printing a parser error when the latest parser error is the i beg your pardon error:
	if location of player is solved, say "You figured what to do here. Time to move on." instead;
	say "You think a bit, and the following letters pop unto your mind: ";
	if location of player is Uxmulbrufyuz, say "u-u---.";
	if location of player is Aphafaja, say "a-a--.";
	if location of player is Ebekelmenc, say "e-e-- or e--e-.";
	if location of player is Igwivriqi, say "i--i--.";

rule for printing a parser error when the latest parser error is the not a verb I recognise error:
	if number of characters in the player's command > 1:
		if location of player is Uxmulbrufyuz and the player's command matches the regular expression "<^aeio>":
			if character number 1 in the player's command is "u", say "[so-right-track]." instead;
			if the player's command matches the text "u", say "[right-track]." instead;
		if location of player is Aphafaja and the player's command matches the regular expression "<^eiou>":
			if character number 1 in the player's command is "a", say "[so-right-track]." instead;
			if the player's command matches the text "a", say "[right-track]." instead;
		if location of player is Ebekelmenc and the player's command matches the regular expression "<^aiou>":
			if character number 1 in the player's command is "e", say "[so-right-track]." instead;
			if the player's command matches the text "e", say "[right-track]." instead;
		if location of player is Igwivriqi and the player's command matches the regular expression "<^aeuo>":
			if character number 1 in the player's command is "i", say "[so-right-track]." instead;
			if the player's command matches the text "i", say "[right-track]." instead;
	if flyby is true, say "You don't have to do much with FLYBY on--just wait in an unsolved room, or go where you need to go." instead;
	say "You can go in any of the four basic directions[if location of player is not solved] or figure what to do right here[end if][if paths > 0]. You also have the option of a FLYBY to go through quickly[end if][if paths > 1], or SCRY/TRYSCRY to see how you've gotten through[end if]. THINK and an empty command also give slightly different clues. Or you can WAKE to quit, of course." instead;

volume endgame

Table of Final Question Options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"see which verbs you [b]GOT[r] or [b]MISSED[r]"	true	"GOT"	which-verb-y rule	whichverbing
--	true	"MISSED"	which-verb-n rule	whichverbing

whichverbing is an activity.

this is the which-verb-y rule:
	list-verbs true;

this is the which-verb-n rule:
	list-verbs false;

to list-verbs (ts - a truth state):
	repeat with Q running through rooms:
		let Z be 0;
		if tn of Q is empty, continue the action;
		say "[Q] ([tn of Q]): ";
		repeat through tn of Q:
			if tf entry is ts:
				increment Z;
				say "[if Z > 1], [end if][v entry]";
		if ts is false:
			say "[if Z is 0]nothing. Well done![else] ([Z] of [number of rows in tn of Q]).[end if]";
		else:
			say "[if Z is number of rows in tn of Q]nothing. Well done![else] ([Z] of [number of rows in tn of Q]).[end if]"

volume quick tests

test w with "rules on/unfurl/e/adapt/e/expel/e/indict/flyby".

test us with "z/e/e/e/z/e/n/w/z/n/w/n/z/n/e/s/z/s/s/e/z/s/w/w".
test is with "s/s/e/s/s/s/w/n/s/w/w/w/s/w/s/e/s/n/e/e/s/n/n/w".
test as with "e/e/e/n/e/e/s/s/e/n/w/s/e/n/n/n/e/w/n/e/e/w/s/w".
test es with "n/w/n/n/n/w/w/s/n/e/s/w/n/e/n/e/n/s/e/n/n/s/s/s".

chapter flyying

flyying is an action applying to nothing.

understand the command "flyy" as something new.

understand "flyy" as flyying.

carry out flyying:
	now flyby is true;
	say "Flyby forced to true.";
	the rule succeeds;

chapter eiting

eiting is an action applying to nothing.

understand the command "eit" as something new.

understand "eit" as eiting.

carry out eiting:
	end the story;
	the rule succeeds;

