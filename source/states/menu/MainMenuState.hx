package states.menu;

import haxe.Log;
import util.Menu;
import flixel.FlxG;
import openfl.Assets;
import flixel.FlxState;
import flixel.FlxSprite;
import lime.app.Application;
import states.menu.*;
import states.*;
import core.*;

class MainMenuState extends FlxState
{
	var randomAssText:Array<String> = [];

	override public function create()
	{
		// openfl.system.System.gc();

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('titleBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.18;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

		randomAssText = FlxG.random.getObject(getText());

		var dumbText:FlxText = new FlxText(12, FlxG.height - 24, 0, [randomAssText[0]], 12);
		dumbText.scrollFactor.set();
		dumbText.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(dumbText);

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

	function getText():Array<Array<String>>
	{
		var fullText:String = Assets.getText(Paths.txt('goofyText'));

		var firstArray:Array<String> = fullText.split('\n');
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}