package resources;

import flixel.FlxG;
import haxe.Timer;
import openfl.events.Event;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;

class ResInf extends TextField
{
	public var times:Array<Float>;

	public function new(inX:Float = 10.0, inY:Float = 10.0, inCol:Int = 0x000000, bold:Bool = false)
	{
		super();
		x = inX;
		y = inY;
		selectable = false;
		defaultTextFormat = new TextFormat("_sans", 14, inCol, false);
		text = "FPS: ";
		times = [];
		addEventListener(Event.ENTER_FRAME, onEnter);
		width = 170;
		height = 70;
	}

	private function onEnter(_)
	{
		var now = Timer.stamp();

		times.push(now);

		while (times[0] < now - 1)
			times.shift();

		var mem:Float = Math.round(System.totalMemory / 1024 / 1024 * 100) / 100;
		var ramStr:String = '';
		if (mem >= 1024)
			ramStr = Math.round(mem / 1024) + ' GB';
		else
			ramStr = mem + ' MB';

		if (mem >= 2048)
		{
			openfl.Assets.cache.clear();
			FlxG.save.flush();
		}

		if (visible)
		{
			text = "FPS: " + times.length + "\nRAM: " + ramStr;
		}

		if (times.length < 30)
		{
			textColor = 0xFF6868;
		}
		else
		{
			textColor = 0xFFFFFF;
		}
	}
}
