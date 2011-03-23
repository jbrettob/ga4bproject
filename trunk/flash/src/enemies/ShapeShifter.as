package enemies
{
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
		private var _sprite:ActorShapeShifter;
		private var _canShoot:Boolean = true;
		private var _canShootTimer:Timer;

		public function ShapeShifter(objectHolder:ObjectHolder):void
		{
			this.objectHolder = objectHolder;

			super();
		}

		override public function init():void
		{
			this._sprite = new ActorShapeShifter();
			this.addChild(this._sprite);

			this.moveSpeed = GameSetings.SHAPESHIFTERMOVESPEED;
			this.health = GameSetings.SHAPESHIFTERHP;
			this.score = GameSetings.SHAPESHIFTERSCORE;

			var newTimer : Number = Math.round(Math.random() * GameSetings.SHAPESHIFTERMINSHOOTWAIT) + GameSetings.SHAPESHIFTERMINSHOOTWAIT;
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
			if ((parent as ObjectHolder).gameState != GameSetings.PAUSED)
			{
				this.y += this.moveSpeed;
	
				this.checkCollision();
	
				if (this._canShoot)
				{
					if (this.y < 400)
					{
						this.shootProjectile();
	
						this._canShoot = false;
						this._canShootTimer.start();
					}
				}
				
	
				if (this.y >= (GameSetings.GAMEHEIGHT - 50))
				{
					// TODO: testing purpose
					objectHolder.__parent.hud.lives -=1;
					this.destroy();
				}
	
				super.update();
			}
		}

		private function checkCollision():void
		{
			// TODO: half working
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

		private function shootProjectile():void
		{
			var distX:Number = this.objectHolder.player.x - (this.x);
			var distY:Number = (this.objectHolder.player.y) - (this.y);

			var radians:Number = Math.atan2(distY, distX);
			var degrees:Number = radians * 180 / Math.PI;
			
			var projectile:ProjectileActorShapeShifter = new ProjectileActorShapeShifter(this.objectHolder, this.x, this.y, degrees);
			this.objectHolder.addChild(projectile);
			this.objectHolder.addEnemyProjectiles(projectile);
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