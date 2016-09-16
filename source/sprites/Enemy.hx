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
	private var disparo : DisparoEnemigo;
	private var random : FlxRandom;
	private var timerCount: Float = 0;
	private var maxTimerCounter: Float = 1;
	//private var cont : Float = 0;
	
	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		makeGraphic(16, 16);
		random = new FlxRandom();
	}
	public function getDisparo() : DisparoEnemigo
	{
		return disparo;
	}
	public function destroyDisparo() : Void
	{
		disparo.destroy();
	}	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (random.int(1, 900) == 3)
		{
			disparo = Reg.disparoEnemigo;
			disparo = new DisparoEnemigo();
			disparo.x = x + 6;
			disparo.y = y + 16;
			FlxG.state.add(disparo);
		}
			
		timerCount += elapsed;
		//cont += elapsed;
		if (timerCount > maxTimerCounter)
		{
			if (Reg.enemigoColisionDerecha.x > FlxG.width - Reg.enemigoColisionDerecha.width)
			{
				x -= 10;
				Reg.movimiento = true;
			}
			else if (Reg.enemigoColisionIzquierda.x <= 0)
			{
				x += 10;
				Reg.movimiento = false;
			}
			else if (Reg.enemigoColisionIzquierda.x < FlxG.width && Reg.movimiento == false)
			{
				x += 10;	
			}
			else if (Reg.enemigoColisionDerecha.x > 0 && Reg.movimiento == true)
			{
				x -= 10;
			}
			timerCount = 0;
		}
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}