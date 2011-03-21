package
{
	import Menu.MainMenu;

	import com.jbrettob.enum.Sounds;
	import com.jbrettob.log.Log;
	import com.jbrettob.media.sound.SoundChannelKing;

	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * @author Jayce Rettob
	 */
	public class Main extends MovieClip
	{
		private var _menu:MainMenu;
		private var _game:Game;
		
		public function Main()
		{
			this.init();
		}

		private function init():void
		{
			this.stage.stageFocusRect = false;
			
			this.showMainMenu();
		}

		private function showMainMenu():void
		{
			this.removeMenu();
			
			SoundChannelKing.getInstance().init();
			SoundChannelKing.getInstance().playMusic(Sounds.BACKGROUND_MUSIC_01);
			
			this._menu = new MainMenu();
			this._menu.addEventListener('MAINMENU_STARTGAME', this.handleMainMenuStartGame);
			this.addChild(this._menu);
		}

		private function handleMainMenuStartGame(event:Event):void
		{
			this.removeMenu();
			
			this.showGame();
		}

		private function removeMenu():void
		{
			if (this._menu)
			{
				this.removeChild(this._menu);
				this._menu.destroy();
				this._menu = null;
			}
		}
		
		private function removeGame():void
		{
			if (this._game)
			{
				this.removeChild(this._game);
				this._game.removeGame();
				this._game.removeEventListener('GAME_TOMAINMENU', this.handleGameToMainMenu);
				this._game = null;
			}
		}

		private function showGame():void
		{
			this.removeGame();
			
			this._game = new Game();
			this._game.addEventListener('GAME_TOMAINMENU', this.handleGameToMainMenu);
			this.addChild(this._game);
			
			this.stage.focus = this._game;
		}

		private function handleGameToMainMenu(event:Event):void
		{
			this.removeGame();
			
			this.showMainMenu();
		}
		
		public function log(value:String):void
		{
			Log.log(value, this);
		}
		
		public function debug(value:String):void
		{
			Log.debug(value, this);
		}
	}
}
