package projectiles 
{
	import com.jbrettob.display.Projectile;
	/**
	 * @author Rene Zwaan
	 */
	public class ProjectilePlayer3D extends Projectile
	{
		private var _projectile:Projectile3D;
		
		public function ProjectilePlayer3D(_objectHolder:ObjectHolder, posX:Number, posY:Number, toX:Number, toY:Number):void
		{
			super(_objectHolder, posX, posY, toX, toY);
			trace(posX);
			super.init();
			_projectile = new Projectile3D();
			this.addChild(_projectile);
		}
		
		override public function update():void
		{
			this.x += this.toX * .01;
			this.y += this.toY * .01;

			if (this.y <= 0)
			{
				this.destroy();
			}

			super.update();
		}
	}
}
