package projectiles
{
	import com.jbrettob.display.Projectile;

	/**
	 * @author Jayce Rettob
	 */
	public class ProjectileActorShapeShifter extends Projectile
	{
		public function ProjectileActorShapeShifter(objectHolder:ObjectHolder, posX:Number, posY:Number, degrees:Number)
		{
			super(objectHolder, posX, posY);
			
			this.speed = GameSetings.SHAPESHIFTERPROJECTILESPEED;

			if (this.damage <= 0) this.damage = 1;
			
			this.rotation = degrees;
			
			var bulletAngle:Number = ((this.rotation) * Math.PI / 180);
			this.xSpeed = Math.cos(bulletAngle) * this.speed;
			this.ySpeed = Math.sin(bulletAngle) * this.speed;
		}

		override public function init():void
		{
			this.sprite = new ProjectileBug();
			this.addChild(this.sprite);

			super.init();
		}

		override public function update():void
		{
			if ((parent as ObjectHolder).gameState != GameSetings.PAUSED)
			{
			this.x += this.xSpeed;
			this.y += this.ySpeed;

			if (this.y >= (GameSetings.GAMEHEIGHT - 50))
			{
				this.destroy();
			}

			super.update();
			}
		}

		override public function destroy():void
		{
			if (this.sprite)
			{
				this.removeChild(this.sprite);
				this.sprite = null;
			}

			this.objectHolder.removeEnemyProjectiles(this);

			super.destroy();
		}
	}
}