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
		public var enemyHolder : ObjectHolder;
		public var keyBoard : Keyboard;
		
		
		public function Main():void
		{
			newGame();
		}

		private function newGame() : void 
		{
			gameSetings = new GameSetings();
			enemyHolder = new ObjectHolder();
			gameHandler = new GameHandler();
			keyBoard = new Keyboard();
			player = new Player(this);
			
			addChild(player);
			
			trace("lol");
			
		}
		
		public function removeGame():void
		{
			
		}
	}
}
