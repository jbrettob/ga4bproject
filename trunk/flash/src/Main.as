package
{
	import Menu.MainMenu;

	import com.jbrettob.log.Log;

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
			if (this._menu)
			{
				this.removeChild(this._menu);
				this._menu.destroy();
				this._menu = null;
			}
			
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

		private function showGame():void
		{
			this._game = new Game();
			this.addChild(this._game);
			
			this.stage.focus = this._game;
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
