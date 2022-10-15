local allowCountdown = false
local yeah = true;
function onCreate(elapsed) ---why its being elapsed? [X probably]
	precacheImage('Majin_Notes');
	precacheImage('MajinSplashes');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'lookyourself');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'itsover');
	setProperty('gf.visible', false);
end                        --- Fun is Infinite [Fun Guy probably]


function onStartCountdown() --- i do countdown now fuck off [EX- X probably]
	if not allowCountdown then
		runTimer('circleThing', 0.1);
		allowCountdown = true;
		startCountdown();
		return Function_Stop;
	end
	return Function_Continue;
end                         --- no lol ratio + l [Fleet probably]

function onTimerCompleted(tag, loops, loopsLeft) ---WATCH YO TONE MF [X probably..]
	if tag == 'circleThing' then
		makeLuaSprite('void', 'majinthing/voidlol', 0, 0);
		setObjectCamera('void', 'hud');
		addLuaSprite('void', true);
		makeLuaSprite('dacircle', 'majinthing/CircleMajin', 777, 0);
		setObjectCamera('dacircle', 'hud');
		addLuaSprite('dacircle', true);
		makeLuaSprite('datext', 'majinthing/TextMajin', -1100, 0);
		setObjectCamera('datext', 'hud');
		addLuaSprite('datext', true);
		runTimer('firstlook', 0.6, 1);
		runTimer('endlook', 1.9, 1);
	elseif tag == 'firstlook' then
		doTweenX('gettwee', 'dacircle', 0, 0.5, linear);
		doTweenX('gettween', 'datext', 0, 0.5, linear);
	elseif tag == 'endlook' then
		doTweenAlpha('getfad', 'dacircle', 0, 1, linear);
		doTweenAlpha('getfade', 'datext', 0, 1, linear);
		doTweenAlpha('getfaded', 'void', 0, 1, linear);
	end
end                                            --- FUCK OFF [Fleet probably..]

function onBeatHit()  --- for awesomeness
 if yeah == true then
	if getAnim("dad") == "idle"..getProperty('dad.idleSuffix') then
			characterPlayAnim("dad","idle"..getProperty('dad.idleSuffix'),true)
		end
	if getAnim("boyfriend") == "idle"..getProperty('boyfriend.idleSuffix') then
			characterPlayAnim("boyfriend","idle"..getProperty('boyfriend.idleSuffix'),true)
		end
   end
end
