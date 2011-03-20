package projectiles
{
	import flash.geom.Point;
	import com.jbrettob.display.Projectile;

	import flash.display.Sprite;

	/**
	 * @author Rene Zwaan
	 */
	public class ProjectilePlayer2D extends Projectile
	{
		private var _sprite:Sprite;
		private var mousePos:Point;

		public function ProjectilePlayer2D(_objectHolder:ObjectHolder, posX:Number, posY:Number, degrees:Number):void
		{
			super(_objectHolder, posX, posY);

			this.rotation = degrees;
			this.speed = GameSetings.ACTOR2DPROJECTILESPEED;

			var bulletAngle:Number = (degrees * Math.PI / 180);
			this.xSpeed = Math.cos(bulletAngle) * this.speed;
			this.ySpeed = Math.sin(bulletAngle) * this.speed;
		}

		override public function init():void
		{
			this._sprite = new Projectile2D();
			mousePos = new Point(stage.mouseX,stage.mouseY);
			this.addChild(_sprite);

			super.init();
		}

		override public function update():void
		{
			this.x += this.xSpeed;
			this.y += this.ySpeed;

			if (Point.distance(new Point(this.x, this.y), mousePos) <= 10)
			{
				destroy();
			}

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




