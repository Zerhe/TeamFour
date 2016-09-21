package states;

import flash.system.System;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import states.GameOver;
import sprites.DisparoEnemigo;
import sprites.Disparo;
import sprites.Enemy;
import sprites.Ovni;
import sprites.Estructura;
import sprites.Player;
import sprites.Vidas;
import Reg;
import Std;

class PlayState extends FlxState
{
	private var _x:Int = 20;
	private var _y:Int = 18;
	private var a:Int = 40;
	private var b:Int = 120;
	private var score:Int = 0;
	private var txtScore : FlxText;
	
	private var random : FlxRandom;
	private var player:Player;
	private var ovni:Ovni;
	private var enemy = new FlxTypedGroup<Enemy>();
	private var estructura = new FlxTypedGroup<Estructura>();
	private var sprVidas = new FlxTypedGroup<Vidas>();
	
	override public function create():Void
	{
		super.create();
		
		Reg.enemigosVivos = 15;
		random = new FlxRandom();
		txtScore = new FlxText(0, 5, 0, "Score : " + Std.string(score), 8);
		add(txtScore);
		player = new Player(60, 120);
		add(player);
		ovni = new Ovni(-300, 5);
		add(ovni);
		
		for (i in 0 ... 15)
		{
			enemy.members[i] = new Enemy(_x, _y);
			enemy.add(enemy.members[i]);
			add(enemy.members[i]);
			
			if (i > 4)
			{
				enemy.members[i].loadGraphic(AssetPaths.Enemigo02__png, true, 16, 16);
				enemy.members[i].animation.add("move", [0, 1],3 , true);
				enemy.members[i].animation.play("move");
			}
			if (i > 9)
			{
				enemy.members[i].loadGraphic(AssetPaths.Enemigo03__png, true, 16, 16);
				enemy.members[i].animation.add("move", [0, 1],3 , true);
				enemy.members[i].animation.play("move");
			}
			switch (i)
			{
				case 4:
					_x = 0;
					_y += 18;
				case 9:
					_x = 0;
					_y += 18;
			}		
			_x += 20;
		}
		for (i in 0...3)
		{
			estructura.members[i] = new Estructura(a, 100);
			add(estructura.members[i]);
			a += 35;
		}
		for (i in 0...3)
		{
			sprVidas.members[i] = new Vidas(b, 5);
			add(sprVidas.members[i]);
			b += 10;
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		trace(Reg.enemigosVivos);
		Reg.enemigo = enemy;
		txtScore.destroy();
		txtScore = new FlxText(0, 5, 0, "Score : " + Std.string(score), 8);
		add(txtScore);
		for (i in 0 ... 15)
		{
			if (FlxG.overlap(enemy.members[i], Reg.disparo))
			{
				enemy.members[i].destroy();
				Reg.verificarVivos[i] = 0;
				Reg.disparo.destroy();
				if (i > 9)
					score += 10;
				if (i > 4 && i < 10)
					score += 20;
				if (i < 5)
					score += 40;
			}
			if (FlxG.overlap(player, enemy.members[i].getDisparo()))
			{
				sprVidas.members[player.getVidas() - 1].destroy();
				player.restarVidas(1);
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
			if (FlxG.overlap(estructura.members[j], Reg.disparo))
			{
				estructura.members[j].recibirDanio(1);
				Reg.disparo.destroy();
			}
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
		if (FlxG.overlap(ovni, Reg.disparo))
		{
			ovni.destroy();
			ovni = new Ovni(-300, 5);
			add(ovni);
			Reg.disparo.destroy();
			score += random.int(1, 300);
		}
		if (ovni.x > FlxG.width)
		{
			ovni.destroy();
			ovni = new Ovni(-300, 5);
			add(ovni);
		}
		if (Reg.enemigosVivos == 0)
		{
			HighScores.verificarScore == false;
			for (i in 0...10)
			{
				if (HighScores.score[i] == 0 && HighScores.verificarScore == false)
				{
					HighScores.score[i] = score;
					HighScores.verificarScore == true;
				}
			}
			FlxG.switchState(new HighScores());
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
		if (FlxG.keys.justPressed.ESCAPE)
		{
			System.exit(0);
		}
	}
}
