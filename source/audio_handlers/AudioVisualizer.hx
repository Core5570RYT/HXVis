package audio_handlers;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;

class AudioVisualizer extends FlxSpriteGroup
{
	var bars:Array<FlxSprite>;
	var barWidth:Int;
	var barHeight:Int;
	var space:Int;
	var maxHeight:Int;
	var frequencies:Array<Float>;

	public static var barCount:Int = 0;

	public var sensitivity:Float = 0.6;

	public function new(barAmount:Int = 15)
	{
		super();
		barCount = barAmount;
		barWidth = 15;
		barHeight = Std.int(FlxG.height / 2);
		space = 4;
		maxHeight = FlxG.height - barHeight;
		frequencies = [];

		bars = [];
		for (i in 0...barCount)
		{
			var bar:FlxSprite = new FlxSprite();
			bar.makeGraphic(barWidth, barHeight, FlxColor.WHITE);
			bar.x = i * (barWidth + space);
			bar.y = (FlxG.height) - barHeight;
			bars.push(bar);
			add(bar);
		}
	}

	public function updateBars(frequencyData:Array<Float>):Void
	{
		frequencies = frequencyData;

		for (i in 0...bars.length)
		{
			var bar:FlxSprite = bars[i];
			var frequency:Float = frequencyData[i];
			var scaledFrequency:Float = frequency * sensitivity;
			var scaleY:Float = scaledFrequency;

			bar.scale.y = scaleY;
			var newY:Float = FlxG.height - (bar.height * scaleY);
			bar.y = newY;
		}
	}
}
