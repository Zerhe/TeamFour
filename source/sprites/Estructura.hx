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
		makeGraphic(16,16);
		color = 0xFF0000;
	}
	public function recibirDanio(a : Int)
	{
		resistencia -= a;
	}
	override public function update(elapsed:Float):Void
	{
		if (resistencia == 0)
		{
			destroy();
		}
	}
}