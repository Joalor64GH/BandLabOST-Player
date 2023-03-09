package states;

import Paths;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.FlxState;
import states.menu.*;
import states.*;

class COFState extends FlxState
{
    public var DisplayText:FlxText;

    override function create()
    {
        openfl.system.System.gc();
        
	super.create();

        var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('backgrounds/creepyolforest'));
	bg.scrollFactor.x = 0;
	bg.scrollFactor.y = 0.18;
	bg.setGraphicSize(Std.int(bg.width * 1.1));
	bg.updateHitbox();
	bg.screenCenter();
	bg.antialiasing = true;
	add(bg);

        DisplayText = new FlxText(0, 0, FlxG.width, "NOW PLAYING:\nCreepy Ol Forest", 32);
	DisplayText.setFormat(Paths.font("vcr.ttf"), 54, FlxColor.WHITE, FlxTextAlign.CENTER,FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);

	add(DisplayText);

        FlxG.sound.playMusic(Paths.music('Creepy_Ol_Forest'), 1);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE)
	{
		FlxG.switchState(new MainMenuState());
                FlxG.sound.music.volume = 0;
	}
    }
}