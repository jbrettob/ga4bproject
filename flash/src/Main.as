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
		public var enemyHolder:objectHolder;
		
		public function Main():void
		{
			newGame();
		}

		private function newGame() : void 
		{
			
			gameSetings = new GameSetings();
			enemyHolder = new objectHolder();
			player = new Player();
			gameHandler = new GameHandler();
			
			addChild(gameSetings);
			addChild(gameHandler);			addChild(player);
			
		}
		
		public function removeGame():void
		{
			
		}
	}
}
