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
	/*private var timerCount: Float = 0;
	private var maxTimerCounter: Float = 1;
	private var cont : Float = 0;*/
	
	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		makeGraphic(16, 16);
		velocity.x = 20;
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
		
		if (random.int(1, 300) == 3)
		{
			disparo = Reg.disparoEnemigo;
			disparo = new DisparoEnemigo();
			disparo.x = x + 6;
			disparo.y = y + 16;
			FlxG.state.add(disparo);
		}
		if (x < 0)
			Reg.verificarEnemigoIzq();
		else if (x > FlxG.width - width)
			Reg.verificarEnemigoDer();
			
		/*timerCount += elapsed;
		cont += elapsed;
		if (timerCount > maxTimerCounter)
		{
			timerCount = 0;
		}*/
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}