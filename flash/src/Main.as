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
		public var objectHolder : ObjectHolder;
		public var keyBoard : Keyboard;
		
		
		public function Main():void
		{
			newGame();
		}

		private function newGame() : void 
		{
			gameSetings = new GameSetings();
			objectHolder = new ObjectHolder();
			gameHandler = new GameHandler(objectHolder);
			keyBoard = new Keyboard();
			player = new Player(this);

			addChild(keyBoard);
			addChild(player);
			addChild(gameHandler);
			addChild(objectHolder);
			
			trace("lol");
			
		}
		
		public function removeGame():void
		{
			
		}
	}
}
