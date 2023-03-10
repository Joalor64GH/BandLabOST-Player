# How to make a Mod
## Creating the Folder
Create a folder in the `mods` folder and rename it to whatever you want.

Doing this manually isn't a problem, but it would be better and faster if you copy-and-pasted the Template.

![](https://github.com/Joalor64GH/Chocolate-Engine/blob/master/art/polymodtutorial/polymods1.png?raw=true)
![](https://github.com/Joalor64GH/Chocolate-Engine/blob/master/art/polymodtutorial/polymods2.png?raw=true)

## In-Game Mod Info

The info for a mod is stored in two files. Those two files are `_polymod_meta.json` and `_polymod_icon.png`.

### `_polymod_meta.json`
In `_polymod_meta.json`, you can define the mod name, the name of the author, etc.

Example:
```json
{
	"title":"Title",
	"description":"Description.",
	"author":"Your Name Here",
	"api_version":"6.9.0",
	"mod_version":"4.2.0",
	"license":"Apache-2.0"
}
```

### `_polymod_icon.png`
As for `_polymod_icon.png`, it's just a simple `.png` icon for the mod. Just keep in mind that **whatever image it is, it will always be squished into a `150 by 150` resolution**. So a `1:1` aspect ratio is recommended for your image.

If you've done everything correctly, your mod should appear in the Mods Menu.

Then, you're basically good to go!

## Quick Example

Here's a quick example by [EliteMasterEric](https://twitter.com/EliteMasterEric) » [here](https://github.com/EnigmaEngine/ModCore-Tricky-Mod) «