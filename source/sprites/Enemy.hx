package sprites;

import flixel.math.FlxRandom;
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
	private var random : FlxRandom;
	
	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		makeGraphic(16, 16);
		random = new FlxRandom();
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		random = random.int(1, 5);
		if (random == 3)
		{
			Reg.disparoEnemigo = new DisparoEnemigo();
			Reg.disparoEnemigo.x = x + 6;
			Reg.disparo.y = y ;
		}			  
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}