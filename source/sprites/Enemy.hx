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
<<<<<<< HEAD
	private var random : FlxRandom;
=======
	private var timerCount: Float = 0;
	private var maxTimerCounter: Float = 1;
	private var cont : Float = 0;
>>>>>>> origin/master
	
	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		makeGraphic(16, 16);
<<<<<<< HEAD
		random = new FlxRandom();
=======
>>>>>>> origin/master
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
<<<<<<< HEAD
		random = random.int(1, 5);
		if (random == 3)
		{
			Reg.disparoEnemigo = new DisparoEnemigo();
			Reg.disparoEnemigo.x = x + 6;
			Reg.disparo.y = y ;
		}			  
=======
		timerCount += elapsed;
		cont += elapsed;
		
		if (timerCount > maxTimerCounter)
		{
			if (cont < 4)
			{
				x += 10;
			}
			else if (cont > 4)
			{
				x -= 10;
				if (Reg._Y == 1)
			}
			if (cont > 7)
				cont = 0;			
			timerCount = 0;
		}
		if ()
		{
			y += 20;
			x -= 1;
		}
>>>>>>> origin/master
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}