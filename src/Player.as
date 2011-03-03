package 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.geom.Point;
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 */
	public class Player extends MovieClip
	{
		private var pos:Point;
		private var health:Number;
		private var curentCaracter:String;
		private var alife:Boolean;
		private var updateTimer:Timer;
		
		public function Player():void
		{
			updateTimer = new Timer(1,0);
			updateTimer.addEventListener(TimerEvent.TIMER_COMPLETE,update);
			updateTimer.start();
			PlayerSetup();
		}
		
		private function PlayerSetup() : void 
		{
		}

		private function update(event : TimerEvent) : void 
		{
		}

	}
}
