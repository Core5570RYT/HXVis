package;

import audio_handlers.AudioAnalyzer;
import audio_handlers.AudioVisualizer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.ui.FlxButton;
import js.Browser;
import js.html.MediaElement;
import js.html.audio.AudioContext;

class State extends FlxState
{
	var audioAnalyzer:AudioAnalyzer;
	var visualizer:AudioVisualizer;
	var mediaElement:MediaElement;
	var button:FlxButton;
	var canBePlayed = false;

	override public function create():Void
	{
		button = new FlxButton(FlxG.width / 2, FlxG.height / 2, "Play", playPressed);
		button.x -= button.width / 2;
		button.y -= button.height / 2;
		add(button);
	}

	function playPressed()
	{
		canBePlayed = true;
		// Load and play audio
		mediaElement = cast Browser.document.createElement("audio");
		mediaElement.src = "assets/audio.mp3";
		mediaElement.controls = false;
		mediaElement.autoplay = true;

		audioAnalyzer = new AudioAnalyzer(mediaElement);

		visualizer = new AudioVisualizer(60);
		visualizer.x = (FlxG.width - visualizer.width) / 2;
		visualizer.y = (FlxG.height - visualizer.height) / 2;

		// this was first used because of AudioContext policies
		// disabled for testing reasons
		// FlxG.sound.playMusic("assets/audio.mp3");
		add(visualizer);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (canBePlayed)
		{
			audioAnalyzer.update();

			var frequencyData:Array<Float> = audioAnalyzer.getFrequencyData();
			visualizer.updateBars(frequencyData);
		}
	}
}
