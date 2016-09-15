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
	private var timerCount: Float = 0;
	private var maxTimerCounter: Float = 1;
	private var cont : Float = 0;
	
	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		makeGraphic(16, 16);
		random = new FlxRandom();
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (random.int(1, 900) == 3)
		{
			Reg.disparoEnemigo = new DisparoEnemigo();
			Reg.disparoEnemigo.x = x + 6;
			Reg.disparoEnemigo.y = y + 16;
			FlxG.state.add(Reg.disparoEnemigo);
		}			  
		
		/*timerCount += elapsed;
		cont += elapsed;
		if (timerCount > maxTimerCounter)
		{
			if (cont < 4)
			{
				x += 10;
			}
			else if (cont > 6)
			{
				x -= 10;
			}
			if (cont > 9)
			{
				cont = 0;	
			}
			timerCount = 0;
		}*/
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}