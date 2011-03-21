package popup
{
	import com.jbrettob.log.Log;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Jayce Rettob
	 */
	public class PopUp extends MovieClip
	{
		private static var _instance:PopUp;
		private var _sprite:PopUp_Menu;
		private var _shown:Boolean = false;

		public function PopUp()
		{
			if (_instance)
			{
				new Error('Singleton, call via PopUp.getInstance()');
				return;
			}

			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		public static function getInstance():PopUp
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
			this._sprite = new PopUp_Menu();
			this.setupMenu();
			this.addChild(this._sprite);
			this.visible = this.enabled = false;

			this.x = GameSetings.GAMEWITH / 2;
			this.y = GameSetings.GAMEHEIGHT / 2;
		}

		private function setupMenu():void
		{
			this._sprite.addEventListener(MouseEvent.CLICK, this.handleClick);

			this._sprite.mcReturnToGame.mouseChildren = false;
			this._sprite.mcMainMenu.mouseChildren = false;
			this._sprite.mcOptions.mouseChildren = false;

			TextField(this._sprite.mcMainMenu['txtLabel']).text = 'Return to Main Menu';
			TextField(this._sprite.mcOptions['txtLabel']).text = 'Options';
			TextField(this._sprite.mcReturnToGame['txtLabel']).text = 'Return to game';

			this._sprite.mcOptions.buttonMode = true;
			this._sprite.mcReturnToGame.buttonMode = true;
			this._sprite.mcMainMenu.buttonMode = true;
			this._sprite.mcClose.buttonMode = true;

			this._sprite.mcReturnToGame.buttonMode = this._sprite.mcMainMenu.buttonMode = this._sprite.mcOptions.buttonMode = true;
		}

		private function handleClick(event:MouseEvent):void
		{
			switch (event.target)
			{
				case this._sprite.mcReturnToGame:
				case this._sprite.mcClose:
					this.shown();
					break;
				case this._sprite.mcMainMenu:
					this.showMainMenu();
					break;
				default:
					trace('clicked: ' + event.target);
			}
		}

		private function showMainMenu():void
		{
			Log.log('showMainMenu', this);
			this.dispatchEvent(new Event('GAME_TOMAINMENU'));
		}

		public function shown():void
		{
			this._shown = this.visible = this.enabled = (this._shown) ? false : true;
		}
	}
}
