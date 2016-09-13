package sprites;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxSprite;
import flixel.FlxG;
import Reg;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite
{
	var conteo : Float = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		makeGraphic(16, 16);
		//velocity.x = 5;	
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		trace(elapsed);
		
		conteo += elapsed;
		if (conteo == 2)
		{
			x += 50;
			conteo = 0;
		}
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}