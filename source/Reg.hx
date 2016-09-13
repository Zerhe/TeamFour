package;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxSprite;
import flixel.FlxG;
import sprites.Player;
import sprites.Disparo;


class Reg
{	
	static public var cantidadDisparo = 0;
	static public var _disparo;
	static public var collisionBalaEnemigo = false;
	
	static public function setObjeto(disparo:FlxSprite):Void
	{
		_disparo = disparo;
	}
	static public function getObjeto():FlxSprite
	{
		return _disparo;
	}
	
}