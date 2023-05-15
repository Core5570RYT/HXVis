## HXVis
Audio Visualization made using HaxeFlixel.

## Getting started
1. You'll need to install Haxe first fromhttps://haxe.org/download/ .
2. Once you have Haxe installed, run all commands from https://haxeflixel.com/documentation/install-haxeflixel/ on your terminal.

## Compiling
> Unfortunately, this version is only for HTML5.
1. On your terminal, change directory to where did you save this repository (example: cd C:/Users/User/Downloads/HXVis-master)
2. Type and run "lime build html5" or "lime test html5" on your terminal.
3. Compiled html5 version of HXVis will be located on /export/release/html5/

## Usage
To change the audio, you'll need to add your MP3 file to assets/elwawa/ folder, and rename it to audio.mp3.
<br/> ![An audio file with file name of "audio.mp3"](https://github.com/Core5570RYT/HXVis/assets/73734126/53ff3007-8418-4a5b-9068-95e57970dc68)

To change the color of the visualizer, go to sources/audio_handlers/AudioVisualizer.hx and go to line 35.
Change the "FlxColor.WHITE" to whatever color you want (read https://api.haxeflixel.com/flixel/util/FlxColor.html) or you can use hex colors (0xFF000000)
<br/> ![FlxColor](https://github.com/Core5570RYT/HXVis/assets/73734126/fceaab7e-ca5d-478a-80a2-2b08dd1b7af1)
<br/> ![HEX](https://github.com/Core5570RYT/HXVis/assets/73734126/7db7a466-7551-4d98-9119-96292c026802)

To change the amount of the bars on the visualizer, go to sources/State.hx, and go to line 41
