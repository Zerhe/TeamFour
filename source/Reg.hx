package;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import sprites.DisparoEnemigo;
import sprites.Player;
import sprites.Enemy;
import sprites.Disparo;


class Reg
{	
	static public var cantidadDisparo:Int = 0;
	static public var disparo:Disparo;
	static public var disparoEnemigo:DisparoEnemigo;
	static public var enemigo:FlxTypedGroup<Enemy>;
	static public var verificarVivos = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
	static public var enemigosVivos = 15;
	
	static public function verificarEnemigoIzq() : Void
	{
		for (i in 0...15)
		{
			if (verificarVivos[i] != 0)
			enemigo.members[i].velocity.x = 20;	
			enemigo.members[i].y += 5;
		}
	}
	static public function verificarEnemigoDer() : Void
	{
		for (i in 0...15)
		{
			if (verificarVivos[i] != 0)
			enemigo.members[i].velocity.x = -20;
			enemigo.members[i].y += 5;
		}
	}
}