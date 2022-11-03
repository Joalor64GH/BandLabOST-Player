package;

#if polymod
import polymod.format.ParseRules;
#end

/**
    Author: @MemeHoovy
**/
class ModHandler
{
    public static var mod_dirs:Array<String> = [];

	public static function reloadMods()
	{
		#if desktop
        polymod.PolymodConfig.modMetadataFile = "_polymod_meta.json";

		mod_dirs = [];

		for(meta in polymod.Polymod.scan("mods"))
		{
			mod_dirs.push(meta.id);
		}

            mod_dirs = [];

        var parse_rules:ParseRules = ParseRules.getDefault();
        parse_rules.addFormat("json", new JsonLoaderFuni());

        polymod.Polymod.init({
			modRoot: "mods",
			dirs: mod_dirs,
			framework: OPENFL,
			errorCallback: function(error:polymod.Polymod.PolymodError)
			{
				trace(error.message);
			},
			frameworkParams: {
				assetLibraryPaths: [
					"data" => "data",
					"fonts" => "fonts",
                    "images" => "images",
					"music" => "music",
					"sounds" => "sounds"
				]
			},
            parseRules: parse_rules
		});
		#end
	}
}