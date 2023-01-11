package substates;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import util.Menu;
import flixel.util.FlxColor;
import haxe.Log;
import lime.app.Application;
import states.menu.*;
import states.*;

class NGSubState extends FlxSubState
{
	var substateColor:FlxColor;

	override public function create()
	{
		substateColor = new FlxColor();

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
		FlxG.switchState(new Menu(substateColor.setRGB(0, 0, 0, 125)));

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
