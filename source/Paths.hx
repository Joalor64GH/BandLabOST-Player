package;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;
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

	static public function loadImage(key:String, ?library:String):FlxGraphic
	{
		var path = image(key);

		if (OpenFlAssets.exists(path))
		{
			var bitmap = OpenFlAssets.getBitmapData(path);
			return FlxGraphic.fromBitmapData(bitmap);
		}
		else
		{
			trace('Could not find image at path $path');
			return null;
		}
	}
	
	inline static public function txt(key:String)
	{
		#if MODS_ALLOWED
		var file:String = modTxt(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
		return file('data/$key.txt');	
	}

        inline static public function xml(key:String)
	{
		#if MODS_ALLOWED
		var file:String = modXml(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
		return file('data/$key.xml');
	}

	inline static public function sound(key:String)
	{
		#if MODS_ALLOWED
		var file:String = modSound(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
        	return file('sounds/$key.$SOUND_EXT');
	}

	inline static public function soundRandom(key:String, min:Int, max:Int)
	{
		return file('sounds/$key${FlxG.random.int(min, max)}.$SOUND_EXT');
	}

	inline static public function music(key:String)
	{
		#if MODS_ALLOWED
		var file:String = modMusic(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
		return file('music/$key.$SOUND_EXT');
	}

	inline static public function image(key:String)
	{
		#if MODS_ALLOWED
		var file:String = modImage(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
		return file('images/$key.png');
	}

	inline static public function state(key:String)
	{
		#if MODS_ALLOWED
		var file:String = modState(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
		return file('custom_states/$key.hx');
	}

	inline static public function substate(key:String)
	{
		#if MODS_ALLOWED
		var file:String = modSubstate(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
		return file('custom_substates/$key.hx');
	}

	inline static public function font(key:String)
	{
		#if MODS_ALLOWED
		var file:String = modFont(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
        	return file('fonts/$key');
	}

	inline static public function getSparrowAtlas(key:String)
	{
		#if MODS_ALLOWED
		var file:String = getModSparrowAtlas(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
		return FlxAtlasFrames.fromSparrow(image(key), file('images/$key.xml'));
	}

	inline static public function getPackerAtlas(key:String)
	{
		#if MODS_ALLOWED
		var file:String = getModPackerAtlas(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key), file('images/$key.txt'));
	}

	inline static public function getAnimateAtlas(key:String)
	{
		#if MODS_ALLOWED
		var file:String = getModAnimateAtlas(key);
		if(FileSystem.exists(file)) {
			return file;
		}
		#end
		return animate.FlxAnimate.fromAnimate(loadImage('$key/spritemap1'), file('images/$key/spritemap1.json'));
	}

	#if MOD_SUPPORT
	inline static public function fromModFolders(file:String)
	{
		return 'mods/$file';
	}

	inline static public function modTxt(key:String)
	{
		return fromModFolders('data/$key.txt');
	}

        inline static public function modXml(key:String)
	{
		return fromModFolders('data/$key.xml');
	}

	inline static public function modSound(key:String)
	{
		return fromModFolders('sounds/$key.$SOUND_EXT');
	}

	inline static public function modMusic(key:String)
	{
		return fromModFolders('music/$key.$SOUND_EXT');
	}

	inline static public function modImage(key:String)
	{
		return fromModFolders('images/$key.png');
	}

	inline static public function modState(key:String)
	{
		return fromModFolders('custom_states/$key.hx');
	}

	inline static public function modSubstate(key:String)
	{
		return fromModFolders('custom_substates/$key.hx');
	}

	inline static public function modFont(key:String)
	{
		return fromModFolders('fonts/$key');
	}

	inline static public function getModSparrowAtlas(key:String)
	{
		return FlxAtlasFrames.fromSparrow(image(key), fromModFolders('images/$key.xml'));
	}

	inline static public function getModPackerAtlas(key:String)
	{
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key), fromModFolders('images/$key.txt'));
	}

	inline static public function getModAnimateAtlas(key:String)
	{
		return animate.FlxAnimate.fromAnimate(loadImage('$key/spritemap1'), fromModFolders('images/$key/spritemap1.json'));
	}
	#end
}  