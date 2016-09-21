package sprites;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxSprite;
import flixel.FlxG;
import Reg;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	private var vidas:Int= 3;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.chutulu__png,16,16);
		
	}
	public function getVidas():Int
	{
		return vidas;
	}
	public function restarVidas(danio:Int)
	{
		vidas -= danio;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.LEFT) 
			x -= 150 * FlxG.elapsed;
		if (FlxG.keys.pressed.RIGHT) 
			x += 150 * FlxG.elapsed;

		if (FlxG.keys.justPressed.SPACE)
		{
			if (Reg.cantidadDisparo == 0)
			{
				Reg.disparo =  new Disparo();
				Reg.disparo.x = x + 6;
				Reg.disparo.y = y ;
				Reg.cantidadDisparo += 1;
				FlxG.state.add(Reg.disparo);
			}
		}
		
		if(x > (FlxG.width - this.width))
			x = (FlxG.width - this.width);
			else if (x < 0)
				x = 0;
		if (vidas == 0)
		destroy();
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}