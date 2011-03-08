package projectiles
{
	import com.jbrettob.display.Actor;
	/**
	 * @author Jayce Rettob
	 */
	public class ProjectileActorShapeShifter extends Actor
	{
		private var _sprite:ProjectileShapeShifter;
		
		private var _damage:Number = 1;
		
		public function ProjectileActorShapeShifter(objectHolder:ObjectHolder, posX:Number, posY:Number)
		{
			this.objectHolder = objectHolder;
			
			this.x = posX;
			this.y = posY;
			
			if (this._damage <= 0) this._damage = 1;
			
			super();
		}
		
		override public function init():void
		{
			this._sprite = new ProjectileShapeShifter();
			this.addChild(this._sprite);
			
			super.init();
		}

		override public function update():void
		{
			this.y += 4;
			
			if (this.y >= GameSetings.GAMEHEIGHT)
			{
				this.destroy();
			}
			
			super.update();
		}
		
		public function get damage():Number
		{
			return this._damage;
		}
		
		
		override public function destroy():void
		{
			if (this._sprite)
			{
				this.removeChild(this._sprite);
				this._sprite = null;
			}
			
			this.objectHolder.removeEnemyProjectiles(this);
			
			this.debug('enemyProjectiles count: ' + this.objectHolder.enemyProjectiles.length);
			
			super.destroy();
		}
	}
}