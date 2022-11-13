package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class CheckboxThingie extends FlxSprite
{
	public var sprTracker:FlxSprite;
	public var daValue(default, set):Bool;
	public var copyAlpha:Bool = true;
	public var offsetX:Float = 0;
	public var offsetY:Float = 0;
	public function new(x:Float = 0, y:Float = 0, ?checked = false) {
		super(x, y);

		antialiasing = false;
		setGraphicSize(Std.int(0.9 * width));
		updateHitbox();

		daValue = checked;
		loadGraphic(Paths.image('options/${getDaString(daValue)}'));
		
		scale.set(3, 3);
	}

	function getDaString(value:Bool):String 
	{
        if (value) {
			return 'yes';
		}
		else {
			return 'no';
		}
	}

	override function update(elapsed:Float) {
		if (sprTracker != null) {
			setPosition(sprTracker.x + 100 + offsetX, sprTracker.y);
			if(copyAlpha) {
				alpha = sprTracker.alpha;
			}
		}
		super.update(elapsed);
	}

	private function set_daValue(check:Bool):Bool {
		loadGraphic(Paths.image('options/${getDaString(check)}'));
		return check;
	}
}