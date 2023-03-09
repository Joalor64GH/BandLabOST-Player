package substates;

import util.Menu;
import flixel.FlxG;
import flixel.FlxSprite;
import lime.app.Application;
import states.menu.*;
import states.*;

class NGSubState extends Menu
{
	var bg:FlxSprite;

	override public function create()
	{
		// openfl.system.System.gc();

		bg = new FlxSprite().loadGraphic(Paths.image('musicBG'));
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

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}