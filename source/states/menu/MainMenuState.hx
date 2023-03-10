package states.menu;

import util.Menu;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;
import states.menu.*;
import states.*;
import core.*;

class MainMenuState extends Menu
{
	var bg:FlxSprite;

	override public function create()
	{
		// openfl.system.System.gc();

		bg = new FlxSprite().loadGraphic(Paths.image('titleBG'));
		add(bg);

		#if FUTURE_POLYMOD
		if (ModCore.trackedMods != []){
			for (i in ModCore.trackedMods)
				Main.toast.create('Mods installed', 0xFFFFFF00, ' ${i.title}');
		}
		#end

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
					if (ModCore.trackedMods != [])
						FlxG.switchState(new ModsState());
					else {
						Main.toast.create('No mods installed!', 0xFFFFFF00, 'Please add mods to be able to access this menu!');
						Menu.instance.stopFlash();
						Menu.instance.justPressedEnter = false;
					}
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

		var versionShit:FlxText = new FlxText(5, FlxG.height - 24, 0, "BOSTP v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}