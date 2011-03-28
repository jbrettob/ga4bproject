package projectiles
{
	import objectsHolder.ObjectHolderFront;
	import objectsHolder.ObjectHolderBack;

	import com.jbrettob.display.Projectile;

	import flash.display.MovieClip;
	import flash.geom.Point;

	/**
	 * @author Rene Zwaan
	 */
	public class ProjectilePlayer2D extends Projectile
	{
		private var _sprite:MovieClip;
		private var _mousePos:Point;
		private var _splashed:Boolean = false;

		public function ProjectilePlayer2D(_objectHolder:ObjectHolderFront, posX:Number, posY:Number, degrees:Number):void
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
			this._sprite.scaleX = 0.3;
			this._sprite.scaleY = 0.3;
			this._mousePos = new Point(stage.mouseX, stage.mouseY);
			this.addChild(this._sprite);
			this.damage = GameSetings.ACTOR2DPROJECTILEDAMAGE;

			super.init();
		}

		override public function update():void
		{
			if (parent)
			{
				if ((parent as ObjectHolderBack).gameState != GameSetings.PAUSED)
				{
					this.x += this.xSpeed;
					this.y += this.ySpeed;
					if (Point.distance(new Point(this.x, this.y), this._mousePos) <= 10 && !this._splashed)
					{
						this.splash();
					}

					if (this.y <= 0)
					{
						this.destroy();
					}

					if (this._sprite.currentFrameLabel == "destroy")
					{
						this.realDestroy();
					}

					super.update();
				}
			}
		}

		override public function destroy():void
		{
			if (!this._splashed) splash();
		}

		private function splash():void
		{
			this._splashed = true;
			this._sprite.gotoAndPlay("explode");
			this.xSpeed = 0;
			this.ySpeed = 0;
		}

		private function realDestroy():void
		{
			if (this._sprite)
			{
				if (this.contains(this._sprite))
				{
					this.removeChild(this._sprite);
				}
				this._sprite = null;
			}

			this.objectHolderFront.removePlayerProjectiles(this);

			super.destroy();
		}
	}
}