package enemies 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	/**
	 * @author Rene Zwaan
	 */
	public class Enemy extends MovieClip
	{
		private var pos:Point;
		private var health:Number;
		private var alife:Boolean;
		private var updateTimer:Timer;
		public var 	name:String;
		
		public function Enemy():void
		{
			updateTimer = new Timer(1,0);
			updateTimer.addEventListener(TimerEvent.TIMER_COMPLETE,update);
			updateTimer.start();
		}

		private function update(event : TimerEvent) : void 
		{
		}
		
		public function remove():void
		{
			updateTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, update);
			//needs to be tested 
			(parent as GameHandler).removeChild(this);
		}

	}
}
