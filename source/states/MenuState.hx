package states;

import flash.system.System;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import states.PlayState;

class MenuState extends FlxState
{
	private var fondo:FlxSprite;
	override public function create():Void
	{
		super.create();
		
		fondo = new FlxSprite(0, 0, 'assets/images/menu.png');
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