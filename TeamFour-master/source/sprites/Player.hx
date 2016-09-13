package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import Reg;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(16, 16, 0xFFFF0000);
		//loadGraphic(AssetPaths.c_png, 16, 16);
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.LEFT) 
			x -= 300 * FlxG.elapsed;
		if (FlxG.keys.pressed.RIGHT) 
			x += 300 * FlxG.elapsed;

		if (FlxG.keys.justPressed.SPACE)
		{
			if (Reg.cantidadDisparo == 0)
			{
				var b : Disparo = new Disparo();
				b.x = x + width / 3;
				b.y = y + height / 2;
				Reg.cantidadDisparo += 1;
				FlxG.state.add(b);
			}
			
		}
		
		if(x > (FlxG.width - this.width))
			x = (FlxG.width - this.width);
			else if (x < 0)
				x = 0;
	}
}