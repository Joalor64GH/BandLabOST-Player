package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import Menu.MenuSelection;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import haxe.Log;
import lime.app.Application;

class NGSubState extends FlxSubState
{
	var substateColor:FlxColor;

	override public function create()
	{
		substateColor = new FlxColor();

		// Create menu
		Menu.title = "Good choice, but first...";
		Menu.options = ['Original', 'Remix', 'Back'];
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

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.18;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
