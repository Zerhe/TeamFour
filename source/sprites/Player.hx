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
	var cartilos = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(16, 16, 0xFFFF0000);
		loadGraphic(AssetPaths.c__png);
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		trace(Reg.cantidadDisparo);
		
		if (FlxG.keys.pressed.LEFT) 
			x -= 150 * FlxG.elapsed;
		if (FlxG.keys.pressed.RIGHT) 
			x += 150 * FlxG.elapsed;

		if (FlxG.keys.justPressed.SPACE)
		{
			if (Reg.cantidadDisparo == 0)
			{
				Reg._disparo =  new Disparo();
				Reg._disparo.x = x + 6;
				Reg._disparo.y = y ;
				Reg.cantidadDisparo += 1;
				FlxG.state.add(Reg._disparo);
			}
		}
		
		if(x > (FlxG.width - this.width))
			x = (FlxG.width - this.width);
			else if (x < 0)
				x = 0;
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}