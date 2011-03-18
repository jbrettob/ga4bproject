package objects 
{
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 */
	public class BGCastle extends MovieClip
	{
		private var castle:Castle;
		
		public function BGCastle() : void 
		{
			castle = new Castle();
			castle.y = GameSetings.CASTLEHEIGHT;
			
			addChild(castle);
		}
	}
}
