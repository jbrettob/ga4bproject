package objects 
{
	import com.jbrettob.display.Actor;

	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Rene Zwaan
	 */
	public class Orb extends Actor
	{
		private var orb:lamp;
		private var updateTimer:Timer;
		
		public function Orb():void 
		{
			this.x = Math.random()*GameSetings.GAMEWITH;
			orb = new lamp();
			addChild(orb);
			
		}
		// make the orb move down until it gets tuched ??
		 override public function update() : void 
		{
			if(this.y <= (GameSetings.PLAYERYPOS - 45))
			{
				this.y += 5;
			}
		}
		
		 override public function destroy():void 
		{
			(parent as ObjectHolder).removeOrb(this);
			removeChild(orb);
			(parent as ObjectHolder).removeChild(this);
			super.destroy();			
		}

		public function get _orb() : lamp {
			return orb;
		}

		public function set _orb(orb : lamp) : void {
			this.orb = orb;
		}
	}
}
