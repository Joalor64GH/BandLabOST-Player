package;

import FPS;
import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.Lib;
import states.menu.*;
import states.*;
import core.*;

class Main extends Sprite
{
	var gameWidth:Int = 1280; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 720; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var zoom:Float = -1; // If -1, zoom is automatically calculated to fit the window dimensions. (Removed from Flixel 5.0.0)
	var framerate:Int = 60; // How many frames per second the game should run at.
	var skipSplash:Bool = false; // Whether to skip the flixel splash screen that appears in release mode.
	var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets'

	public static var toast:ToastCore;
	
	// You can pretty much ignore everything from here on - your code should go in your states.
	
	public function new()
	{
		super();

		ModCore.reload();

		Data.load();

		addChild(new FlxGame(0, 0, MainMenuState));
		addChild(new FPS(10, 3, 0xFFFFFF));

		toast = new ToastCore();
		addChild(toast);
	}
}
