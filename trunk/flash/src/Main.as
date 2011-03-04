package
{
	import flash.display.MovieClip;
	/**
	 * @author futago
	 * @flowerModelElementId _QbQ0MEUaEeCheqrE2fpzuQ
	 */
	public class Main extends MovieClip
	{
		public var gameHandler:GameHandler;
		public var player:Player;
		public var gameSetings:GameSetings;
		public var enemyHolder:ObjectHolder;
		
		public function Main():void
		{
			newGame();
		}

		private function newGame() : void 
		{
			gameSetings = new GameSetings();
			enemyHolder = new ObjectHolder();
			player = new Player(this);
			gameHandler = new GameHandler();
			
			addChild(player);
			
			trace("");
			
		}
		
		public function removeGame():void
		{
			
		}
	}
}
