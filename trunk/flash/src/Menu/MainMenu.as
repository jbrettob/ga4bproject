package Menu
{
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Jayce Rettob
	 */
	public class MainMenu extends HUD_MainMenu
	{
		private var _menu:MenuScreen;
		
		public function MainMenu()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
			
			this.init();
		}

		private function init():void
		{
			this.mcStart.buttonMode = true;
			this.mcStart.mouseChildren = false;
			
			this.addEventListener(MouseEvent.CLICK, this.handleMouseClick);
		}

		private function handleMouseClick(event:MouseEvent):void
		{
			switch(event.target)
			{
				case this.mcStart:
				if (this.mcStart.enabled) this.showMenu();
				break;
			}
		}

		private function showMenu():void
		{
			this.removeMenu();
			
			this.mcStart.enabled = false;
			
			this._menu = new MenuScreen();
			this._menu.addEventListener('MENUSCREEN_STARTGAME', startGame);
			this.addChild(this._menu);
		}
		
		private function startGame(event:Event):void
		{
			this.destroy();
			
			this.dispatchEvent(new Event('MAINMENU_STARTGAME'));
		}
		
		private function removeMenu():void
		{
			if (_menu)
			{
				this.removeChild(this._menu);
				this._menu.removeEventListener('MENUSCREEN_STARTGAME', startGame);
				this._menu = null;
			}
		}
		
		public function destroy():void
		{
			this.mcStart.enabled = false;
			
			this.removeMenu();
		}
	}
}
