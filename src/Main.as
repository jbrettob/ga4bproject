package
{
	import flash.display.MovieClip;
	/**
	 * @author futago
	 * @flowerModelElementId _QbQ0MEUaEeCheqrE2fpzuQ
	 */
	public class Main extends MovieClip
	{
		public var gameStatus:GameHandler;
		public var player:Player;
		
		public function Main():void
		{
			newGame();
		}

		private function newGame() : void 
		{
			player =  new Player();
			
			addChild(player);
		}
		
		public function removeGame():void
		{
			
		}
	}
}
