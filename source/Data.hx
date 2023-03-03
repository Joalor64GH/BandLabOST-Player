package;

import flixel.FlxG;
import flixel.util.FlxSave;

class Data
{
    public static var disabledMods:Bool = false;

    public static function write()
	{
		FlxG.save.data.disabledMods = disabledMods;
		FlxG.save.flush();
	}

    public static function load()
	{
		if (FlxG.save.data.disabledMods != null)
			disabledMods = FlxG.save.data.disabledMods;

		write();
	}
}