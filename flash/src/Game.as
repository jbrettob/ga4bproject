package
{
	import enemies.DeathLine;

	import objects.BGCastle;
	import objects.Hud;

	import player.Player;

	import popup.PopUp;

	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * @author futago
	 * @flowerModelElementId _QbQ0MEUaEeCheqrE2fpzuQ
	 */
	public class Game extends MovieClip
	{
		public var gameHandler				:GameHandler;
		public var player					:Player;
		public var gameSetings				:GameSetings;
		public var objectHolder				:ObjectHolder;
		public var keyBoard					:InputHandler;
		public var bgCastle					:BGCastle;
		public var hud						:Hud;
		public var bg						:BG;
		public var dl						:DeathLine;
		public var popUp 					: PopUp;
		public var gameState 				: String = GameSetings.PLAYING;			

		public function Game():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addetToStage);
		}

		private function addetToStage(event : Event) : void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addetToStage);
			
			newGame();
//			Mouse.hide();
		}
		

		private function newGame():void
		{
			bg 					= new BG();
			bgCastle 			= new BGCastle();
			gameSetings 		= new GameSetings();
			objectHolder 		= new ObjectHolder(this);
			gameHandler 		= new GameHandler(objectHolder);
			keyBoard 			= new InputHandler();
			player 				= new Player(this);
			hud 				= new Hud();
			objectHolder.player = player;
			dl 					= new DeathLine(keyBoard);
			popUp				= new PopUp();
			
			bg.y += 25;
			
			
			//addChild(bg);
			addChild(bgCastle);
			addChild(keyBoard);
			addChild(player);
			addChild(gameHandler);
			addChild(objectHolder);
			addChild(dl);
			addChild(hud);
			addChild(popUp);
			
			hud.addEventListener('POPUP_SHOW_MENU', this.handlePopupShowMenu);
			popUp.addEventListener('GAME_TOMAINMENU', this.handleGameToMainMenu);
		}

		public function endGame() : void
		{
//			player.destroy();
			if (this.bg) if (this.contains(this.bg)) removeChild(bg);
			if (this.bg) bg = null;
			if (this.bgCastle) bgCastle.destroy();
			if (this.contains(bgCastle)) removeChild(bgCastle);
			if (this.gameHandler) gameHandler.destroy();
			if (this.objectHolder) objectHolder.clearAll();
			if (this.popUp) popUp.destroy();
		}


		private function handleGameToMainMenu(event:Event):void
		{
			this.dispatchEvent(new Event('GAME_TOMAINMENU'));
		}

		private function handlePopupShowMenu(event:Event):void
		{
			this.popUp.shown();
		}

		public function removeGame():void
		{
			this.objectHolder.clearAll();
			this.objectHolder.removeGame();
			this.gameHandler.removeAll();
			
			this.hud.removeEventListener('POPUP_SHOW_MENU', this.handlePopupShowMenu);
			if (this.contains(this.hud)) this.removeChild(this.hud);
			this.popUp.removeEventListener('GAME_TOMAINMENU', this.handleGameToMainMenu);
			if (this.contains(this.popUp)) this.removeChild(this.popUp);
		}

		public function get _gameState() : String
		{
			return gameState;
		}

		public function set _gameState(gameState : String) : void
		{
			this.gameState = gameState;
		}
	}
}
