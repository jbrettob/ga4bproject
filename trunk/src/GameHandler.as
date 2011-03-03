package  {
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	
	/**
	 * @flowerModelElementId _lO1uYEWqEeCgZu3bfDvecA
	 */
	public class GameHandler {
		private var __updateTimer:Timer;
		public var attribute1:Main;
		
		public function GameHandler():void
		{
			__updateTimer = new Timer(1,0);
			__updateTimer.addEventListener(TimerEvent.TIMER_COMPLETE,update);
			__updateTimer.start()
		}
		
		public function update() 
		{
		}
	}
}