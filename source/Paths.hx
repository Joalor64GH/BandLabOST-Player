package;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.media.Sound;
import openfl.utils.Assets;

using StringTools;

class Paths
{
	public static var currentTrackedAssets:Map<String, FlxGraphic> = [];
	public static var currentTrackedSounds:Map<String, Sound> = [];

	public static var localTrackedAssets:Array<String> = [];

	public static function clearUnusedMemory()
	{
		for (key in currentTrackedAssets.keys())
		{
			if (!localTrackedAssets.contains(key) && key != null)
			{
				var obj = currentTrackedAssets.get(key);
				@:privateAccess
				if (obj != null)
				{
					Assets.cache.removeBitmapData(key);
					Assets.cache.clearBitmapData(key);
					Assets.cache.clear(key);
					FlxG.bitmap._cache.remove(key);
					obj.destroy();
					currentTrackedAssets.remove(key);
				}
			}
		}

		for (key in currentTrackedSounds.keys())
		{
			if (!localTrackedAssets.contains(key) && key != null)
			{
				var obj = currentTrackedSounds.get(key);
				if (obj != null)
				{
					Assets.cache.removeSound(key);
					Assets.cache.clearSounds(key);
					Assets.cache.clear(key);
					currentTrackedSounds.remove(key);
				}
			}
		}
	}

	public static function clearStoredMemory()
	{
		@:privateAccess
		for (key in FlxG.bitmap._cache.keys())
		{
			var obj = FlxG.bitmap._cache.get(key);
			if (obj != null && !currentTrackedAssets.exists(key))
			{
				Assets.cache.removeBitmapData(key);
				Assets.cache.clearBitmapData(key);
				Assets.cache.clear(key);
				FlxG.bitmap._cache.remove(key);
				obj.destroy();
			}
		}

		@:privateAccess
		for (key in Assets.cache.getSoundKeys())
		{
			if (key != null && !currentTrackedSounds.exists(key))
			{
				var obj = Assets.cache.getSound(key);
				if (obj != null)
				{
					Assets.cache.removeSound(key);
					Assets.cache.clearSounds(key);
					Assets.cache.clear(key);
				}
			}
		}

		localTrackedAssets = [];
	}

	static var currentLevel:String;

	static public function file(file:String)
	{
		var path = 'assets/$file';
		if (currentLevel != null && OpenFlAssets.exists('$currentLevel:$path'))
			return '$currentLevel:$path';

		return path;
	}

	inline static public function txt(key:String)
		return file('data/$key.txt');

	inline static public function xml(key:String)
		return file('data/$key.xml');

	inline static public function hx(key:String)
		return file('$key.hx');

	inline static public function font(key:String)
		return file('fonts/$key');

	inline static public function sound(key:String, ?cache:Bool = true):Sound
	{
		var sound:Sound = returnSound('sounds', key);
		return sound;
	}

	inline static public function music(key:String, ?cache:Bool = true):Sound
	{
		var file:Sound = returnSound('music', key);
		return file;
	}

	inline static public function image(key:String, ?cache:Bool = true):FlxGraphic
	{	
		var returnAsset:FlxGraphic = returnGraphic(key);
		return returnAsset;
	}

	inline static public function getSparrowAtlas(key:String, ?cache:Bool = true):FlxAtlasFrames
		return FlxAtlasFrames.fromSparrow(returnGraphic('images/$key', cache), xml('images/$key'));

	inline static public function getPackerAtlas(key:String, ?cache:Bool = true):FlxAtlasFrames
		return FlxAtlasFrames.fromSpriteSheetPacker(returnGraphic('images/$key', cache), txt('images/$key'));

	public static function returnGraphic(key:String, ?cache:Bool = true):FlxGraphic
	{
		var path:String = file('images/$key.png');
		if (Assets.exists(path, IMAGE))
		{
			if (!currentTrackedAssets.exists(path))
			{
				var graphic:FlxGraphic = FlxGraphic.fromBitmapData(Assets.getBitmapData(path), false, path, cache);
				graphic.persist = true;
				currentTrackedAssets.set(path, graphic);
			}

			localTrackedAssets.push(path);
			return currentTrackedAssets.get(path);
		}

		trace('$key its null');
		return null;
	}

	public static function returnSound(key:String, ?cache:Bool = true):Sound
	{
		var path:String = file('sounds/$key.ogg');
		if (Assets.exists(path, SOUND))
		{
			if (!currentTrackedSounds.exists(path))
				currentTrackedSounds.set(path, Assets.getSound(path, cache));

			localTrackedAssets.push(path);
			return currentTrackedSounds.get(path);
		}

		trace('$key its null');
		return null;
	}
}