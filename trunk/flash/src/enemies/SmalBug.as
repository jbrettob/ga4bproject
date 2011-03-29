package enemies
{
	import objectsHolder.ObjectHolderFront;

	import com.jbrettob.display.Actor;
	import com.jbrettob.display.Projectile;
	import com.jbrettob.enum.Sounds;
	import com.jbrettob.media.sound.SoundChannelKing;

	/**
	 * @author Jayce Rettob
	 */
	public class SmalBug extends Actor
	{
		private var _sprite : bug_small;

		public function SmalBug(_objectHolderFront : ObjectHolderFront) : void
		{
			this.objectHolderFront = _objectHolderFront;

			super();
		}

		override public function init() : void
		{
			this._sprite = new bug_small();
			this._sprite.scaleX = .3;
			this._sprite.scaleY = .3;
			this.addChild(this._sprite);

			this.moveSpeed = GameSetings.SMALBUGMOVESPEED;
			this.health = GameSetings.SMALBUGHEALTH;
			this.score = GameSetings.SHAPESHIFTERSCORE;

			super.init();
		}

		override public function update() : void
		{
			if (parent)
			{
				if ((parent as ObjectHolderFront).gameState != GameSetings.PAUSED)
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
			
			if (this.health <= 0)
			{
				SoundChannelKing.getInstance().playSound(Sounds.SOUND_ENEMYDESTROYED);
			}
		}

		private function checkCollision() : void
		{
			for each (var i:Projectile in this.objectHolderFront.playerProjectiles)
			{
				if (this.hitTestObject(i))
				{
					this.health -= i.damage;
					this.hitColorTween();

					i.destroy();
				}
			}
		}

		override public function destroy() : void
		{
			if (this._sprite)
			{
				this.removeChild(this._sprite);
				this._sprite = null;
			}

			this.objectHolderFront.removeEnemy(this);

			super.destroy();
		}
	}
}