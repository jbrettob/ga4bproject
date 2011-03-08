package enemies
{
	import projectiles.ProjectileActorShapeShifter;

	import com.jbrettob.display.Actor;

	/**
	 * @author Jayce Rettob
	 */
	public class ShapeShifter extends Actor
	{
		private var _sprite:ActorShapeShifter;

		public function ShapeShifter(objectHolder:ObjectHolder):void
		{
			this.objectHolder = objectHolder;

			super();
		}

		override public function init():void
		{
			this._sprite = new ActorShapeShifter();
			this.addChild(this._sprite);

			this.moveSpeed = GameSetings.SHAPESHIFTERMOVESPEED;
			this.health = GameSetings.SHAPESHIFTERHP;
			
			super.init();
		}

		override public function update():void
		{
			this.y += this.moveSpeed;

			var rand:Number = Math.round(Math.random() * 50);
			if (rand >= 50)
			{
				this.shootProjectile();
				this.health --;
			}

			super.update();
		}

		private function shootProjectile():void
		{
			var projectile:ProjectileActorShapeShifter = new ProjectileActorShapeShifter(this.objectHolder, this.x, this.y);
			this.objectHolder.addChild(projectile);
			this.objectHolder.addEnemyProjectiles(projectile);
		}
		

		override public function destroy():void
		{
			if (this._sprite)
			{
				this.removeChild(this._sprite);
				this._sprite = null;
			}
			
			super.destroy();
		}
	}
}