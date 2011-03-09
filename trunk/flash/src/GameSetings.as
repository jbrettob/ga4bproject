package 
{
	import flash.display.MovieClip;
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
		public static var GAMEWITH									:Number = 1000;
		public static var GAMEHEIGHT								:Number = 750;
		// Player
		public static var PLAYERHP									:Number	= 10;
		public static var PLAYERXPOS								:Number = 500;
		public static var ACTOR3DSHOOTDELAY							:Number = 500;
		// Actors
		public static var ACTOR2D									:String = "actor2d";
		// Enemys
		
		
		// ShapeShifter
		public static var SHAPESHIFTERNAME							:String = "shapeshifter";
		public static var SHAPESHIFTERHP							:Number = 2;
		public static var SHAPESHIFTERMOVESPEED						:Number = 2;
		
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