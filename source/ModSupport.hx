package;

import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;

using StringTools;

typedef ModJson =
{
	var title:String;
	var description:String;
	var homepage:String;
	var contributors:String;
	var api_version:String;
	var mod_version:String;
    var license:String;
}

class ModSupport
{
	public static var currentMod:Mod;
	public static var modsLoaded:Array<Mod> = [];

	public static function load()
	{
		#if MOD_SUPPORT
		if (FileSystem.exists(Paths.fromModFolders('modsList.txt')))
		{
			var modsList:Array<String> = CoolUtil.coolTextFile(Paths.fromModFolders('modsList.txt'));
			if (modsList.length > 0)
			{
				for (i in 0...modsList.length)
				{
					// dont push stuff that is commented out
					if (!modsList[i].startsWith('//'))
					{
						var mListSplit:Array<String> = modsList[i].split('|');
						if (mListSplit.length > 1)
						{
							modsLoaded.push(new Mod(mListSplit[0], mListSplit[1] == 'true'));
							trace('loaded mod! ' + mListSplit[0]);
						}
					}
				}
			}
			else
			{
				for (i in FileSystem.readDirectory(Paths.fromModFolders('')))
				{
					trace(Path.extension(i));
				}
			}
		}
		else
		{
			trace('modsList.txt not found, creating an empty file...');
			File.saveContent(Paths.fromModFolders('modsList.txt'),
				"// This is the file that tells the game which mod folders to load and if they should be enabled or not at startup.\n// Don't modify this if you don't know what you're doing!");
		}
		#else
		trace("Platform doesn't support mods, skipping...");
		#end
	}
}

class Mod
{
	public var folderName:String = '';
	public var enabled:Bool = true;

	public function new(folderName:String = '', enabled:Bool = true)
	{
		this.folderName = folderName;
		this.enabled = enabled;
	}
}