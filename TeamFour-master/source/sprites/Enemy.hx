package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite
{
	
		var timerCount: Float = 0;
		var maxTimerCounter: Float = 5;
		var contador;
		var _x;
		var _y;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16, 0xFFFF0000);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		timerCount += elapsed;
		if (timerCount > maxTimerCounter)
		{
			_x += 2;
			timerCount = 0;
		}
	}
}