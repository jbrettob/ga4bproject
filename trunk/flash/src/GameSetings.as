package 
{
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 */
	public class GameSetings extends MovieClip
	{
		// Debu setting
		public static var SHOW_LOG									:Boolean = false;
		// Game setings
		public static var PAUSED									:Boolean = false;
		public static var GAMESPEED									:Number = 41;
		public static var GAMEWITH									:Number = 1000;
		public static var GAMEHEIGHT								:Number = 750;
		// Player
		public static var PLAYERHP									:Number	= 10;		public static var PLAYERMOVESPEED                  			:Number	= 6;		public static var PLAYER2D									:String	= "2DCaracter";		public static var PLAYER3D									:String	= "3DCaracter";		public static var SCRIPTERCARACTER							:String	= "scripterCaracter";
		public static var PLAYERXPOS								:Number = 500;		public static var PLAYERYPOS								:Number = 700;		public static var PLAYERMAXLEFT								:Number = 50;		public static var PLAYERMAXRIGHT							:Number = 750;		//actor3D
		public static var ACTOR3DSHOOTDELAY							:Number = 500;
		// Actors
		public static var ACTOR2D									:String = "actor2d";		public static var ACTOR3D									:String = "actor3d";		public static var ACTORPRO									:String = "actorpro";		
		// Enemys
		
		
		// ShapeShifter
		public static var SHAPESHIFTERNAME							:String = "shapeshifter";
		public static var SHAPESHIFTERHP							:Number = 2;
		public static var SHAPESHIFTERMOVESPEED						:Number = 2;
		public static var SHAPESHIFTERSCORE							:Number = 10;
		
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
