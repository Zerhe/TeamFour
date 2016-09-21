package states;

import flash.system.System;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

/**
 * ...
 * @author ...
 */
class GameOver extends FlxState
{
	private var fondo:FlxSprite;
	override public function create(): Void 
	{
		fondo = new FlxSprite(0, 0, 'assets/images/GameOver.png');
		add(fondo);	
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.SPACE)
		{
			FlxG.switchState(new PlayState());
		}
		if (FlxG.keys.justPressed.ESCAPE)
		{
			System.exit(0);
		}	
	}
	
}