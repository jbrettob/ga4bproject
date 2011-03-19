package com.jbrettob.display
{
	import flash.display.MovieClip;

	/**
	 * @author Jayce Rettob
	 */
	public class Projectile extends Actor
	{
		public var xSpeed:Number = 0;
		public var ySpeed:Number = 0;
		public var speed:Number = 10;
		public var sprite:MovieClip;
		private var _damage:Number = 1;

		public function Projectile(getObjectHolder:ObjectHolder, posX:Number, posY:Number)
		{
			this.objectHolder = getObjectHolder;

			this.x = posX;
			this.y = posY;

			super();
		}

		override public function init():void
		{
			super.init();

			if (this.rotation != 0)
			{
			}
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
