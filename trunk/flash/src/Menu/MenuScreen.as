package Menu
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Jayce Rettob
	 */
	public class MenuScreen extends HUD_Menu
	{
		public var mcStartGame:MovieClip;
		public var mcOpties:MovieClip;
		public var mcHighScore:MovieClip;
		public var mcCredits:MovieClip;
		
		public function MenuScreen()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
			
			this.x += 25;

			this.init();
		}

		private function init():void
		{
			this.mcStartGame = this.mcContainer['mcStartGame'];
			this.mcOpties = this.mcContainer['mcOpties'];
			this.mcHighScore = this.mcContainer['mcHighScore'];
			this.mcCredits = this.mcContainer['mcCredits'];
			
			this.mcStartGame.buttonMode = true;
			this.mcOpties.buttonMode = true;
			this.mcHighScore.buttonMode = true;
			this.mcCredits.buttonMode = true;
			
			this.mcStartGame.mouseChildren = false;
			this.mcOpties.mouseChildren = false;
			this.mcHighScore.mouseChildren = false;
			this.mcCredits.mouseChildren = false;
			
			TextField(this.mcStartGame['txtLabel']).text = 'Start Game';
			TextField(this.mcOpties['txtLabel']).text = 'Opties';
			TextField(this.mcHighScore['txtLabel']).text = 'Highscore';
			TextField(this.mcCredits['txtLabel']).text = 'Credits';
			
			this.addEventListener(MouseEvent.CLICK, handleMouseClick);
		}

		private function handleMouseClick(event:MouseEvent):void
		{
			switch(event.target)
			{
				case this.mcStartGame:
					this.startGame();
					break;
			}
		}

		private function startGame():void
		{
			this.dispatchEvent(new Event('MENUSCREEN_STARTGAME'));
		}
	}
}
