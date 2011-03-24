package objects 
{
	import com.jbrettob.display.Actor;
	/**
	 * @author Rene Zwaan
	 */
	public class Orb extends Actor
	{
		private var orb:lamp;
		
		public function Orb():void 
		{
			this.x = Math.random()*GameSetings.GAMEWITH;
			orb = new lamp();
			addChild(orb);
			
		}
		// make the orb move down until it gets tuched ??
		 override public function update() : void 
		{
			if ((parent as ObjectHolder).gameState != GameSetings.PAUSED)
			{
				if(this.y <= (GameSetings.PLAYERYPOS - 45))
				{
					this.y += GameSetings.ORBMOVESPEED;
				}
			}
		}
		
		 override public function destroy():void 
		{
			if (this.parent) (parent as ObjectHolder).removeOrb(this);
			removeChild(orb);
			if (this.parent) (parent as ObjectHolder).removeChild(this);
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
