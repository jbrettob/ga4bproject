package enemies
{
	import Projectiles.ProjectileActorShapeShifter;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Rene Zwaan 
	 */
	public class ShapeShifter extends Enemy
	{
		private var actorShapeShifter:ActorShapeShifter;
		private var updateTimer:Timer;
		private var _objectHolder:ObjectHolder;

		public function ShapeShifter(objectHolder:ObjectHolder):void
		{
			this._objectHolder = objectHolder;

			updateTimer = new Timer(GameSetings.GAMESPEED);
			updateTimer.addEventListener(TimerEvent.TIMER, update);
			updateTimer.start();
			setUpShapeShifter();
		}

		private function setUpShapeShifter():void
		{
			actorShapeShifter = new ActorShapeShifter();
			addChild(actorShapeShifter);
			setupVars();
		}

		// Deze word 24x per Sec aan geroepen
		private function update(event:TimerEvent):void
		{
			this.y += .5;

			var rand:Number = Math.round(Math.random() * 50);
			if (rand >= 50)
			{
				this.shootProjectile();
			}
		}

		private function shootProjectile():void
		{
			trace('boom');
			
			var projectile:ProjectileActorShapeShifter = new ProjectileActorShapeShifter(this.x, this.y);
			this._objectHolder.addChild(projectile);
		}

		private function setupVars():void
		{
			_name = GameSetings.SHAPESHIFTERNAME;
			_moveSpeed = GameSetings.SHAPESHIFTERMOVESPEED;
			_health = GameSetings.SHAPESHIFTERHP;
		}

		public function remove():void
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
