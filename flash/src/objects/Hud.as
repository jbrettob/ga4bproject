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
		
		private var _sprite:Interface_Hud;
		private var _lives:Number = 0;

		public function Hud():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
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
			
			this.updateLives();
		}

		private function updateLives():void
		{
			if (this._sprite) this._sprite.txtLives.text = String(this._lives);
		}

		static public function get HUD_WIDTH():Number
		{
			return _HUD_WIDTH;
		}

		public function get lives():Number
		{
			return this._lives;
		}

		public function set lives(output:Number):void
		{
			this._lives = output;

			this.updateLives();
		}

		public function destroy():void
		{
			if (this._sprite)
			{
				this.removeChild(this._sprite);
				this._sprite = null;
			}
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
