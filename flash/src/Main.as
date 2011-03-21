package
{
	import com.jbrettob.log.Log;

	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * @author Jayce Rettob
	 */
	public class Main extends MovieClip
	{
		private var _game:Game;
		
		public function Main()
		{
			this.log('MainMenu: ' + Math.random());
			
			this.init();
		}

		private function init():void
		{
			this.log('init: ' + Math.random());
			
			this.showGame();
		}

		private function showGame():void
		{
			this.log('showGame: ' + Math.random());
			
			this._game = new Game();
			this.addChild(this._game);
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
