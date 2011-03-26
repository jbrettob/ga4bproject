package projectiles
{
	import com.jbrettob.display.Projectile;

	import flash.geom.Point;

	/**
	 * @author Rene Zwaan
	 */
	public class ProjectilePlayerPRO extends Projectile
	{
		private var _sprite:ProjectilePRO;		private var _mousePoint:Point;
		

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
			this.damage = GameSetings.ACTORPROPROJECTILEDAMAGE;
			this._sprite = new ProjectilePRO();
			this.addChild(this._sprite);
			_mousePoint = new Point(stage.mouseX,stage.mouseY);
			super.init();
		}

		override public function update():void
		{
			if ((parent as ObjectHolder).gameState != GameSetings.PAUSED)
			{
			this.x += this.xSpeed;
			this.y += this.ySpeed;

			if (Point.distance(new Point(this.x, this.y), _mousePoint) <= 2)
			{
				 this.destroy();
			}

			if (this.y <= 0)
			{
				this.destroy();
			}

			super.update();
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

			this.objectHolder.removePlayerProjectiles(this);

			super.destroy();
		}
	}
}
