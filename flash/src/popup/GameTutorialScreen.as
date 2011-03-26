package popup
{
	import flash.events.Event;
	/**
	 * @author Jayce Rettob
	 */
	public class GameTutorialScreen extends PopUp_Tutorials
	{
		public function GameTutorialScreen(screen:int)
		{
			this.gotoAndStop(screen);
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
			
			this.init();
		}

		private function init():void
		{
			
		}
		
		public function destroy():void
		{
			
		}
	}
}
