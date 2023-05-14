package audio_handlers;

import js.Browser;
import js.html.MediaElement;
import js.html.audio.AnalyserNode;
import js.html.audio.AudioContext;
import js.lib.Uint8Array;

class AudioAnalyzer
{
	var audioContext:AudioContext;
	var analyzer:AnalyserNode;
	var frequencyData:Uint8Array;

	public function new(mediaElement:MediaElement)
	{
		audioContext = new AudioContext();
		analyzer = audioContext.createAnalyser();
		frequencyData = new Uint8Array(analyzer.frequencyBinCount);

		var sourceNode = audioContext.createMediaElementSource(mediaElement);
		sourceNode.connect(analyzer);
		analyzer.connect(audioContext.destination);
	}

	public function update():Void
	{
		analyzer.getByteFrequencyData(frequencyData);
	}

	public function getFrequencyData():Array<Float>
	{
		var data:Array<Float> = [];
		for (i in 0...frequencyData.length)
		{
			data.push(frequencyData[i] / 255.0);
		}
		return data;
	}
}
