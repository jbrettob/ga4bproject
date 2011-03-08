package projectiles
{
	import com.jbrettob.display.Actor;

	/**
	 * @author Jayce Rettob
	 */
	public class ProjectileActorShapeShifter extends Actor
	{
		private var _sprite:ProjectileShapeShifter;
		private var _damage:Number = 1;
		private var _toX:Number = 0;
		private var _toY:Number = 0;

		public function ProjectileActorShapeShifter(objectHolder:ObjectHolder, posX:Number, posY:Number, toX:Number, toY:Number)
		{
			this.objectHolder = objectHolder;

			this.x = posX;
			this.y = posY;

			this._toX = toX;
			this._toY = toY;

			if (this._damage <= 0) this._damage = 1;

			super();
		}

		override public function init():void
		{
			this._sprite = new ProjectileShapeShifter();
			this.addChild(this._sprite);

			super.init();
		}

		override public function update():void
		{
			this.x += this._toX * .01;
			this.y += this._toY * .01;

			if (this.y >= (GameSetings.GAMEHEIGHT - 50))
			{
				this.destroy();
			}

			super.update();
		}

		public function get damage():Number
		{
			return this._damage;
		}

		override public function destroy():void
		{
			if (this._sprite)
			{
				this.removeChild(this._sprite);
				this._sprite = null;
			}

			this.objectHolder.removeEnemyProjectiles(this);

			this.debug('enemyProjectiles count: ' + this.objectHolder.enemyProjectiles.length);

			super.destroy();
		}
	}
}