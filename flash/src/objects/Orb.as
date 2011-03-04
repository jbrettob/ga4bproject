package objects 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author naamloze_held
	 */
	public class Orb extends MovieClip
	{
		private var updateTimer:Timer;
		public function Orb():void
		{
			updateTimer = new Timer(1,0);
			updateTimer.addEventListener(TimerEvent.TIMER_COMPLETE,update);
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
