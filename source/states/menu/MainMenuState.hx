package states.menu;

import flixel.FlxG;
import flixel.FlxState;
import util.Menu;
import flixel.util.FlxColor;
import haxe.Log;
import lime.app.Application;
import states.menu.*;
import states.*;

class MainMenuState extends FlxState
{
	var substateColor:FlxColor;

	override public function create()
	{
		// openfl.system.System.gc();
		
		substateColor = new FlxColor();

		// Create menu
		Menu.title = "BandLab OST Player";
		Menu.options = [
			'Select Song', 
			'Instructions', 
			'Mod Loader',
			'Exit'
		];
		Menu.includeExitBtn = false;
		Menu.callback = (option:MenuSelection) ->
		{
			trace('Epic menu option ${option}');
			// Option check
			switch (option.id)
			{
				case 0:
					trace('Select Song');
					FlxG.switchState(new MusicSelectState());
				case 1:
					trace('Instructions');
					FlxG.switchState(new InstructionsState());
				case 2:
				    trace('Mod Loader');
					Main.toast.create('Warning!', 0xFFFFFF00, 'This menu hasn't been created yet!');
				case 3:
					trace('Exit');
					#if sys
					Sys.exit(0);
					#else
					openfl.system.System.exit(0);
					#end
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
