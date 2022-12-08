package util;

import flixel.FlxG;
import lime.utils.Assets;

using StringTools;

class CoolUtil
{
	public static function coolTextFile(path:String):Array<String>
	{
		if (Assets.exists(path))
		{
			var daList:Array<String> = Assets.getText(path).trim().split('\n');

			for (i in 0...daList.length)
				daList[i] = daList[i].trim();

			return daList;
		}
		return [''];
	}
}
