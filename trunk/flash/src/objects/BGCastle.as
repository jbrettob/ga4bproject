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
			
			this.addChild(_castle);
		}
		
		public function destroy():void
		{
			this.removeChild(this._castle);
			this._castle = null;
		}
	}
}
