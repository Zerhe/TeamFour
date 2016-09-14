package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Disparo;
import sprites.Enemy;
import sprites.Player;

class PlayState extends FlxState
{
	private var player : Player;
	private var enemigos : Enemy;
	
	override public function create():Void
	{
		super.create();
		
		player = new Player(60, 120);
		enemigos = new Enemy(10, 10);
		
		add(enemigos);
		add(player);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);	
		
		if (FlxG.overlap(enemigos, Reg._disparo))
		{
			enemigos.destroy();
			Reg._disparo.destroy();
		}
		if (FlxG.keys.justPressed.R) 
		{
			FlxG.resetState();        
		}
	}
}
