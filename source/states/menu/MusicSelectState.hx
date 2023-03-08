package states.menu;

import util.Menu;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import lime.app.Application;
import states.menu.*;
import substates.*;
import states.*;

class MusicSelectState extends FlxState
{
	override public function create()
	{
		// openfl.system.System.gc();

		// Create menu
		Menu.title = "Song Selector";
		Menu.options = [
			'Nighttime Gaming', 
			'Relaxing Evening Lo-Fi', 
			'GBA Cliche', 
			'Dreamy Lo-Fi Beats', 
			'Arcadia Mania', 
			'Creepy Ol Forest', 
			'Untitled Lo-Fi Song', 
			'Pure Indian Vibes', 
			'Game Development', 
			'Silver Candy',
			'Christmas Wishes',
		//  'Universal Questioning',
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
					trace('Nighttime Gaming');
					FlxG.switchState(new NGSubState());
				case 1:
					trace('Relaxing Evening Lo-Fi');
                                        FlxG.switchState(new RELFState());
				case 2:
					trace('GBA Cliche');
                                        FlxG.switchState(new GBAState());
				case 3:
					trace('Dreamy Lo-Fi Beats');
                                        FlxG.switchState(new DLFBState());
				case 4:
					trace('Arcadia Mania');
                                        FlxG.switchState(new ArcadiaState());
				case 5:
					trace('Creepy Ol Forest');
                                        FlxG.switchState(new COFState());
				case 6:
					trace('Untitled Lo-Fi Song');
                                        FlxG.switchState(new ULFSState());
				case 7:
					trace('Pure Indian Vibes');
                                        FlxG.switchState(new PIVState());
				case 8:
					trace('Game Development');
                                        FlxG.switchState(new GDState());
				case 9:
				        trace('Silver Candy');
                                        FlxG.switchState(new SCState());
				case 10:
				        trace('Christmas Wishes');
                                        FlxG.switchState(new CWState());
				case 11:
			/*	trace('Universal Questioning');
                                        FlxG.switchState(new UQState());
				case 12:*/
					trace('Back');
                                        FlxG.switchState(new MainMenuState());
				default:
					trace('something is fucked');
			}
		}
		// Open menu
		FlxG.switchState(new Menu());

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('musicBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.18;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}