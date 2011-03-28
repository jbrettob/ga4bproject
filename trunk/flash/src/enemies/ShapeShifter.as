package enemies
{
	import com.jbrettob.media.sound.SoundChannelKing;
	import com.jbrettob.enum.Sounds;
	import objectsHolder.ObjectHolderBack;
	import objectsHolder.ObjectHolderFront;

	import projectiles.ProjectileActorShapeShifter;

	import com.jbrettob.display.Actor;
	import com.jbrettob.display.Projectile;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Jayce Rettob
	 */
	public class ShapeShifter extends Actor
	{
		private var _sprite:ActorBug;
		private var _canShoot:Boolean = true;
		private var _canShootTimer:Timer;

		public function ShapeShifter(objectHolderFront:ObjectHolderFront, objectHolderBack:ObjectHolderBack):void
		{
			this.objectHolderFront = objectHolderFront;
			this.objectHolderBack = objectHolderBack;

			super();
		}

		override public function init():void
		{
			this._sprite = new ActorBug();
			this.addChild(this._sprite);

			this.moveSpeed = GameSetings.SHAPESHIFTERMOVESPEED;
			this.health = GameSetings.SHAPESHIFTERHP;
			this.score = GameSetings.SHAPESHIFTERSCORE;

			var newTimer:Number = Math.round(Math.random() * GameSetings.SHAPESHIFTERMINSHOOTWAIT) + GameSetings.SHAPESHIFTERMINSHOOTWAIT;
			this._canShootTimer = new Timer(newTimer, 1);
			this._canShootTimer.addEventListener(TimerEvent.TIMER, this.handleCanShootTimer);
			this._canShootTimer.start();

			super.init();
		}

		private function handleCanShootTimer(event:TimerEvent):void
		{
			this._canShoot = true;
		}

		override public function update():void
		{
			if ((parent as ObjectHolderBack).gameState != GameSetings.PAUSED)
			{
				this.y += this.moveSpeed;

				this.checkCollision();

				if (this._canShoot)
				{
					if (this.y < 400 && this.y > 0)
					{
						this.shootProjectile();

						this._canShoot = false;
						this._canShootTimer.start();
					}
				}

				if (this.y >= (GameSetings.GAMEHEIGHT - 50))
				{
					this.destroy();
				}

				if (this.health <= 0)
				{
					SoundChannelKing.getInstance().playSound(Sounds.SOUND_ENEMYDESTROYED);
				}

				super.update();
			}
		}

		private function checkCollision():void
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

		private function shootProjectile():void
		{
			var distX:Number = this.objectHolderBack.player.x - (this.x);
			var distY:Number = (this.objectHolderBack.player.y) - (this.y);

			var radians:Number = Math.atan2(distY, distX);
			var degrees:Number = radians * 180 / Math.PI;

			var projectile:ProjectileActorShapeShifter = new ProjectileActorShapeShifter(this.objectHolderFront, this.x, this.y, degrees);

			this.objectHolderFront.addChild(projectile);
			this.objectHolderFront.addEnemyProjectiles(projectile);
		}

		override public function destroy():void
		{
			if (this._sprite)
			{
				this.removeChild(this._sprite);
				this._sprite = null;
			}

			this.objectHolderBack.removeEnemy(this);

			super.destroy();
		}
	}
}