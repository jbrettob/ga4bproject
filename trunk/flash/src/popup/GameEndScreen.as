package popup
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Jayce Rettob
	 */
	public class GameEndScreen extends PopUp_GameEndScreen
	{
		public function GameEndScreen(value:Boolean)
		{
			if (value)
			{
				// win condition
				this.gotoAndStop(1);
			} else
			{
				// lose condition
				this.gotoAndStop(2);
			}
			
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);

			this.init();
		}

		private function init():void
		{
			TextField(this.mcContinue['txtLabel']).text = 'Main Menu';
			TextField(this.mcPlayAgain['txtLabel']).text = 'Play Again?';

			this.mcContinue.mouseChildren = false;
			this.mcPlayAgain.mouseChildren = false;

			this.mcContinue.buttonMode = true;
			this.mcPlayAgain.buttonMode = true;

			this.addEventListener(MouseEvent.CLICK, this.handleMouseClick);
		}

		private function handleMouseClick(event:MouseEvent):void
		{
			switch(event.target)
			{
				case this.mcContinue:
					this.backToMainMenu();
					break;
				case this.mcPlayAgain:
					this.playAgain();
					break;
			}
		}

		private function backToMainMenu():void
		{
			if (this.parent)
			{
				this.parent.dispatchEvent(new Event('GameEvent.BACK_TO_MAINMENU'));
			}
		}

		private function playAgain():void
		{
			if (this.parent)
			{
				this.parent.dispatchEvent(new Event('GameEvent.PLAY_AGAIN'));
			}
		}

		public function destroy():void
		{
			this.removeEventListener(MouseEvent.CLICK, this.handleMouseClick);
		}
	}
}
