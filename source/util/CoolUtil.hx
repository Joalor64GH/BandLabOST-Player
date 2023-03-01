package;

import flixel.FlxG;
import flixel.math.FlxMath;

using StringTools;

class CoolUtil
{	
	public static function boundTo(value:Float, min:Float, max:Float):Float
	{
		var newValue:Float = value;

		if (newValue < min)
			newValue = min;
		else if (newValue > max)
			newValue = max;

		return newValue;
	}
}