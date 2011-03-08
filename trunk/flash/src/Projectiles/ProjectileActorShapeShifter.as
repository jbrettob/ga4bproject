package Projectiles
{
	import flash.events.TimerEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;

	/**
	 * @author jaycerettob
	 */
	public class ProjectileActorShapeShifter extends MovieClip
	{
		private var _updateTimer:Timer;
		private var _sprite:ProjectileShapeShifter;
		
		public function ProjectileActorShapeShifter(posX:Number, posY:Number)
		{
			this.x = posX;
			this.y = posY;
			
			this.addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			
			this._sprite = new ProjectileShapeShifter();
			this.addChild(this._sprite);
			
			this._updateTimer = new Timer(GameSetings.GAMESPEED);
			this._updateTimer.addEventListener(TimerEvent.TIMER, update);
			this._updateTimer.start();
		}

		private function update(event:TimerEvent):void
		{
			this.y += 4;
		}
		
		public function destroy():void
		{
			
		}
	}
}
