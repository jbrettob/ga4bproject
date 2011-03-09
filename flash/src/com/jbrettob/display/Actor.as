package com.jbrettob.display
{
	import objects.Hud;

	import com.greensock.TweenLite;
	import com.greensock.plugins.ColorTransformPlugin;
	import com.greensock.plugins.TintPlugin;
	import com.greensock.plugins.TweenPlugin;
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
		private var _maxHealth:Number;
		private var _alife:Boolean = true;
		private var _moveSpeed:Number;
		private var _timer:Timer;
		private var _score:Number = 0;

		public function Actor():void
		{
			TweenPlugin.activate([TintPlugin, ColorTransformPlugin]);
			
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
				Hud.getInstance().score = this.score;
				this.destroy();
			}
		}
		
		public function hitColorTween():void
		{
			TweenLite.to(this, .05, {colorTransform:{tint:0xff0000, tintAmount:0.75}, onComplete:this.resetColorTween, overwrite: true});
		}
		
		public function resetColorTween():void
		{
			TweenLite.to(this, .02, {colorTransform:{tint:0xff0000, tintAmount:0}, overwrite: true});
		}
		
		// setters & getters
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
		
		public function get maxHealth():Number
		{
			return this._maxHealth;
		}

		public function get alife():Boolean
		{
			return _alife;
		}

		public function set alife(alife:Boolean):void
		{
			this._alife = alife;
		}
		
		public function get score():Number
		{
			return this._score;
		}

		public function set score(value:Number):void
		{
			this._score = value;
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
			
			TweenLite.killTweensOf(this);
		}
		
		// logging for traces
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
