package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.FlxObject;
import sprites.Disparo;
import sprites.Enemy;
import sprites.Player;

class PlayState extends FlxState
{
	private var player : Player;
	private var enemy : FlxTypedGroup<FlxObject>;
	var _x = 5;
	var _y = 5;
	override public function create():Void
	{
		super.create();
		enemy = new FlxTypedGroup<FlxObject>();
		for (i in 0... 15)
		{
			var enemy1 = new Enemy(_x, _y);
			if (i == 5)
				_y += 20;
			if (i == 10)
				_y += 20;
			enemy.add(enemy1);
			_x += 20;
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
}
