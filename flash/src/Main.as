package
{
	import Intro.IntroKing;

	import Menu.MainMenu;

	import com.greensock.TweenLite;
	import com.jbrettob.display.AbstractIntro;
	import com.jbrettob.enum.Sounds;
	import com.jbrettob.log.Log;
	import com.jbrettob.media.sound.SoundChannelKing;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Jayce Rettob
	 */
	public class Main extends MovieClip
	{
		private var _intro:AbstractIntro;
		private var _menu:MainMenu;
		private var _game:Game;

		public function Main()
		{
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(0x000000);
			bg.graphics.drawRect(0, 0, GameSetings.GAMEWITH, GameSetings.GAMEHEIGHT);
			bg.graphics.endFill();
			this.addChild(bg);
			
			this.init();
		}

		private function init():void
		{
			this.stage.stageFocusRect = false;

			this.showIntroTeam();
		}

		private function showIntroTeam():void
		{
			this._intro = new IntroKing();
			this._intro.addEventListener('IntroMovie_END', this.handleIntroMovieComplete);
			this.addChild(this._intro);
		}

		private function handleIntroMovieComplete(event:Event):void
		{
			Log.log('handleIntroMovieComplete', this);
			
			if (this._intro)
			{
				Log.log('handleIntroMovieComplete exist', this);
				
				this._intro.removeEventListener('IntroMovie_END', this.handleIntroMovieComplete);
				TweenLite.to(this._intro, .6, {alpha:.1, onComplete:this.handleTweenIntroHideComplete, overwrite: true});
			}
			else
			{
				Log.log('handleIntroMovieComplete not exist', this);
				this.showMainMenu();
			}
		}

		private function handleTweenIntroHideComplete():void
		{
			if (this._intro)
			{
				this._intro.destroy();
				if (this.contains(this._intro)) this.removeChild(this._intro);
				this._intro = null;
			}
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
