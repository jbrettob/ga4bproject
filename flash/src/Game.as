package
{
	import enemies.DeathLine;

	import objects.BGCastle;
	import objects.BackGround;
	import objects.Hud;

	import objectsHolder.ObjectHolderBack;
	import objectsHolder.ObjectHolderFront;

	import player.IdleCaracters;
	import player.Player;

	import popup.GameEndScreen;
	import popup.GameLevelComplete;
	import popup.GameTutorialScreen;
	import popup.PopUp;

	import com.greensock.TweenLite;
	import com.jbrettob.log.Log;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Mouse;

	/**
	 * @author futago
	 * @flowerModelElementId _QbQ0MEUaEeCheqrE2fpzuQ
	 */
	public class Game extends MovieClip
	{
		public var gameHandler : GameHandler;
		public var player : Player;
		public var gameSetings : GameSetings;
		public var objectHolderBack : ObjectHolderBack;
		public var objectHolderFront : ObjectHolderFront;
		public var keyBoard : InputHandler;
		public var bgCastle : BGCastle;
		public var hud : Hud;
		public var bg : BackGround;
		public var dl : DeathLine;
		public var popUp : PopUp;
		public var levelComplete : GameLevelComplete;
		public var tutorial : GameTutorialScreen;
		private var _gameState : String = GameSetings.PLAYING;
		private var _backGround : Sprite;
		private var _endScreen : GameEndScreen;
		private var _currentLevel : Number;
		private var _idleCaracters : IdleCaracters;

		public function Game() : void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addetToStage);
		}

		private function addetToStage(event : Event) : void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addetToStage);

			this.newGame();
		}

		private function newGame() : void
		{
			this.bg = new BackGround();
			this.bgCastle = new BGCastle();
			this.gameSetings = new GameSetings();
			this.objectHolderBack = new ObjectHolderBack(this);
			this.objectHolderFront = new ObjectHolderFront(this);
			this.gameHandler = new GameHandler(this);
			this.keyBoard = new InputHandler();
			this.player = new Player(this);
			this.hud = new Hud();
			this.objectHolderBack.player = player;
			this.dl = new DeathLine(keyBoard);
			this.popUp = new PopUp();
			this._idleCaracters = new IdleCaracters();

			this._currentLevel = 0;
			this.gameState = GameSetings.PLAYING;

			this.addChild(bg);
			this.addChild(keyBoard);
			this.addChild(gameHandler);
			this.addChild(objectHolderBack);
			this.addChild(bgCastle);
			this.addChild(objectHolderFront);
			this.addChild(player);
			this.addChild(dl);
			this.addChild(hud);
			this.addChild(popUp);
			this.addChild(_idleCaracters);

			this.showTutorial();

			this.hud.addEventListener('POPUP_SHOW_MENU', this.handlePopupShowMenu);
			this.popUp.addEventListener('GAME_TOMAINMENU', this.handleGameToMainMenu);
		}

		public function endGame(won : Boolean = false) : void
		{
			if (this.gameHandler) gameHandler.destroy();
			if (this.objectHolderBack && this.objectHolderFront)
			{
				this.objectHolderFront.clearAll();
				this.objectHolderBack.clearAll();
				this.objectHolderFront.removeGame();
				this.objectHolderBack.removeGame();
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

		private function showEndScreen(won : Boolean) : void
		{
			Mouse.show();
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

		private function handleGameToMainMenu(event : Event) : void
		{
			this.dispatchEvent(new Event('GAME_TOMAINMENU'));
		}

		private function handlePopupShowMenu(event : Event) : void
		{
			this.popUp.shown();
		}

		public function get gameState() : String
		{
			return this._gameState;
		}

		public function set gameState(value : String) : void
		{
			this._gameState = value;

			if (this._gameState == GameSetings.PAUSED)
			{
				Mouse.show();
				if (this.levelComplete) this.levelComplete.stop();
			}
			else
			{
				Mouse.hide();
				if (this.levelComplete) this.levelComplete.play();
			}

			if (this.objectHolderBack) this.objectHolderBack.gameState = this._gameState;
			if (this.objectHolderFront) this.objectHolderFront.gameState = this._gameState;
			if (this.gameHandler) this.gameHandler.gameState = this._gameState;
			if (this.dl) this.dl.gameState = this._gameState;
		}

		public function get level() : Number
		{
			return _currentLevel;
		}

		public function set level(value : Number) : void
		{
			this.showLevelComplete();

			this._currentLevel = value;

			switch (this._currentLevel)
			{
				case 1:
					Log.log('Tutorial: How To Shoot, shoot 10 enemies', this);
					this.gameHandler.createEnemyTimer();
					break;
				case 2:
					Log.log('Tutorial: Switch Characters, use all characters', this);
					break;
				case 3:
					Log.log('Tutorial: Power-Up, fill power-bar', this);
					this.gameHandler.createOrbTimer();
					break;
				case 4:
					Log.log('Tutorial: Use canon to hit the deadline!', this);
					this.dl.canMove = true;
					break;
				case 5:
					Log.log('Try and defeat the deadline and take over the world! Muhahaha', this);
					this.gameHandler.createEnemyTimer();
					this.gameHandler.createOrbTimer();
					this.dl.canMove = true;
					this.hud.upgradeTimer.exp = 0;
					break;
				case 8:
					this.endGame(true);
					break;
			}
		}

		private function showLevelComplete() : void
		{
			if (this.levelComplete)
			{
				this.levelComplete.destroy();
				this.levelComplete = null;
			}

			if (this._currentLevel < 5)
			{
				this.levelComplete = new GameLevelComplete('Tutorial Completed');
			}
			else
			{
				this.levelComplete = new GameLevelComplete();
			}
			this.levelComplete.x = GameSetings.GAMEWITH / 2;
			this.levelComplete.y = GameSetings.GAMEHEIGHT / 2;
			this.levelComplete.addEventListener('POPUP_COMPLETE', this.handleLevelComplete);
			this.addChildAt(this.levelComplete, (this.getChildIndex(this.popUp) - 1));

			TweenLite.to(this.tutorial, .4, {x:900, alpha:0, overwrite:true});
		}

		private function handleLevelComplete(event : Event) : void
		{
			if (this.levelComplete)
			{
				this.levelComplete.destroy();
				this.removeChild(this.levelComplete);
				this.levelComplete.removeEventListener('POPUP_COMPLETE', this.handleLevelComplete);
				this.levelComplete = null;
			}

			if (this._currentLevel < 5) this.showTutorial();
		}

		private function showTutorial() : void
		{
			this.removeTutorial();

			this.tutorial = new GameTutorialScreen((this._currentLevel + 1));
			this.tutorial.x = 900;
			this.tutorial.y = GameSetings.TUTORIALPOSY;
			this.tutorial.alpha = 0;
			this.addChildAt(this.tutorial, (this.getChildIndex(this.objectHolderFront) - 1));

			TweenLite.to(this.tutorial, .4, {x:GameSetings.TUTORIALPOSX, alpha:1, overwrite:true});
		}

		private function removeTutorial() : void
		{
			if (this.tutorial)
			{
				this.tutorial.destroy();
				this.removeChild(this.tutorial);
				this.tutorial = null;
			}
		}

		public function pauseGamePlay() : void
		{
			this.gameHandler.pauseAllTimers();
		}

		public function removeGame() : void
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

		public function get _keyBoard() : InputHandler
		{
			return keyBoard;
		}

		public function set _keyBoard(keyBoard : InputHandler) : void
		{
			this.keyBoard = keyBoard;
		}

		public function get _hud() : Hud
		{
			return hud;
		}

		public function set _hud(hud : Hud) : void
		{
			this.hud = hud;
		}

		public function get _bg() : BackGround
		{
			return bg;
		}

		public function set _bg(bg : BackGround) : void
		{
			this.bg = bg;
		}

		public function get idleCaracters() : IdleCaracters
		{
			return _idleCaracters;
		}

		public function set idleCaracters(idleCaracters : IdleCaracters) : void
		{
			_idleCaracters = idleCaracters;
		}
	}
}
