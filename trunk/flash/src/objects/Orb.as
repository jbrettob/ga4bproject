package objects 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Rene Zwaan
	 */
	public class Orb extends MovieClip
	{
		private var orb:lamp;
		private var updateTimer:Timer;
		
		public function Orb():void 
		{
			this.x = Math.random()*GameSetings.GAMEWITH;
			orb = new lamp();
			addChild(orb);
			updateTimer = new Timer(GameSetings.GAMESPEED);
			updateTimer.addEventListener(TimerEvent.TIMER,update);
			updateTimer.start();
		}
		// make the orb move down until it gets tuched ??
		private function update(event : TimerEvent) : void 
		{
			if(this.y <= (GameSetings.PLAYERYPOS - 45))
			{
			this.y ++;
			}
		}
		
		public function remove():void 
		{
			updateTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, update);
			(parent as ObjectHolder).removeOrb(this);
			removeChild(orb);
			(parent as ObjectHolder).removeChild(this);
			
		}

		public function get _orb() : lamp {
			return orb;
		}

		public function set _orb(orb : lamp) : void {
			this.orb = orb;
		}
	}
}
