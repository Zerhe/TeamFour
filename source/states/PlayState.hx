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
	private var _x = 18;
	private var _y = 20;
	
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
			
			switch (i)
			{
				case 2:
					_x += 20;
					_y = 0;
				case 5:
					_x += 20;
					_y = 0;
				case 8:
					_x += 20;
					_y = 0;
				case 11:
					_x += 20;
					_y = 0;
			}
			
			_y += 20;
		}
		add(player);
		Reg.verificarEnemigo(enemy);
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
				Reg.verificarEnemigo(enemy);
			}
			if (FlxG.overlap(player, enemy.members[i].getDisparo()))
			{
				trace("pepito");
				player.destroy();
				enemy.members[i].destroyDisparo();
			}
		}
		
		if (FlxG.keys.justPressed.R) 
		{
			Reg.cantidadDisparo = 0;
			FlxG.resetState();  
		}
	}
}
