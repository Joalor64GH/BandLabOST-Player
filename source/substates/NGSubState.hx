package substates;

import haxe.Log;
import util.Menu;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxSubState;
import lime.app.Application;
import states.menu.*;
import states.*;

class NGSubState extends FlxSubState
{
	override public function create()
	{
		// openfl.system.System.gc();
		
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('musicBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.18;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

		// Create menu
		Menu.title = "Good choice, but first...";
		Menu.options = [
			'Original', 
			'Remix', 
			'Back'
		];
		Menu.includeExitBtn = false;
		Menu.callback = (option:MenuSelection) ->
		{
			trace('Epic menu option ${option}');
			// Option check
			switch (option.id)
			{
				case 0:
					trace('Original');
					FlxG.switchState(new NGState());
				case 1:
					trace('Remix');
					FlxG.switchState(new NGREState());
                                case 2:
					trace('Back');
					FlxG.switchState(new MusicSelectState());
				default:
					trace('something is fucked');
			}
		}
		// Open menu
		FlxG.switchState(new Menu());

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}