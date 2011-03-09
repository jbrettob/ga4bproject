package com.jbrettob.display
{
	import flash.display.MovieClip;
	/**
	 * @author jaycerettob
	 */
	public class Projectile extends Actor
	{
		public var toX:Number = 0;
		public var toY:Number = 0;
		public var sprite:MovieClip;
		
		private var _damage:Number = 1;

		public function Projectile(getObjectHolder:ObjectHolder, posX:Number, posY:Number, toX:Number, toY:Number)
		{
			this.objectHolder = getObjectHolder;
			
			this.x = posX;
			this.y = posY;

			this.toX = toX;
			this.toY = toY;
			
			super();
		}

		override public function init():void
		{
			super.init();
		}

		override public function update():void
		{
			if (this.x <= 0 || this.x >= GameSetings.GAMEWITH || this.y <= 0 || this.y >= GameSetings.GAMEHEIGHT)
			{
				this.destroy();
			}

			super.update();
		}

		override public function destroy():void
		{
			super.destroy();
		}

		public function get damage():Number
		{
			return this._damage;
		}

		public function set damage(damage:Number):void
		{
			if (damage <= 0)
			{
				damage = 1;
			}

			this._damage = damage;
		}
	}
}
