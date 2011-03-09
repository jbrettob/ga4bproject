package objects
{
	import com.jbrettob.log.Log;

	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * @author naamloze_held
	 */
	public class Hud extends MovieClip
	{
		private static var _HUD_WIDTH:Number = 0;
		
		private var _sprite:Interface_Hud;
		private var _lives:Number;
		
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
			
			this.lives = 1;
		}
		
		private function updateLives():void
		{
			this.debug('updateLives()');
			
			this._sprite.txtLives.text = String(this._lives);
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
