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
	
	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		loadGraphic(AssetPaths.Enemigo01__png, true, 16, 16);
		animation.add("move", [0, 1], 3, true);
		animation.play("move");
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
	}
	override public function destroy(): Void
	{
		Reg.enemigosVivos -= 1;
		super.destroy();
	}	
}