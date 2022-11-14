package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxCamera;
import flixel.FlxObject;
import Controls;
import flixel.text.FlxText;

using StringTools;

class OptionsState extends MusicBeatState
{
	var options:Array<String> = ['Note Colors', 'Controls', 'Adjust Delay and Combo', 'Graphics', 'Visuals and UI', 'Gameplay'];
	private var grpOptions:FlxTypedGroup<FlxText>;
	private var grpBox:FlxTypedGroup<FlxSprite>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;

	var camFollowPos:FlxObject;
	var camFollow:FlxObject;



	var bg:FlxBackdrop = new FlxBackdrop(Paths.image('backgroundlool'), 0.2, 0.2, true, true);

	function openSelectedSubstate(label:String) {
		switch(label) {
			case 'Note Colors':
				openSubState(new options.NotesSubState());
			case 'Controls':
				openSubState(new options.ControlsSubState());
			case 'Graphics':
				openSubState(new options.GraphicsSettingsSubState());
			case 'Visuals and UI':
				openSubState(new options.VisualsUISubState());
			case 'Gameplay':
				openSubState(new options.GameplaySettingsSubState());
			case 'Adjust Delay and Combo':
				LoadingState.loadAndSwitchState(new options.NoteOffsetState());
		}
	}

	var selectorLeft:FlxSprite;
	var selectorRight:FlxSprite;

	override function create() {
		#if desktop
		DiscordClient.changePresence("Options Menu", null);
		#end

		

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);


		add(bg);

		grpOptions = new FlxTypedGroup<FlxText>();
		add(grpOptions);

		

		grpBox = new FlxTypedGroup<FlxSprite>();
		add(grpBox);

		

		

		add(bg);
		bg.scrollFactor.set(0, 0.07);

		for (i in 0...options.length)
		{
			var optionText:FlxText = new FlxText();
			optionText.text = options[i];
			optionText.setFormat(Paths.font('sonic-cd-menu-font.ttf'), 32);
			optionText.screenCenter();
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);
	

			
			optionText.ID = i;
		}

		for (i in 0...options.length) {
			var optionBox:FlxSprite = new FlxSprite();
			optionBox.loadGraphic(Paths.image('options/box'));
			optionBox.screenCenter(X);
			optionBox.antialiasing = false;
			optionBox.scale.set(1, 1.25); // a little more height
			optionBox.ID = i;
			grpBox.add(optionBox);
		    
			grpOptions.forEach(function(spr:FlxSprite) {
				if (spr.ID == optionBox.ID) {
					optionBox.y = spr.y;
				}
			});
		}



		selectorLeft = new FlxSprite();
		selectorLeft.loadGraphic(Paths.image('options/arrow'));
		add(selectorLeft);

		selectorRight = new FlxSprite();
		selectorRight.loadGraphic(Paths.image('options/arrow'));
		selectorRight.flipX = true;
		add(selectorRight);

		selectorRight.scale.set(6, 6);
		selectorLeft.scale.set(6, 6);

		changeSelection();
		ClientPrefs.saveSettings();

		super.create();
	}

	override function closeSubState() {
		super.closeSubState();
		ClientPrefs.saveSettings();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		grpBox.forEach(function(spr:FlxSprite) {
			if (curSelected == spr.ID) {
				spr.alpha = 1;
			}
			else {
				spr.alpha = 0.6;
			}
		});

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);

		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (controls.UI_UP_P) {
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P) {
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if (controls.ACCEPT) {
			openSelectedSubstate(options[curSelected]);
		}

		bg.x -= 0.45 / (ClientPrefs.framerate / 60);
		bg.y -= 0.16 / (ClientPrefs.framerate / 60);
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;


		for (item in grpOptions.members) {

			item.alpha = 0.6;
			if (item.ID == curSelected) {
				item.alpha = 1;
				selectorLeft.x = item.x - 63;
				selectorLeft.y = item.y;
				selectorLeft.y += 25;
				selectorRight.x = item.x + item.width + 15;
				selectorRight.y = item.y;
				selectorRight.y += 25; // offset
			}
			else {
				item.alpha = 0.6;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}