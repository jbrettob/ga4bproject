package objects 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Rene Zwaan + 
	 */
	public class Orb extends MovieClip
	{
		private var updateTimer:Timer;
		public function Orb():void {
			updateTimer = new Timer(GameSetings.GAMESPEED);
			updateTimer.addEventListener(TimerEvent.TIMER,update);
			updateTimer.start();
		}
		// make the orb move down until it gets tuched ??
		private function update(event : TimerEvent) : void 
		{
			
		}
		
		public function remove():void 
		{
			updateTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, update);
		}
	}
}
