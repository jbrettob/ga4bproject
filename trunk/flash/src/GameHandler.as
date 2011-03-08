package
{
	import enemies.ShapeShifter;

	import com.jbrettob.display.Actor;

	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;


	
	/**
	 * @flowerModelElementId _lO1uYEWqEeCgZu3bfDvecA
	 */
	public class GameHandler extends MovieClip
	 {
		private var __updateTimer:Timer;
		public var attribute1:Main;
		private var objectHolder:ObjectHolder;
		
		public function GameHandler(_objectholder:ObjectHolder):void
		{
			objectHolder = _objectholder;
			__updateTimer = new Timer(GameSetings.GAMESPEED,0);
			__updateTimer.addEventListener(TimerEvent.TIMER,update);
			__updateTimer.start();
			createShapeShifter();
			createShapeShifter();
			createShapeShifter();
		}
		
		public function update(event:TimerEvent):void
		{
			var i:Number = numChildren;
			while(i > 0)
			{
				if((getChildAt(i -1) as Actor).alife == false)
				{
					objectHolder.removeEnemy(i);
					removeChildAt(i - 1);
				}
				i --;
			}
		}
		
		public function createShapeShifter():void
		{
			var shapeShifter:ShapeShifter = new ShapeShifter(objectHolder);
			objectHolder.addEnemy(shapeShifter);
			shapeShifter.x = Math.random() * GameSetings.GAMEWITH;
			this.addChild(shapeShifter);
		}

		public function removeThisChild(child:*) : void 
		{
			removeChild(child);
		}
	}
}