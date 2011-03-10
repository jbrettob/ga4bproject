package objects
{
	import com.jbrettob.log.Log;

	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * @author Jayce Rettob
	 */
	public class Hud extends MovieClip
	{
		private static var _HUD_WIDTH:Number = 0;
		private static var _instance:Hud;
		
		private var _sprite:Interface_Hud;
		private var _upgradeTimer:UpgradeTimer;
		private var _lives:Number = 0;
		private var _score:Number = 0;

		public function Hud():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		static public function getInstance():Hud
		{
			return _instance;
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);

			_instance = this;

			this.init();
		}

		private function init():void
		{
			this.setupHud();
		}

		private function setupHud():void
		{
			this._sprite = new Interface_Hud();
			this._sprite.x = (GameSetings.GAMEWITH - this._sprite.width);
			this.addChild(this._sprite);

			_HUD_WIDTH = this._sprite.width;

			this._upgradeTimer = new UpgradeTimer();
			this._upgradeTimer.x = 10;
			this._upgradeTimer.y = ( (GameSetings.GAMEHEIGHT - this._upgradeTimer.height) - 20);

			this.addChild(this._upgradeTimer);

			this.updateLives();
			this.updateScore();
		}

		private function updateLives():void
		{
			if (this._sprite) this._sprite.txtLives.text = String(this._lives);
		}

		private function updateScore():void
		{
			if (this._sprite) this._sprite.txtScore.text = String(this._score);
		}

		static public function get HUD_WIDTH():Number
		{
			return _HUD_WIDTH;
		}

		public function get lives():Number
		{
			return this._lives;
		}

		public function set lives(value:Number):void
		{
			this._lives = value;

			this.updateLives();
		}

		public function get score():Number
		{
			return this._lives;
		}

		public function set score(value:Number):void
		{
			this._score += value;

			this.updateScore();
		}

		public function destroy():void
		{
			if (this._sprite)
			{
				this.removeChild(this._sprite);
				this._sprite = null;
			}
		}

		public function get upgradeTimer():UpgradeTimer
		{
			return this._upgradeTimer;
		}

		// logging for traces
		public function log(output:String):void
		{
			Log.log(output, this);
		}

		public function debug(output:String):void
		{
			Log.debug(output, this);
		}
	}
}
