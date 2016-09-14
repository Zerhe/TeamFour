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
	var timerCount: Float = 0;
	var maxTimerCounter: Float = 1;
	var ancho : Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		makeGraphic(16, 16);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
<<<<<<< HEAD
=======
		//	trace(elapsed);
>>>>>>> origin/master
		
		timerCount += elapsed;
		if (timerCount > maxTimerCounter)
		{
			if (x > FlxG.width - this.width)
			{
				y += 20;
				ancho = true;
			}else if (x < 0)
			{
				y += 20;
				ancho = false;
			}
			if (ancho == true)
			{
				x -= 10;
			}else
			{
				x += 10;
			}
			
			timerCount = 0;
		}
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}