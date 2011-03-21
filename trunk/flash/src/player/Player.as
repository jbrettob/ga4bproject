package player
{
	import objects.Orb;
	import projectiles.ProjectilePlayer2D;
	import projectiles.ProjectilePlayer3D;
	import projectiles.ProjectilePlayerPRO;

	import com.jbrettob.display.Actor;
	import com.jbrettob.display.Projectile;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Rene Zwaan
	 */
	public class Player extends Actor
	{
		private var actor:playerCaracterHolder;
		private var main:Main;
		private var aimer:Aimer;
		private var shootTimer:Timer;
		private var allowFire:Boolean = true;

		public function Player(_main:Main):void
		{
			main = _main;
			super();
		}

		private function setAlouwFiretoTrue(event:TimerEvent):void
		{
			allowFire = true;
		}

		override public function init():void
		{
			objectHolder = main.objectHolder;

			shootTimer = new Timer(GameSetings.ACTOR3DPROJECTILESPEED);
			shootTimer.addEventListener(TimerEvent.TIMER, setAlouwFiretoTrue);
			shootTimer.start();
			
			PlayerSetup();
			ainmerSetup();
			actor.changeCaracterTo(GameSetings.ACTOR3D);
			super.init();
		}

		private function ainmerSetup():void
		{
			aimer = new Aimer();
			aimer.y = mouseY;
			aimer.x = mouseX;
			this.addChild(aimer);
		}

		private function PlayerSetup():void
		{
			health = GameSetings.PLAYERHP;
			actor = new playerCaracterHolder();
			this.x = GameSetings.PLAYERXPOS;
			this.y = GameSetings.PLAYERYPOS;
			moveSpeed = GameSetings.PLAYERMOVESPEED;
			addChild(actor);

			main.hud.lives = GameSetings.PLAYER_LIVES;
		}

		override public function update():void
		{
			inputHandler();
			checkColition();
			updateAimer();
		}

		private function updateAimer():void
		{
			aimer.x = mouseX;
			aimer.y = mouseY;
		}

		private function inputHandler():void
		{
			if (main.keyBoard.D == "down" && this.x < GameSetings.PLAYERMAXRIGHT) this.x += moveSpeed;
			if (main.keyBoard.A == "down" && this.x > GameSetings.PLAYERMAXLEFT) this.x -= moveSpeed;
			if (main.keyBoard.one == "down") actor.changeCaracterTo(GameSetings.ACTOR2D);
			if (main.keyBoard.two == "down") actor.changeCaracterTo(GameSetings.ACTOR3D);
			if (main.keyBoard.tree == "down") actor.changeCaracterTo(GameSetings.ACTORPRO);
			if (main.keyBoard.leftMouse == "down") newProjectile();
		}

		private function newProjectile():void
		{
			var distX:Number = main.stage.mouseX - this.x;
			var distY:Number = main.stage.mouseY - (this.y - this.actor.height);

			var radians:Number = Math.atan2(distY, distX);
			var degrees:Number = radians * 180 / Math.PI;
			
			var newProjectile:Projectile;

			if (allowFire == true)
			{
				switch(actor.currentCaracter)
				{
					case GameSetings.ACTOR2D:
						{
						newProjectile = new ProjectilePlayer2D(main.objectHolder, this.x, (this.y - 85), degrees);
						break;
						}
					case GameSetings.ACTOR3D:
						{
						newProjectile = new ProjectilePlayer3D(main.objectHolder, this.x, (this.y - 85), degrees);
						break;
						}
					case GameSetings.ACTORPRO:
						{
						newProjectile = new ProjectilePlayerPRO(main.objectHolder, this.x, (this.y - 85), degrees);

						break;
						}
				}

				objectHolder.addplayerProjectiles(newProjectile);
				objectHolder.addChild(newProjectile);

				allowFire = false;
				shootTimer.reset();
				shootTimer.start();
			}
		}

		private function checkColition():void
		{
			if (this.health <= 0) this.destroy();
			for each (var i : Projectile in main.objectHolder.enemyProjectiles)
			{
				if (actor.hitTestObject(i) == true)
				{
					this.health -= i.damage;
					this.hitColorTween();
					i.destroy();
				}
			}
			
			
			for each (var o : Orb in main.objectHolder.orbs)
			{
				if (actor.hitTestObject(o._orb) == true)
				{
					// add idea
					o.remove();
				}
			}
			
		}

		override public function destroy():void
		{
			main.removeGame();

			super.destroy();
		}

		public function get _shootTimer() : Timer
		{
			return shootTimer;
		}

		public function set _shootTimer(shootTimer : Timer) : void
		{
			this.shootTimer = shootTimer;
		}
	}
}
