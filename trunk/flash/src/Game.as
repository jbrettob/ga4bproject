package
{
	import enemies.DeathLine;

	import objects.BGCastle;
	import objects.Hud;

	import player.Player;

	import popup.GameEndScreen;
	import popup.PopUp;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author futago
	 * @flowerModelElementId _QbQ0MEUaEeCheqrE2fpzuQ
	 */
	public class Game extends MovieClip
	{
		public var gameHandler:GameHandler;
		public var player:Player;
		public var gameSetings:GameSetings;
		public var objectHolder:ObjectHolder;
		public var keyBoard:InputHandler;
		public var bgCastle:BGCastle;
		public var hud:Hud;
		public var bg:BG;
		public var dl:DeathLine;
		public var popUp:PopUp;
		public var gameState:String = GameSetings.PLAYING;
		
		private var _backGround:Sprite;
		private var _endScreen:GameEndScreen;

		public function Game():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addetToStage);
		}

		private function addetToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addetToStage);

			this.newGame();
			// Mouse.hide();
		}

		private function newGame():void
		{
			this.bg = new BG();
			this.bgCastle = new BGCastle();
			this.gameSetings = new GameSetings();
			this.objectHolder = new ObjectHolder(this);
			this.gameHandler = new GameHandler(objectHolder);
			this.keyBoard = new InputHandler();
			this.player = new Player(this);
			this.hud = new Hud();
			this.objectHolder.player = player;
			this.dl = new DeathLine(keyBoard);
			this.popUp = new PopUp();

			this.addChild(bg);
			this.addChild(keyBoard);
			this.addChild(gameHandler);
			this.addChild(objectHolder);
			this.addChild(bgCastle);
			this.addChild(player);
			this.addChild(dl);
			this.addChild(hud);
			this.addChild(popUp);

			this.hud.addEventListener('POPUP_SHOW_MENU', this.handlePopupShowMenu);
			this.popUp.addEventListener('GAME_TOMAINMENU', this.handleGameToMainMenu);
		}

		public function endGame(won:Boolean = false):void
		{
			if (this.gameHandler) gameHandler.destroy();
			if (this.objectHolder)
			{
				this.objectHolder.clearAll();
				this.objectHolder.clearAll();
				this.objectHolder.removeGame();
			}
			if (this.popUp)
			{
				this.popUp.removeEventListener('GAME_TOMAINMENU', this.handleGameToMainMenu);
				if (this.contains(this.popUp)) this.removeChild(this.popUp);
				this.popUp.destroy();
			}
			if (this.dl)
			{
				this.dl.destroy();
			}
			if (this.player)
			{
				(this.player as Player).destroy();
			}
			
			this.showEndScreen(won);
		}

		private function showEndScreen(won:Boolean):void
		{
			if (this._backGround)
			{
				if (this.contains(this._backGround)) this.removeChild(this._backGround);
				this._backGround = null;
			}
			
			this._backGround = new Sprite();
			this._backGround.graphics.beginFill(0x000000, .5);
			this._backGround.graphics.drawRect(0, 0, GameSetings.GAMEWITH, GameSetings.GAMEHEIGHT);
			this._backGround.graphics.endFill();
			this.addChild(this._backGround);
			
			if (this._endScreen)
			{
				if (this.contains(this._endScreen)) this.removeChild(this._endScreen);
				this._endScreen.destroy();
				this._endScreen = null;
			}
			
			this._endScreen = new GameEndScreen(won);
			this._endScreen.x = GameSetings.GAMEWITH / 2;
			this._endScreen.y = GameSetings.GAMEHEIGHT / 2;
			this.addChild(this._endScreen);
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
			this.hud.removeEventListener('POPUP_SHOW_MENU', this.handlePopupShowMenu);
			if (this.contains(this.hud)) this.removeChild(this.hud);

			if (this.bg)
			{
				if (this.contains(this.bg)) this.removeChild(this.bg);
				this.bg = null;
			}
			if (this.bgCastle)
			{
				if (this.contains(this.bgCastle)) this.removeChild(this.bgCastle);
				this.bgCastle.destroy();
			}
			if (this.dl)
			{
				if (this.contains(this.dl)) this.removeChild(this.dl);
				this.dl = null;
			}
		}

		public function get _gameState():String
		{
			return gameState;
		}

		public function set _gameState(gameState:String):void
		{
			this.gameState = gameState;
		}
	}
}
