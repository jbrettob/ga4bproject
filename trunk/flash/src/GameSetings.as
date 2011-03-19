package 
{
	import flash.display.MovieClip;
	import flash.display.StageQuality;
	/**
	 * @author Rene Zwaan
	 */
	public class GameSetings extends MovieClip
	{
		// Debu setting
		public static var SHOW_LOG									:Boolean = true;
		// Game setings
		public static var PAUSED									:Boolean = false;
		public static var GAMESPEED									:Number = 41;
		public static var GAMEWITH									:Number = 820;
		public static var GAMEHEIGHT								:Number = 750;
		public static var GAMEQUALITY								:String = StageQuality.HIGH;
		// Player
		public static var PLAYER_LIVES								:Number = 3;
		public static var PLAYERHP									:Number	= 10;		public static var PLAYERMOVESPEED                  			:Number	= 6;		public static var PLAYER2D									:String	= "2DCaracter";		public static var PLAYER3D									:String	= "3DCaracter";		public static var SCRIPTERCARACTER							:String	= "scripterCaracter";
		public static var PLAYERXPOS								:Number = 500;		public static var PLAYERYPOS								:Number = 620;		public static var PLAYERMAXLEFT								:Number = 50;		public static var PLAYERMAXRIGHT							:Number = 750;		//actor3D
		// Actors
		public static var ACTOR2D									:String = "actor2d";
		public static var ACTOR2DPROJECTILESPEED					:Number = 10;		public static var ACTOR2DPROJECTILEDAMAGE					:Number = 1;		public static var ACTOR2DPROJECTILERELOADSPEED				:Number = 400;
				public static var ACTOR3D									:String = "actor3d";
		public static var ACTOR3DPROJECTILESPEED					:Number = 5;		public static var ACTOR3DPROJECTILEDAMAGE					:Number = 3;		public static var ACTOR3DPROJECTILERELOADSPEED				:Number = 500;
				public static var ACTORPRO									:String = "actorpro";
		public static var ACTORPROPROJECTILESPEED					:Number = 20;		public static var ACTORPROPROJECTILEDAMAGE					:Number = 1;		public static var ACTORPROPROJECTILERELOADSPEED				:Number = 600;		// Enemys
		// Deathline
		public static var DEATHLINESTARTHEIGHT						:Number = 60;		public static var DEATHLINEMOVESPEED						:Number = 0.05;		//castle
		public static var CASTLEHEIGHT								:Number = 810;
		
		// ShapeShifter
		public static var SHAPESHIFTERNAME							:String = "shapeshifter";
		public static var SHAPESHIFTERHP							:Number = 5;
		public static var SHAPESHIFTERMOVESPEED						:Number = 1;
		public static var SHAPESHIFTERSCORE							:Number = 10;
		public static var SHAPESHIFTERPROJECTILESPEED				:Number = 4;
		
		public function GameSetings():void
		{
			loadXML();
		}
		/**
		 * @info in here the info gets loaded from a xml
		 * 
		 * @todo everything
		 * 
		 */
		private function loadXML():void
		{
			
		}
		
		public function remove():void
		{
		}
	}
}
