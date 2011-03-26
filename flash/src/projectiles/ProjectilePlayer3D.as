package projectiles
{
	import com.jbrettob.display.Projectile;

	/**
	 * @author Rene Zwaan
	 */
	public class ProjectilePlayer3D extends Projectile
	{
		private var _sprite:Projectile3D;

		public function ProjectilePlayer3D(_objectHolder:ObjectHolder, posX:Number, posY:Number, degrees:Number):void
		{
			super(_objectHolder, posX, posY);

			this.rotation = degrees;
			this.speed = GameSetings.ACTOR3DPROJECTILESPEED;
			this.damage = GameSetings.ACTOR3DPROJECTILEDAMAGE;

			var bulletAngle:Number = (degrees * Math.PI / 180);
			this.xSpeed = Math.cos(bulletAngle) * this.speed;
			this.ySpeed = Math.sin(bulletAngle) * this.speed;
		}

		override public function init():void
		{
			this._sprite = new Projectile3D();
			this.addChild(this._sprite);

			super.init();
		}

		override public function update():void
		{
			if (parent)
			{
				if ((parent as ObjectHolder).gameState != GameSetings.PAUSED)
				{
					this.x += this.xSpeed;
					this.y += this.ySpeed;

					if (this.y <= 0)
					{
						this.destroy();
					}

					collisionCheck();
					super.update();
				}
			}
		}

		private function collisionCheck():void
		{
			if (parent)
			{
				if ((parent as ObjectHolder))
				{
					for each (var p : Projectile in (parent as ObjectHolder).enemyProjectiles)
					{
						if (this.hitTestObject(p))
						{
							if (p) p.destroy();
						}
					}
				}
			}
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

			// this.objectHolder.removePlayerProjectiles(this);

			super.destroy();
		}
	}
}
