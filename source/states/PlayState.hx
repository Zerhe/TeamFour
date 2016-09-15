package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.DisparoEnemigo;
import sprites.Disparo;
import sprites.Enemy;
import sprites.Player;
import Reg;

class PlayState extends FlxState
{
	private var _x = 20;
	private var _y = 10;
	
	private var player : Player;
	private var enemy = new FlxTypedGroup<Enemy>();
	
	override public function create():Void
	{
		super.create();
		
		player = new Player(60, 120);
		for (i in 0 ... 15)
		{
			enemy.members[i] = new Enemy(_x, _y);
			enemy.add(enemy.members[i]);
			add(enemy.members[i]);
			
			if (i == 4)
			{
				_y += 20;
				_x = 0;
			}
			else if (i == 9)
			{
				_y += 20;
				_x = 0;
			}
			
			_x += 20;
		}
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);	
		
		for (i in 0 ... 15)
		{
			if (FlxG.overlap(enemy.members[i], Reg.disparo))
				{
					enemy.members[i].destroy();
					Reg.disparo.destroy();
				}
		}
		if (FlxG.overlap(player, Reg.disparoEnemigo))
		{
			trace("pepito");
			player.destroy();
			Reg.disparoEnemigo.destroy();
		}
		if (FlxG.keys.justPressed.R) 
		{
			FlxG.resetState();  
			Reg.cantidadDisparo = 0;
		}
	}
}
