package;

import flixel.FlxGame;
import openfl.display.Sprite;
import resources.ResInf;

class Main extends Sprite
{
	public function new()
	{
		super();
		var res:ResInf = new ResInf(10, 10, 0xFFFFFFFF);
		addChild(new FlxGame(1280, 720, State));
		addChild(res);
		flixel.FlxG.autoPause = false;
	}
}
