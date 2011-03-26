package objects 
{
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 */
	public class BGCastle extends MovieClip
	{
		private var _castle:Castle;
		
		public function BGCastle() : void 
		{
			this._castle = new Castle();
			this._castle.y = GameSetings.CASTLEHEIGHT;
			this._castle.mcExplode.gotoAndStop(1);
			
			this.addChild(_castle);
		}

		public function shoot():void
		{
			this._castle.mcExplode.gotoAndPlay(2);
		}
		
		public function destroy():void
		{
			this.removeChild(this._castle);
			this._castle = null;
		}
	}
}
