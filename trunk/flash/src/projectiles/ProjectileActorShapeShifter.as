package projectiles
{
	import com.jbrettob.display.Projectile;

	/**
	 * @author Jayce Rettob
	 */
	public class ProjectileActorShapeShifter extends Projectile
	{

		public function ProjectileActorShapeShifter(objectHolder:ObjectHolder, posX:Number, posY:Number, toX:Number, toY:Number)
		{
			this.objectHolder = objectHolder;

			if (this.damage <= 0) this.damage = 1;

			super(this.objectHolder, posX, posY, toX, toY);
		}

		override public function init():void
		{
			this.sprite = new ProjectileShapeShifter();
			this.addChild(this.sprite);

			super.init();
		}

		override public function update():void
		{
			this.x += this.toX * .01;
			this.y += this.toY * .01;

			if (this.y >= (GameSetings.GAMEHEIGHT - 50))
			{
				this.destroy();
			}

			super.update();
		}

		override public function destroy():void
		{
			if (this.sprite)
			{
				this.removeChild(this.sprite);
				this.sprite = null;
			}

			this.objectHolder.removePlayerProjectiles(this);

			super.destroy();
		}
	}
}