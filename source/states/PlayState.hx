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
import sprites.Estructura;
import sprites.Player;
import Reg;

class PlayState extends FlxState
{
	private var _x = 18;
	private var _y = 18;
	private var a = 40;
	
	private var player : Player;
	private var enemy = new FlxTypedGroup<Enemy>();
	private var estructura = new FlxTypedGroup<Estructura>();
	
	override public function create():Void
	{
		super.create();
		
		player = new Player(60, 120);
		add(player);
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
			
			_y += 18;
		}
		for (i in 0...3)
		{
			estructura.members[i] = new Estructura(a, 100);
			add(estructura.members[i]);
			a += 35;
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		Reg.enemigo = enemy;
		for (i in 0 ... 15)
		{
			if (FlxG.overlap(enemy.members[i], Reg.disparo))
			{
				enemy.members[i].destroy();
				Reg.verificarVivos[i] = 0;
				Reg.disparo.destroy();
			}
			if (FlxG.overlap(player, enemy.members[i].getDisparo()))
			{
				trace("pepito");
				player.destroy();
				enemy.members[i].destroyDisparo();
			}
			if (FlxG.overlap(player, enemy.members[i]))
			{
				player.destroy();
				enemy.members[i].destroy();
			}
		}
		for (j in 0...3)
		{
			for (i in 0...15)
			{
				if (FlxG.overlap(estructura.members[j], enemy.members[i].getDisparo()))
				{
					estructura.members[j].recibirDanio(1);
					enemy.members[i].destroyDisparo();
				}
				if (FlxG.overlap(estructura.members[j], enemy.members[i]))
				{
					estructura.members[j].destroy();
					enemy.members[i].destroy();
				}
			}
		}
		
		if (FlxG.keys.justPressed.R) 
		{
			Reg.cantidadDisparo = 0;
			for (i in 0...15)
			{
				Reg.verificarVivos[i] = 1;
			}
			FlxG.resetState();  
		}
	}
}
