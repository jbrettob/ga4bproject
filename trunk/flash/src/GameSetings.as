package 
{
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 */
	public class GameSetings extends MovieClip
	{
		//Game setings
		public static var PAUSED									:Boolean = false;
		public static var GAMESPEED										:Number = 41;
		public static var GAMEWITH									:Number = 1000;
		public static var GAMEHEIGHT								:Number = 750;
		//Player
		public static var PLAYERHP									:Number	= 10;
		public static var PLAYERYPOS								:Number = 700;
		//Enemys
		//ShapeShifter
		public static var SHAPESHIFTERNAME							:String = "shapeshifter";
		public static var SHAPESHIFTERHP							:Number = 1;
		public static var SHAPESHIFTERMOVESPEED						:Number = 1;
		
		public function GameSetings():void
		{
			
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