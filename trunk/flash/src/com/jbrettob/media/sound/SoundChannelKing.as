package com.jbrettob.media.sound
{
	import com.jbrettob.enum.Sounds;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;

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
		private var _soundMute:Boolean = false;

		public function SoundChannelKing()
		{
			if (_INSTANCE) new Error("Singleton use SoundChannel.getInstance()");
		}

		public static function getInstance():SoundChannelKing
		{
			if (!_INSTANCE)
			{
				_INSTANCE = new SoundChannelKing();
				SoundChannelKing.getInstance().init();
			}

			return _INSTANCE;
		}

		public function init():void
		{
			if (this.isInit)
			{
				return;
			}
			
			this._soundMute = false;

			// manual add
			this._audioArray.push(Sounds.MUSIC_MENU as Class);
			this._audioArray.push(Sounds.MUSIC_INGAME as Class);
			this._audioArray.push(Sounds.SOUND_BUTTONPRESSED as Class);
			this._audioArray.push(Sounds.SOUND_CANONSHOOT as Class);
			this._audioArray.push(Sounds.SOUND_CHARACERSHOOT as Class);
			this._audioArray.push(Sounds.SOUND_CREATIVITYORB as Class);
			this._audioArray.push(Sounds.SOUND_ENEMYDESTROYED as Class);
			this._audioArray.push(Sounds.SOUND_SHOOTPRO as Class);
			this._audioArray.push(Sounds.SOUND_SHOOT2D as Class);
			this._audioArray.push(Sounds.SOUND_SHOOT3D as Class);
			this._audioArray.push(Sounds.SOUND_CHARACTERHIT as Class);
			this._audioArray.push(Sounds.SOUND_KINGMUMBLE as Class);
			this._audioArray.push(Sounds.SOUND_HORNALERT as Class);
			this._audioArray.push(Sounds.SOUND_CHARACTERSWITCH as Class);

			this.isInit = true;
		}

		public function playSound(url:Class, value:Number = 0):void
		{
			if (this._soundMute) return;
			
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
			if(this._musicArray.length >= 1)
			{
				SoundChannelKing.getInstance().stopAllMusic();
			}
			
			var Music:Class = this.getAudio(url);

			var newSound:Sound = new Music();
			if (value >= 1)
			{
				newSound.addEventListener(Event.COMPLETE, handleSoundComplete);
			}

			var newSoundChannel:SoundChannel = new SoundChannel();
			newSoundChannel = newSound.play();
			newSoundChannel.soundTransform = new SoundTransform(.9);

			this._musicArray.push(newSoundChannel);
		}

		private function getAudio(value:Class):Class
		{
			var returnClass:Class;

			for each (var i:Class in this._audioArray)
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

		public function unMuteAllMusic():void
		{
			var soundTransform:SoundTransform;

			for each (var i:SoundChannel in this._musicArray)
			{
				soundTransform = new SoundTransform(1, 0);

				i.soundTransform = soundTransform;
			}
		}

		public function muteALlMusic():void
		{
			var soundTransform:SoundTransform;

			for each (var i:SoundChannel in this._musicArray)
			{
				soundTransform = new SoundTransform(0, 0);

				i.soundTransform = soundTransform;
			}
		}

		public function muteUnMuteAllMusic():void
		{
			var soundTransform:SoundTransform;

			for each (var i:SoundChannel in this._musicArray)
			{
				if (i.soundTransform.volume <= 0)
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
		
		public function stopAllMusic():void
		{
			for each (var i:SoundChannel in this._musicArray)
			{
				i.stop();
			}
		}
		
		public function unMuteAllSound():void
		{
			var soundTransform:SoundTransform;

			for each (var i:SoundChannel in this._soundArray)
			{
				soundTransform = new SoundTransform(1, 0);

				i.soundTransform = soundTransform;
			}
		}

		public function muteALlSound():void
		{
			var soundTransform:SoundTransform;

			for each (var i:SoundChannel in this._soundArray)
			{
				soundTransform = new SoundTransform(0, 0);

				i.soundTransform = soundTransform;
			}
		}

		public function muteUnMuteALlSound():void
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

		public function get soundMute():Boolean
		{
			return this._soundMute;
		}

		public function set soundMute(value:Boolean):void
		{
			this._soundMute = value;
			
			if (this._soundMute)
			{
				this.unMuteAllSound();
			} else 
			{
				this.muteALlSound();
			}
		}
	}
}
