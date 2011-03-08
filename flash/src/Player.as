package 
{
	import enemies.Enemy;
	import Projectiles.ProjectileActorShapeShifter;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Rene Zwaan
	 */
	public class Player extends MovieClip
	{
//		private var pos:Point;
		private var moveSpeed:Number;
		private var health:Number;
//		private var curentCaracter:String;
//		private var alife:Boolean;
		private var updateTimer:Timer;
		
//		private var objectHolder:ObjectHolder;
		
		private var actor3D:Actor3D;
		
		private var main:Main;
		
		public function Player(_main:Main):void 
		{
			main = _main;
			updateTimer = new Timer(GameSetings.GAMESPEED);
			updateTimer.addEventListener(TimerEvent.TIMER,update);
			updateTimer.start();
			PlayerSetup();
		}
		
		private function PlayerSetup() : void 
		{
			health 									= GameSetings.PLAYERHP;
			actor3D 								= new Actor3D();
			this.y 									= GameSetings.PLAYERYPOS;
			moveSpeed 								= GameSetings.PLAYERMOVESPEED;
			addChild(actor3D);
		}

		private function update(event : TimerEvent) : void 
		{
			moveHandler();
			checkColition();
			
		}

		private function moveHandler():void
		{
			if (main.keyBoard._D == "down") this.x += moveSpeed;
			if (main.keyBoard._A == "down") this.x -= moveSpeed;
		}

		private function checkColition() : void 
		{
			for each (var i : ProjectileActorShapeShifter in main.objectHolder.enemyProjectiles) {
				if (actor3D.hitTestObject(i) == true)
				{
					 trace("hit");
				}
				
			}
		}
		
		public function remove():void 
		{
			updateTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, update);
		}
	}
}
