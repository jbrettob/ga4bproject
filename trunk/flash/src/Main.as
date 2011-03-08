package
{
	import objects.BGCastle;

	import flash.display.MovieClip;
	import flash.ui.Mouse;

	/**
	 * @author futago
	 * @flowerModelElementId _QbQ0MEUaEeCheqrE2fpzuQ
	 */
	public class Main extends MovieClip
	{
		public var gameHandler:GameHandler;
		public var player:Player;
		public var gameSetings:GameSetings;
		public var objectHolder:ObjectHolder;
		public var keyBoard:Keyboard;
		public var BgCastle:BGCastle;

		public function Main():void
		{
			newGame();
			Mouse.hide();
		}

		private function newGame():void
		{
			BgCastle = new BGCastle();
			gameSetings = new GameSetings();
			objectHolder = new ObjectHolder();
			gameHandler = new GameHandler(objectHolder);
			keyBoard = new Keyboard();
			player = new Player(this);
			addChild(BgCastle);
			addChild(keyBoard);
			addChild(player);
			addChild(gameHandler);
			addChild(objectHolder);

		}

		public function removeGame():void
		{
		}
	}
}
