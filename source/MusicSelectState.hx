package;

import flixel.FlxG;
import flixel.FlxState;
import Menu.MenuSelection;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxe.Log;
import lime.app.Application;

class MainMenuState extends FlxState
{
	var substateColor:FlxColor;

	override public function create()
	{
		substateColor = new FlxColor();

		// Create menu
		Menu.title = "Song Selector";
		Menu.options = ['Nighttime Gaming'/*, 'Relaxing Evening Lo-Fi', 'GBA Cliche', 'Dreamy Lo-Fi Beats', 'Arcadia Mania', 'Creepy Ol Forest', 'Untitled Lo-Fi Song'*/];
		#end
		Menu.includeExitBtn = false;
		Menu.callback = (option:MenuSelection) ->
		{
			trace('Epic menu option ${option}');
			// Option check
			switch (option.id)
			{
				case 0:
					trace('Nighttime Gaming');
					FlxG.switchState(new MusicPlayState());
				case 1:
					trace('Back');
                    FlxG.switchState(new MainMenuState());
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
