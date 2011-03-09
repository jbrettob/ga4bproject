package com.jbrettob.media.sound
{
	import com.jbrettob.log.Log;

	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.utils.getQualifiedClassName;

	/**
	 * @author jaycerettob
	 */
	public class SoundChannel extends Sprite
	{
		private static var _INSTANCE:SoundChannel;
		
		private var _soundArray:Array = new Array();
		
		private static var _MUSIC_MEDIEVAL3:Class;
		private var isInit:Boolean = false;
		
		public function SoundChannel()
		{
			if (_INSTANCE) new Error("Singleton use SoundChannel.getInstance()");
		}
		
		public static function getInstance():SoundChannel
		{
			if (!_INSTANCE)
			{
				_INSTANCE = new SoundChannel();
			}
			
			return _INSTANCE;
		}
		
		public function init():void
		{
			if (this.isInit)
			{
				return;
			}
			
			
			_MUSIC_MEDIEVAL3 = Music_Medieval3;
			
			this.isInit = true;
		}
		
		public function playSound():void
		{
			var newSound:Sound = new _MUSIC_MEDIEVAL3();
			newSound.play();
			
			Log.debug('sound: ' + getQualifiedClassName(SoundChannel._MUSIC_MEDIEVAL3), this);
			
			this._soundArray.push(newSound);
		}
		
		public function stopSound():void
		{
			Log.debug('stopSound: ' + getQualifiedClassName(SoundChannel._MUSIC_MEDIEVAL3), this);
		}
	}
}
