package com.jbrettob.display
{
	import com.jbrettob.log.Log;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Jayce Rettob
	 */
	public class Actor extends MovieClip
	{
		public var objectHolder:ObjectHolder;
		
		private var _health:Number;
		private var _alife:Boolean = true;
		private var _moveSpeed:Number;
		private var _timer:Timer;

		public function Actor():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.init();
		}

		public function init():void
		{
			// override method

			if (this._timer)
			{
				this._timer.removeEventListener(TimerEvent.TIMER, this.handleTimer);
				this._timer.stop();
				this._timer = null;
			}

			this._timer = new Timer(GameSetings.GAMESPEED);
			this._timer.addEventListener(TimerEvent.TIMER, this.handleTimer);
			this._timer.start();
		}
		
		private function handleTimer(event:TimerEvent):void
		{
			this.update();
		}

		public function update():void
		{
			// override method

			if (this._health <= 0)
			{
				this.destroy();
			}
		}

		public function get moveSpeed():Number
		{
			return _moveSpeed;
		}

		public function set moveSpeed(moveSpeed:Number):void
		{
			this._moveSpeed = moveSpeed;
		}

		public function get health():Number
		{
			return _health;
		}

		public function set health(health:Number):void
		{
			this._health = health;
		}

		public function get alife():Boolean
		{
			return _alife;
		}

		public function set alife(alife:Boolean):void
		{
			this._alife = alife;
		}
		
		public function destroy():void
		{
			// override method

			if (this._timer)
			{
				this._timer.removeEventListener(TimerEvent.TIMER, this.handleTimer);
				this._timer.stop();
				this._timer = null;
			}
		}
		
		// Log for flash traces
		// Possible make a static class for it and implent it in all the classes for easy debugging
		// GameSetting.SHOW_TRACE = true or false
		
		
		public function log(output:String):void
		{
			Log.log(output, this);
		}
		
		public function debug(output:String):void
		{
			Log.debug(output, this);
		}
	}
}
