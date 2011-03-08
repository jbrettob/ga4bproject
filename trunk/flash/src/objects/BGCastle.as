package objects {
	import flash.display.MovieClip;
	/**
	 * @author naamloze_held
	 */
	public class BGCastle extends MovieClip
	{
		var castle:Castle;
		public function BGCastle() : void 
		{
			castle = new Castle();
			addChild(castle);
		}
	}
}
