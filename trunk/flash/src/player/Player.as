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
		private var main:Game;
		private var aimer:Aimer;
		private var shootTimer:Timer;
		private var allowFire:Boolean = true;
		private var smoke:Cloud;
		private var _tutorialMovedLeft:Boolean = false;
		private var _tutorialMovedRight:Boolean = false;
		private var _tutorialSwitch1:Boolean = false;
		private var _tutorialSwitch2:Boolean = false;
		private var _tutorialSwitch3:Boolean = false;

		public function Player(_main:Game):void
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

			shootTimer = new Timer(GameSetings.ACTOR3DPROJECTILERELOADSPEED);
			shootTimer.addEventListener(TimerEvent.TIMER, setAlouwFiretoTrue);
			shootTimer.start();

			PlayerSetup();
			ainmerSetup();

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
			smokeSetup();

			main.hud.lives = GameSetings.PLAYER_LIVES;
		}

		private function smokeSetup():void
		{
			smoke = new Cloud();
			smoke.scaleX = 0.4;
			smoke.scaleY = 0.4;
			smoke.x = (actor.x - 30);
			smoke.y = (actor.y - 45);

			addChild(smoke);
		}

		private function resetSmoke():void
		{
			smoke.x = (actor.x - 30);
			smoke.y = (actor.y - 45);
			smoke.gotoAndPlay(1);
		}

		override public function update():void
		{
			if (main.gameState != GameSetings.PAUSED)
			{
				inputHandler();
				checkColition();
				updateAimer();

				// TUTORIAL 2
				if (this._tutorialMovedLeft && this._tutorialMovedRight && main.level < 1)
				{
					this.log('finished tutorial 0: move character with a and d');
					main.level = 1;
				}

				// TUTORIAL 3
				if (this._tutorialSwitch1 && this._tutorialSwitch2 && this._tutorialSwitch3 && main.level == 2)
				{
					this.log('finished tutrial 3: switch characters');
					main.level = 3;
				}

				// SKIP TUTORIAL
				if (main.level < 5)
				{
					if (main.keyBoard.esc == "down")
					{
						main.level = 5;
						main.hud.score = 0;
					}
				}
			}
		}

		private function updateAimer():void
		{
			aimer.x = mouseX;
			aimer.y = mouseY;
		}

		private function inputHandler():void
		{
			if (main.keyBoard.D == "down" && this.x < GameSetings.PLAYERMAXRIGHT)
			{
				this.x += moveSpeed;
				if (main.level == 0) this._tutorialMovedRight = true;
			}
			if (main.keyBoard.A == "down" && this.x > GameSetings.PLAYERMAXLEFT)
			{
				this.x -= moveSpeed;
				if (main.level == 0) this._tutorialMovedLeft = true;
			}
			if (main.keyBoard.one == "down")
			{
				resetSmoke();
				actor.changeCaracterTo(GameSetings.ACTOR2D);
				if (main.level == 2) this._tutorialSwitch1 = true;
			}
			if (main.keyBoard.two == "down")
			{
				resetSmoke();
				actor.changeCaracterTo(GameSetings.ACTOR3D);
				if (main.level == 2) this._tutorialSwitch2 = true;
			}
			if (main.keyBoard.three == "down")
			{
				resetSmoke();
				actor.changeCaracterTo(GameSetings.ACTORPRO);
				if (main.level == 2) this._tutorialSwitch3 = true;
			}
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
						newProjectile = new ProjectilePlayer2D(main.objectHolder, this.x, (this.y - this.actor.height), degrees);
						break;
					case GameSetings.ACTOR3D:
						newProjectile = new ProjectilePlayer3D(main.objectHolder, this.x, (this.y - 85), degrees);
						break;
					case GameSetings.ACTORPRO:
						newProjectile = new ProjectilePlayerPRO(main.objectHolder, this.x, (this.y - 85), degrees);
						break;
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
			if (this.main)
			{
				for each (var i : Projectile in main.objectHolder.enemyProjectiles)
				{
					if (actor.hitTestObject(i) == true)
					{
						// can't be die while in tutorial mode, HAX ON!!
						if (main.level >= 5) main.hud.lives -= 1;
						this.hitColorTween();
						i.destroy();
					}
				}

				for each (var o : Orb in main.objectHolder.orbs)
				{
					if (this.actor.hitTestObject(o.orb) == true)
					{
						// add idea
						o.destroy();
						if (main.level == 3)
						{
							this.main.hud.upgradeTimer.addUpgrade(200);
							this.main.level = 4;
						}
						else
						{
							this.main.hud.upgradeTimer.addUpgrade(GameSetings.ORBXP);
						}
					}
				}
			}
		}

		override public function destroy():void
		{
			this.actor.destroy();

			while (this.numChildren > 0)
			{
				this.removeChildAt(0);
			}

			if (parent) (parent as Game).removeChild(this);

			super.destroy();
		}

		public function get _shootTimer():Timer
		{
			return this.shootTimer;
		}

		public function set _shootTimer(value:Timer):void
		{
			this.shootTimer = value;
		}
	}
}
