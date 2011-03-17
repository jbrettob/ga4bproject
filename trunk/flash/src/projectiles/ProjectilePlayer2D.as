package projectiles
{
	import com.jbrettob.display.Projectile;

	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * @author Rene Zwaan
	 */
	public class ProjectilePlayer2D extends Projectile
	{
		private var _sprite:Sprite;
		public function ProjectilePlayer2D(_objectHolder:ObjectHolder, posX:Number, posY:Number, toX:Number, toY:Number) : void
		{
			super(_objectHolder, posX, posY, toX, toY);
		}
		
		override public function init():void
		{
			this._sprite = new Projectile2D();
			this.addChild(_sprite);
			
			super.init();
		}
		
		override public function update():void
		{
			this.x += this.toX * .02;
			this.y += this.toY * .02;
			var point : Point = new Point(this.x,this.y);
			var toPoint : Point = new Point(toX, toY);
			
			if (distance(point, toPoint) <= 3)
			{
				trace("got to the exploding point");
				this.destroy();
			}
			else
			{
				trace(point);				trace(toPoint);
				trace(distance(point, toPoint));
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
				if(this.contains(this._sprite))
				{
					this.removeChild(this._sprite);
				}
				this._sprite = null;
			}
			
			this.objectHolder.removePlayerProjectiles(this);
			
			super.destroy();
		}
		
		private function distance(Obj1:Point,Obj2:Point) 
		{
			var dx=Obj1.x-Obj2.x;
			var dy=Obj1.y-Obj2.y;
			if (Obj1.x==Obj2.x) 
			{
				if (Obj1.y-Obj2.y>0) 
				{
					return Obj1.y-Obj2.y;
				} else 
				{
					return Obj2.y-Obj1.y;
				}
			} 
			else if (Obj1.y==Obj2.y) 
			{
				if (Obj1.x-Obj2.x>0) 
				{
					return Obj1.x-Obj2.x;
				} 
				else 
				{
					return Obj2.x-Obj1.x;
				}
			}
			else 
			{
				return Math.sqrt(dx*dx+dy*dy);
			}
}
	}
}
