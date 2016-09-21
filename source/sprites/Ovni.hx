package sprites;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxSprite;
import flixel.FlxG;
import Reg;

/**
 * ...
 * @author ...
 */
class Ovni extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.Enemigo04__png, true, 16, 16);
		animation.add("move", [0, 1, 2], 3, true);
		animation.play("move");
		velocity.x = 40;
		
	}
	override public function destroy(): Void
	{
		
		super.destroy();
	}	
	
}