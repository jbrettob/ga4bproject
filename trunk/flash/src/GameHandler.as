package
{
	import enemies.ShapeShifter;

	import com.jbrettob.display.Actor;

	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Rene Zwaan
	 */
	public class GameHandler extends MovieClip
	 {
		private var __updateTimer:Timer;
		public var attribute1:Main;
		private var objectHolder:ObjectHolder;
		
		private var _canAddEnemy:Boolean = false;
		private var _canAddEnemyTimer:Timer;
		
		public function GameHandler(_objectholder:ObjectHolder):void
		{
			objectHolder = _objectholder;
			__updateTimer = new Timer(GameSetings.GAMESPEED);
			__updateTimer.addEventListener(TimerEvent.TIMER,update);
			__updateTimer.start();
			
			this._canAddEnemyTimer = new Timer(1000,1);
			this._canAddEnemyTimer.addEventListener(TimerEvent.TIMER, this.handleAddEnemyTimer);
			this._canAddEnemyTimer.start();
		}

		private function handleAddEnemyTimer(event:TimerEvent):void
		{
			this._canAddEnemy = true;
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
			
			if (this.objectHolder.enemys.length < 3 && this._canAddEnemy)
			{
				createShapeShifter();
				this._canAddEnemy = false;
				this._canAddEnemyTimer.start();
			}
			
		}
		
		public function createShapeShifter():void
		{
			var shapeShifter:ShapeShifter = new ShapeShifter(objectHolder);
			objectHolder.addEnemy(shapeShifter);
			shapeShifter.x = Math.random() * GameSetings.PLAYERMAXRIGHT;
			this.addChild(shapeShifter);
		}
		
		public function pauseGame():void
		{
			this.__updateTimer.stop();
		}
		
		public function unpauseGame():void
		{
			this.__updateTimer.start();
		}
		
		public function removeAll():void
		{
			this.__updateTimer.stop();
		}

		public function removeThisChild(child:*) : void 
		{
			removeChild(child);
		}
	}
}