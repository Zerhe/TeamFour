package states;

import flash.system.System;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import states.PlayState;

/**
 * ...
 * @author ...
 */
class HighScores extends FlxState
{
	private var _y:Int = 15;
	static public var verificarScore:Bool;
	static public var score = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	static public var txtScore : FlxText;

	override public function create():Void
	{
		for (i in 0...10)
		{
			txtScore = new FlxText(50, _y, 0, "Score " + i + ":" + score[i], 8);
			add(txtScore);
			_y += 10;
		}
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.SPACE)
		{
			FlxG.switchState(new MenuState());
		}
		if (FlxG.keys.justPressed.ESCAPE)
		{
			System.exit(0);
		}	
	}
}