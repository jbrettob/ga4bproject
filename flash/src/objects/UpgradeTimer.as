package objects
{
	import com.greensock.TweenLite;
	import com.jbrettob.log.Log;

	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Jayce Rettob
	 */
	public class UpgradeTimer extends HUD_UpgradeTimer
	{
		private var _exp:Number = 0;
		private var _maxExp:Number = 1;
		private var _addMinExp:Number = 20;
		private var _canUse:Boolean = false;
		private var _timer:Timer;
		
		public function UpgradeTimer():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
			
			this.init();
		}

		private function init():void
		{
			this.mcFillColor.width = 0;
			
			this._timer = new Timer(5000);
			this._timer.addEventListener(TimerEvent.TIMER, this.handleTimer);
			this._timer.start();
		}

		private function handleTimer(event:TimerEvent):void
		{
			this.addUpgrade(Math.random() * 0.5);
		}
		
		public function addUpgrade(amount:Number = 0):void
		{
			if (amount <= 0)
			{
				this.exp = this._addMinExp;
			}
			
			this.exp += amount;
			
			if (this._exp >= this._maxExp)
			{
				this.log('Cannon is ready');
				
				this.exp = this._maxExp;
				
				this._canUse = true;
				this._timer.stop();
			}
		}
		
		public function useUpgrade():void
		{
			if (this._canUse)
			{
				this.exp = 0;
				this._canUse = false;
				
				this._timer.start();
			}
		}
		
		public function set exp(amount:Number):void
		{
			this._exp = amount;
			
			var newWidth:Number = 100 * this._exp;
			
			TweenLite.to(this.mcFillColor, 2, { width: newWidth, overwrite: true } );
		}
		
		public function get exp():Number
		{
			return this._exp;
		}
		
		public function set canUse(output:Boolean):void
		{
			this._canUse = output;
		}
		
		public function get canUse():Boolean
		{
			return this._canUse;
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
