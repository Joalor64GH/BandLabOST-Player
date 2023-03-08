package states.menu;

import util.Menu;
import flixel.FlxG;
import openfl.Assets;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import lime.app.Application;
import states.menu.*;
import states.*;
import core.*;

class MainMenuState extends FlxState
{
	var bg:FlxSprite;

	override public function create()
	{
		// openfl.system.System.gc();

		bg = new FlxSprite().loadGraphic(Paths.image('titleBG'));
		add(bg);

		// Create menu
		Menu.title = "BandLab OST Player";
		Menu.options = [
			'Select Song', 
			'Instructions', 
			'Mod Loader',
			'Credits',
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
				#if FUTURE_POLYMOD
				    	trace('Mod Loader');
					/*if (ModCore.trackedMods != [])
						FlxG.switchState(new ModsState());
					else*/
						FlxG.resetState();
						Main.toast.create('No mods installed!', 0xFFFFFF00, 'Please add mods to be able to access this menu!');
				case 3:
				#end
					trace('Credits');
					FlxG.switchState(new CreditsState());
				case 4:
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
		FlxG.switchState(new Menu());

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}