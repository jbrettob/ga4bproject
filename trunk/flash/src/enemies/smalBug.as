package enemies
{
	import objectsHolder.ObjectHolderBack;

	import com.jbrettob.display.Actor;
	import com.jbrettob.display.Projectile;


	/**
	 * @author Jayce Rettob
	 */
	public class smalBug extends Actor
	{
		private var _sprite:ActorBug;

		public function smalBug(_objectHolderFront:ObjectHolderBack):void
		{
			this.objectHolderFront = _objectHolderFront;

			super();
		}

		override public function init():void
		{
			this._sprite = new ActorBug();
			this._sprite.scaleX = .7;			this._sprite.scaleY = .7;
			this.addChild(this._sprite);

			this.moveSpeed = GameSetings.SMALBUGMOVESPEED;
			this.health = GameSetings.SHAPESHIFTERHP;
			this.score = GameSetings.SHAPESHIFTERSCORE;

			

			super.init();
		}


		override public function update():void
		{
			if ((parent as ObjectHolderBack).gameState != GameSetings.PAUSED)
			{
				
				this.y += this.moveSpeed;
	
				this.checkCollision();
				
	
				if (this.y >= (GameSetings.GAMEHEIGHT - 50))
				{
					this.destroy();
				}
	
				super.update();
			}
		}

		private function checkCollision():void
		{
			for each (var i:Projectile in this.objectHolder.playerProjectiles)
			{
				if (this.hitTestObject(i))
				{
					this.health -= i.damage;
					this.hitColorTween();

					i.destroy();
				}
			}
		}


		override public function destroy():void
		{
			if (this._sprite)
			{
				this.removeChild(this._sprite);
				this._sprite = null;
			}

			this.objectHolder.removeEnemy(this);

			super.destroy();
		}
	}
}