package 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	/**
	 * @author Rene Zwaan
	 */
	public class Player extends MovieClip
	{
		private var pos:Point;
		private var moveSpeed:Number;
		private var health:Number;
		private var curentCaracter:String;
		private var alife:Boolean;
		private var updateTimer:Timer;
		
		private var objectHolder:ObjectHolder;
		
		private var actor3D:Actor3D;
		
		public function Player(main:Main):void
		{
			updateTimer = new Timer(1,0);
			updateTimer.addEventListener(TimerEvent.TIMER_COMPLETE,update);
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
		}

		public function remove():void 
		{
			updateTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, update);
		}
	}
}
