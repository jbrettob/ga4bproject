package  {
	import enemies.ShapeShifter;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	
	/**
	 * @flowerModelElementId _lO1uYEWqEeCgZu3bfDvecA
	 */
	public class GameHandler extends Sprite
	 {
		private var __updateTimer:Timer;
		public var attribute1:Main;
		private var objectHolder:ObjectHolder;
		
		public function GameHandler(_objectholder:ObjectHolder):void
		{
			objectHolder = _objectholder;
			__updateTimer = new Timer(1,0);
			__updateTimer.addEventListener(TimerEvent.TIMER,update);
			__updateTimer.start();
		}
		
		public function update():void
		{
			
		}
		
		public function createShapeShifter():void
		{
			var shapeShifter:ShapeShifter = new ShapeShifter();
			objectHolder.addEnemy(shapeShifter);
			addChild(shapeShifter);
		}
	}
}