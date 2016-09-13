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

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	
		makeGraphic(16, 16);
		velocity.x = 5;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);		
	}
	override public function destroy(): Void
	{
		super.destroy();
	}	
}