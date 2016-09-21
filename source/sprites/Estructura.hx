package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import Reg;

/**
 * ...
 * @author ...
 */
class Estructura extends FlxSprite
{
	private var resistencia : Int = 3;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Estructuras__png, true, 16, 16);
	}
	public function recibirDanio(a : Int)
	{
		resistencia -= a;
	}
	override public function update(elapsed:Float):Void
	{
		if (resistencia == 2)
		{
			animation.add("casiRoto", [1], 0, true);
			animation.play("casiRoto");
		}
		if (resistencia == 1)
		{
			animation.add("roto", [2], 0, true);
			animation.play("roto");
		}
		if (resistencia == 0)
		{
			destroy();
		}
	}
}