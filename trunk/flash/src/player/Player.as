package player
{
	import projectiles.ProjectilePlayer2D;
	import projectiles.ProjectilePlayer3D;

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
			shootTimer = new Timer(GameSetings.ACTOR3DSHOOTDELAY);
			shootTimer.addEventListener(TimerEvent.TIMER, setAlouwFiretoTrue);
			shootTimer.start();
			super();
		}

		private function setAlouwFiretoTrue(event : TimerEvent) : void
		{
			allowFire = true;
		}
		
		override public function init():void
		{
			objectHolder = main.objectHolder;
			PlayerSetup();
			ainmerSetup();
			
			super.init();
		}

		private function ainmerSetup() : void 
		{
			aimer = new Aimer();
			aimer.y = mouseY;
			aimer.x = mouseX;
			this.addChild(aimer);
		}
		
		private function PlayerSetup() : void 
		{
			health 									= GameSetings.PLAYERHP;
			actor 									= new playerCaracterHolder();
			this.x 									= GameSetings.PLAYERXPOS;
			this.y 									= GameSetings.PLAYERYPOS;
			moveSpeed 								= GameSetings.PLAYERMOVESPEED;
			addChild(actor);
			
			// TODO: lives
			main.hud.lives = 1;
		}

		override public function update() : void 
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

		private function inputHandler() : void 
		{
			if (main.keyBoard.D == "down" && this.x < GameSetings.PLAYERMAXRIGHT) this.x += moveSpeed;
			if (main.keyBoard.A == "down" && this.x > GameSetings.PLAYERMAXLEFT) this.x -= moveSpeed;
			if (main.keyBoard.one == "down") actor.changeCaracterTo(GameSetings.ACTOR2D);			if (main.keyBoard.two == "down") actor.changeCaracterTo(GameSetings.ACTOR3D);			if (main.keyBoard.tree == "down") actor.changeCaracterTo(GameSetings.ACTORPRO);
			if (main.keyBoard.leftMouse == "down") newProjectile();
		}
		
		private function newProjectile():void
		{
			if (allowFire == true)
			{
			switch(actor.currentCaracter)
			{
				case GameSetings.ACTOR2D:
				{
					var projectile2D : ProjectilePlayer2D;
					projectile2D = new ProjectilePlayer2D(main.objectHolder, this.x, (this.y - 85), mouseX, mouseY);
					objectHolder.addplayerProjectiles(projectile2D);
						objectHolder.addChild(projectile2D);
						allowFire = false;
						shootTimer.reset();
						shootTimer.start();
					break;
				}
				case GameSetings.ACTOR3D:
				{
					var projectile3D : ProjectilePlayer3D;
					projectile3D = new ProjectilePlayer3D(main.objectHolder, this.x, (this.y - 85), mouseX, mouseY);
					objectHolder.addplayerProjectiles(projectile3D);
						objectHolder.addChild(projectile3D);
						allowFire = false;
						shootTimer.reset();
						shootTimer.start();
					break;
				}
				case GameSetings.ACTORPRO:
				{
					var projectile3D : ProjectilePlayer3D;
					projectile3D = new ProjectilePlayer3D(main.objectHolder, this.x, (this.y - 85), mouseX, mouseY);
					objectHolder.addplayerProjectiles(projectile3D);
						objectHolder.addChild(projectile3D);
						allowFire = false;
						shootTimer.reset();
						shootTimer.start();
					break;
				}
			}
			}
			
		}
		
		private function checkColition() : void 
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
		}
		
		
		override public function destroy():void
		{
			main.objectHolder.clearAll();
			
			super.destroy();
		}
	}
}
