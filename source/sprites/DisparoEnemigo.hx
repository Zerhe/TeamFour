package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import Reg;

/**
 * ...
 * @author ...
 */
class DisparoEnemigo extends FlxSprite
{	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(4,4);
		color = 0xFF0000;
		velocity.y = 170;			
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (y > FlxG.height)
			destroy();
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}
