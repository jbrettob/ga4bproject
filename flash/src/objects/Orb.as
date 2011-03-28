package objects 
{
	import objectsHolder.ObjectHolderFront;

	import com.jbrettob.display.Actor;
	/**
	 * @author Rene Zwaan
	 */
	public class Orb extends Actor
	{
		private var _orb:PowerUp_Orb;
		
		public function Orb():void 
		{
			this.x = Math.random()*GameSetings.GAMEWITH;
			this.orb = new PowerUp_Orb();
			addChild(orb);
			
		}
		// make the orb move down until it gets tuched ??
		 override public function update() : void 
		{
			if ((parent as ObjectHolderFront).gameState != GameSetings.PAUSED)
			{
				if(this.y <= (GameSetings.PLAYERYPOS - 45))
				{
					this.y += GameSetings.ORBMOVESPEED;
				}
			}
		}
		
		override public function destroy():void 
		{
			if (this.parent) (parent as ObjectHolderFront).removeOrb(this);
			if (this.contains(this._orb)) this.removeChild(this._orb);
			if (this.parent) (parent as ObjectHolderFront).removeChild(this);
			
			super.destroy();			
		}

		public function get orb() : PowerUp_Orb {
			return _orb;
		}

		public function set orb(value : PowerUp_Orb) : void {
			this._orb = value;
		}
	}
}
