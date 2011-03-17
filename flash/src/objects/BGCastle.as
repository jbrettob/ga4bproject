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
//			this.y = GameSetings.GAMEHEIGHT;
			castle = new Castle();
			addChild(castle);
		}
	}
}
