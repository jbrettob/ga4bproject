package enemies 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Rene Zwaan + 
	 */
	public class ShapeShifter extends Enemy
	{
		private var actorShapeShifter:ActorShapeShifter;// als je een betere naam hier voor weet graag
		private var updateTimer:Timer;
		
		public function ShapeShifter(_objectHolder:ObjectHolder):void
		{	
			updateTimer = new Timer(GameSetings.GAMESPEED);
			updateTimer.addEventListener(TimerEvent.TIMER, update);
			updateTimer.start();
			setUpShapeShifter();
		}
		

		private function setUpShapeShifter() : void 
		{
			actorShapeShifter = new ActorShapeShifter();
			addChild(actorShapeShifter);
			this.y += 10;// was ff om te testen kan hem anders niet zien
			setupVars();
		}
		//Deze woord 24x per Sec aan geroepen
		private function update(event : TimerEvent) : void 
		{
		}
		
		private function setupVars() : void 
		{
			_name 					= GameSetings.SHAPESHIFTERNAME;
			_moveSpeed 				= GameSetings.SHAPESHIFTERMOVESPEED;
			_health 				= GameSetings.SHAPESHIFTERHP;
		}
		
		private function remove():void
		{
			// removing events
			updateTimer.removeEventListener(TimerEvent.TIMER, update);
			// other
			removeChild(actorShapeShifter);
			actorShapeShifter = null;
			// set false so perrent will remove this 
			_alife = false;
		}
		
	}
}
