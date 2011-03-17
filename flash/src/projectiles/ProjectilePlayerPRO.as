package projectiles
{
	import com.jbrettob.display.Projectile;

	/**
	 * @author Rene Zwaan
	 */
	public class ProjectilePlayerPRO extends Projectile
	{
		private var _sprite:ProjectilePRO;

		public function ProjectilePlayerPRO(_objectHolder:ObjectHolder, posX:Number, posY:Number, degrees:Number):void
		{
			super(_objectHolder, posX, posY);
			
			this.rotation = degrees;
			this.speed = GameSetings.ACTORPROPROJECTILESPEED;
			
			var bulletAngle:Number = (degrees * Math.PI / 180);
			this.xSpeed = Math.cos(bulletAngle) * this.speed;
			this.ySpeed = Math.sin(bulletAngle) * this.speed;
		}

		override public function init():void
		{
			this._sprite = new ProjectilePRO();
			this.addChild(this._sprite);

			super.init();
		}

		override public function update():void
		{
			this.x += this.xSpeed;
			this.y += this.ySpeed;

			if (this.y <= 0)
			{
				this.destroy();
			}

			super.update();
		}

		override public function destroy():void
		{
			if (this._sprite)
			{
				if (this.contains(this._sprite))
				{
					this.removeChild(this._sprite);
				}
				this._sprite = null;
			}

			this.objectHolder.removePlayerProjectiles(this);

			super.destroy();
		}
	}
}
