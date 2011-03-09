package player {
	import projectiles.ProjectilePlayer3D;
	import projectiles.ProjectileActorShapeShifter;
	import com.jbrettob.display.Actor;

	/**
	 * @author Rene Zwaan
	 */
	public class Player extends Actor
	{
		private var actor:playerCaracterHolder;
		private var main:Main;
		private var aimer:Aimer;
		
		public function Player(_main:Main):void 
		{
			main = _main;
			objectHolder = main.objectHolder;
			PlayerSetup();
			ainmerSetup();
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
			if (main.keyBoard.leftMouse == "down") newProjectile();
		}
		
		private function newProjectile():void
		{
			switch(actor.currentCaracter)
			{
				case GameSetings.ACTOR2D:
				{
					break;
				}
				case GameSetings.ACTOR3D:
				{
					var projectile3D : ProjectilePlayer3D;
					projectile3D = new ProjectilePlayer3D(main.objectHolder, this.x, this.y, mouseX, mouseY);
					objectHolder.addplayerProjectiles(projectile3D);
					objectHolder.addChild(projectile3D);
					break;
				}
				case GameSetings.ACTORPRO:
				{
					break;
				}
			}
			
		}
		
		private function checkColition() : void 
		{
			for each (var i : ProjectileActorShapeShifter in main.objectHolder.enemyProjectiles) 
			{
				if (actor.hitTestObject(i) == true) 
				{
					this.health -= i.damage;
					i.destroy();
				}
			}
		}
		
		public function remove():void 
		{
			destroy();
		}
	}
}
