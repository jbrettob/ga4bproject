package projectiles 
{
	import com.jbrettob.display.Projectile;
	/**
	 * @author Rene Zwaan
	 */
	public class ProjectilePlayer3D extends Projectile
	{
		private var _sprite:Projectile3D;
		
		public function ProjectilePlayer3D(_objectHolder:ObjectHolder, posX:Number, posY:Number, toX:Number, toY:Number):void
		{
			super(_objectHolder, posX, posY, toX, toY);
		}
		
		
		override public function init():void
		{
			this._sprite = new Projectile3D();
			this.addChild(this._sprite);
			
			super.init();
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

		override public function destroy():void
		{
			if (this._sprite)
			{
				if(this.contains(this._sprite))
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