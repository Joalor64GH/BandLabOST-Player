package states.menu;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flash.text.TextField;
import flixel.tweens.FlxTween;
import flixel.addons.text.FlxTypeText;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import openfl.Assets;
#if sys
import sys.io.File;
import sys.FileSystem;
#end

import util.*;
import states.*;
import alphabet.*;
import states.menu.*;

using StringTools;

class CreditsState extends FlxState
{
	var credits:Array<CreditsMetadata> = [];

	static var curSelected:Int = 0;

	private var grpCredits:FlxTypedGroup<Alphabet>;

	var descText:FlxText;
	var bg:FlxSprite;
	var colorTween:FlxTween;

	override function create()
	{
		var initCreditlist = CoolUtil.coolTextFile(Paths.txt('data/creditsList'));

		if (Assets.exists(Paths.txt('data/creditsList')))
		{
			initCreditlist = Assets.getText(Paths.txt('data/creditsList')).trim().split('\n');

			for (i in 0...initCreditlist.length)
			{
				initCreditlist[i] = initCreditlist[i].trim();
			}
		}
		else
		{
			trace("Cannot find 'creditsList' in data directory.");
			trace("Replacing it with normal credits...");
			initCreditlist = "Joalor64 YT:Main Programmer".trim()
				.split('\n');

			for (i in 0...initCreditlist.length)
			{
				initCreditlist[i] = initCreditlist[i].trim();
			}
		}

		for (i in 0...initCreditlist.length)
		{
			var data:Array<String> = initCreditlist[i].split(':');
			credits.push(new CreditsMetadata(data[0], data[1]));
		}

		bg = new FlxSprite().loadGraphic(Paths.image('menuBG'));
		bg.color = FlxColor.PINK;
		add(bg);

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.text = 'what';
		descText.borderSize = 2.4;
		add(descText);

		grpCredits = new FlxTypedGroup<Alphabet>();
		add(grpCredits);

		for (i in 0...credits.length)
		{
			var creditText:Alphabet = new Alphabet(0, (70 * i) + 30, credits[i].modderName, true, false);
			creditText.isMenuItem = true;
			creditText.targetY = i;
			grpCredits.add(creditText);
		}

		changeSelection();

		var descText:FlxText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		var shiftMult:Int = 1;
		if (FlxG.keys.pressed.SHIFT)
			shiftMult = 3;

		if (FlxG.keys.justPressed.UP)
		{
			changeSelection(-shiftMult);
		}
		if (FlxG.keys.justPressed.DOWN)
		{
			changeSelection(shiftMult);
		}

		if (FlxG.mouse.wheel != 0)
		{
			changeSelection(-Std.int(FlxG.mouse.wheel));
		}

		if (FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(new MainMenuState());
	}

	function changeSelection(change:Int = 0)
	{
		curSelected += change;

		if (curSelected < 0)
			curSelected = credits.length - 1;
		if (curSelected >= credits.length)
			curSelected = 0;

		descText.text = credits[curSelected].desc;

		var bullShit:Int = 0;

		for (item in grpCredits.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
	}
}

class CreditsMetadata
{
	public var modderName:String = "";
	public var desc:String = "";

	public function new(name:String, desc:String)
	{
		this.modderName = name;
		this.desc = desc;
	}
}