package objects
{
	import com.greensock.TweenLite;
	import com.jbrettob.log.Log;

	import flash.events.Event;

	/**
	 * @author Jayce Rettob
	 */
	public class UpgradeTimer extends HUD_UpgradeTimer
	{
		private var _exp:Number = 0;
		private var _maxExp:Number = 100;
		private var _canUse:Boolean = false;

		public function UpgradeTimer():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
			this.gotoAndStop(1);
			this.scaleX = this.scaleY = 0.5;
		}

		public function addUpgrade(value:Number = 0):void
		{
			if ((this._exp + value) >= this._maxExp)
			{
				this.log('Cannon is ready');

				TweenLite.to(this, .6, {exp:this._maxExp, onUpdate:this.tweenFrames, overwrite:true});

				this._canUse = true;
			}
			else
			{
				TweenLite.to(this, .6, {exp:this._exp + value, onUpdate:this.tweenFrames, overwrite:true});
			}
		}

		public function useUpgrade():void
		{
			if (this._canUse)
			{
				TweenLite.to(this, .6, {exp:0, onUpdate:this.tweenFrames, overwrite:true});
				this._canUse = false;
			}
		}

		private function tweenFrames():void
		{
			var newFrame:int = Math.round(this.totalFrames / (this._maxExp / this._exp));
			this.gotoAndStop(newFrame);
		}

		public function set exp(amount:Number):void
		{
			if (amount > this._maxExp)
			{
				this._exp = this._maxExp;
			}
			else
			{
				this._exp = amount;
			}
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
