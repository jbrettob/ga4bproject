package com.jbrettob.media.sound
{
	import flash.media.SoundTransform;
	import com.jbrettob.enum.Sounds;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;

	/**
	 * @author Jayce Rettob
	 */
	public class SoundChannelKing extends Sprite
	{
		private static var _INSTANCE:SoundChannelKing;
		private var _musicArray:Array = new Array();
		private var _soundArray:Array = new Array();
		private var _audioArray:Array = new Array();
		
		private var isInit:Boolean = false;

		public function SoundChannelKing()
		{
			if (_INSTANCE) new Error("Singleton use SoundChannel.getInstance()");
		}

		public static function getInstance():SoundChannelKing
		{
			if (!_INSTANCE)
			{
				_INSTANCE = new SoundChannelKing();
			}

			return _INSTANCE;
		}

		public function init():void
		{
			if (this.isInit)
			{
				return;
			}

			this._audioArray.push(Sounds.BACKGROUND_MUSIC_01 as Class);

			this.isInit = true;
		}

		public function playSound(url:Class, value:Number = 0):void
		{
			var S_Sound:Class = this.getAudio(url);
			var newSound:Sound = new S_Sound();
			if (value >= 1)
			{
				newSound.addEventListener(Event.COMPLETE, handleSoundComplete);
			}

			var newSoundChannel:SoundChannel = new SoundChannel();
			newSoundChannel = newSound.play();

			this._soundArray.push(newSoundChannel);
		}
		
		public function playMusic(url:Class, value:Number = 0):void
		{
			var Music:Class = this.getAudio(url);
			
			var newSound:Sound = new Music();
			if (value >= 1)
			{
				newSound.addEventListener(Event.COMPLETE, handleSoundComplete);
			}

			var newSoundChannel:SoundChannel = new SoundChannel();
			newSoundChannel = newSound.play();

			this._musicArray.push(newSoundChannel);
		}

		private function getAudio(value:Class):Class
		{
			var returnClass:Class;
			
			for each(var i:Class in this._audioArray)
			{
				if (i == value)
				{
					returnClass = i;
				}
			}
			return returnClass;
		}

		private function handleSoundComplete(event:Event):void
		{
			Sound(event.target).play();
		}
		
		public function muteALlMusic():void
		{
			var soundTransform:SoundTransform;
			
			for each (var i:SoundChannel in this._musicArray)
			{
				if (i.soundTransform.volume == 0)
				{
					soundTransform = new SoundTransform(1, 0);
				}
				else
				{
					soundTransform = new SoundTransform(0, 0);
				}
				
				i.soundTransform = soundTransform; 
			}
		}
		
		public function muteALlSound():void
		{
			var soundTransform:SoundTransform;
			
			for each (var i:SoundChannel in this._soundArray)
			{
				if (i.soundTransform.volume == 0)
				{
					soundTransform = new SoundTransform(1, 0);
				}
				else
				{
					soundTransform = new SoundTransform(0, 0);
				}
				
				i.soundTransform = soundTransform; 
			}
		}
		
		public function stopAll():void
		{
			for each (var a:SoundChannel in this._soundArray)
			{
				a.stop();
			}
			
			for each (var b:SoundChannel in this._musicArray)
			{
				b.stop();
			}
		}
	}
}
