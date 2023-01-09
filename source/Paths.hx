package;

import flixel.FlxG;
import openfl.utils.Assets as OpenFlAssets;
import flixel.graphics.frames.FlxAtlasFrames;
#if sys
import sys.io.File;
import sys.FileSystem;
#end

class Paths
{
	inline public static var SOUND_EXT = "ogg";

	static var currentLevel:String;

	static public function file(file:String)
	{
		var path = 'assets/$file';
		if (currentLevel != null && OpenFlAssets.exists('$currentLevel:$path'))
			return '$currentLevel:$path';

		return path;
	}

	#if MOD_SUPPORT
	inline static public function fromModFolders(file:String)
	{
		return 'mods/$file';
	}
	#end
	
	inline static public function txt(key:String)
	{
		if(FileSystem.exists)
		{
                        return fromModFolders('data/$key.txt');
		}
		else
		{
		        return file('data/$key.txt');
		}	
	}

        inline static public function xml(key:String)
	{
		if(FileSystem.exists)
		{
			return fromModFolders('data/$key.xml');
		}
		else
		{
		        return file('data/$key.xml');
		}
	}

	inline static public function sound(key:String)
	{
		if(FileSystem.exists)
		{
			return fromModFolders('sounds/$key.$SOUND_EXT');
		}
		else
		{
                        return file('sounds/$key.$SOUND_EXT');
		}
	}

	inline static public function soundRandom(key:String, min:Int, max:Int)
	{
		if(FileSystem.exists)
		{
                        return fromModFolders('sounds/$key${FlxG.random.int(min, max)}.$SOUND_EXT');
		}
		else
		{
		        return file('sounds/$key${FlxG.random.int(min, max)}.$SOUND_EXT');
		}
	}

	inline static public function music(key:String)
	{
		if(FileSystem.exists)
		{
		        return fromModFolders('music/$key.$SOUND_EXT');
		}
		else
		{
			return file('music/$key.$SOUND_EXT');
		}
	}

	inline static public function image(key:String)
	{
		if(FileSystem.exists)
		{
		        return fromModFolders('images/$key.png');
		}
		else
		{
			return file('images/$key.png');
		}
	}

	inline static public function font(key:String)
	{
		if (FileSystem.exists)
		{
                        return fromModFolders('fonts/$key');
		}
		else
		{
                        return file('fonts/$key');
		}
	}

	inline static public function getSparrowAtlas(key:String)
	{
		if (FileSystem.exists)
		{
                        return FlxAtlasFrames.fromSparrow(image(key), fromModFolders('images/$key.xml'));
		}
		else
		{
			return FlxAtlasFrames.fromSparrow(image(key), file('images/$key.xml'));
		}
	}

	inline static public function getPackerAtlas(key:String)
	{
		if (FileSystem.exists)
		{
                        return FlxAtlasFrames.fromSpriteSheetPacker(image(key), fromModFolders('images/$key.txt'));
		}
		else
		{
			return FlxAtlasFrames.fromSpriteSheetPacker(image(key), file('images/$key.txt'));
		}
	}
}  
