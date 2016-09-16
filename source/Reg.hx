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
	static public var enemigoColisionDerecha:Enemy;
	static public var enemigoColisionIzquierda:Enemy;
	static public var disparo:Disparo;
	static public var disparoEnemigo :DisparoEnemigo;
	static public var movimiento:Bool = false;

	
	static public function verificarEnemigo(enemy : FlxTypedGroup<Enemy>) : Void
	{
		for (i in 0...15)
		{
			trace(i);
			if(enemy.members[i] != null)
				enemigoColisionDerecha = enemy.members[i];
		}
		for (i in new DecIter(15, 0))
		{
			trace(i);
			if(enemy.members[i] != null)
				enemigoColisionIzquierda = enemy.members[i];
		}
	}
}