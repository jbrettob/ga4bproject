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
		public static var GAMESPEED									:Number = 41;
		public static var GAMEWITH									:Number = 820;
		public static var GAMEHEIGHT								:Number = 750;
		public static var GAMEQUALITY								:String = StageQuality.HIGH;
		//GameStates		public static var PAUSED									:String = "Paused";		public static var ENDED										:Boolean = false;		public static var PLAYING									:String = "Playing";		// Player
		public static var PLAYER_LIVES								:Number = 3;
		public static var PLAYERHP									:Number	= 10;		public static var PLAYERMOVESPEED                  			:Number	= 6;		public static var PLAYER2D									:String	= "2DCaracter";		public static var PLAYER3D									:String	= "3DCaracter";		public static var SCRIPTERCARACTER							:String	= "scripterCaracter";
		public static var PLAYERXPOS								:Number = 500;		public static var PLAYERYPOS								:Number = 620;		public static var PLAYERMAXLEFT								:Number = 50;		public static var PLAYERMAXRIGHT							:Number = 750;		//actor3D
		// Actors
		public static var ACTOR2D									:String = "actor2d";
		public static var ACTOR2DPROJECTILESPEED					:Number = 10;		public static var ACTOR2DPROJECTILEDAMAGE					:Number = 3;		public static var ACTOR2DPROJECTILERELOADSPEED				:Number = 400;
				public static var ACTOR3D									:String = "actor3d";
		public static var ACTOR3DPROJECTILESPEED					:Number = 5;		public static var ACTOR3DPROJECTILEDAMAGE					:Number = 5;		public static var ACTOR3DPROJECTILERELOADSPEED				:Number = 1000;
				public static var ACTORPRO									:String = "actorpro";
		public static var ACTORPROPROJECTILESPEED					:Number = 20;		public static var ACTORPROPROJECTILEDAMAGE					:Number = 2.5;		public static var ACTORPROPROJECTILERELOADSPEED				:Number = 600;		// Enemys
		// Deathline
		public static var DEATHLINESTARTHEIGHT						:Number = 60;		public static var DEATHLINEMOVESPEED						:Number = 0.06;		public static var DEATHLINEMOVESPEEDINCREASERATE			:Number = 0.0;
		//castle
		public static var CASTLEHEIGHT								:Number = 730;
		
		// Bug
		public static var SHAPESHIFTERNAME							:String = "shapeshifter";
		public static var SHAPESHIFTERHP							:Number = 5;
		public static var SHAPESHIFTERMOVESPEED						:Number = 1;
		public static var SHAPESHIFTERSCORE							:Number = 10;
		public static var SHAPESHIFTERPROJECTILESPEED				:Number = 6;		public static var SHAPESHIFTERMINSHOOTWAIT					:Number = 7500;		public static var SHAPESHIFTERMAXSHOOTWAIT					:Number = 2000;		public static var SHAPESHIFTERMAXONSCREEN					:Number = 7;		// bugProjectile
		public static var SHAPESHIFTERPROJECTILEDAMAGE				:Number = 1;
		
				// orbs
		public static var ORBMOVESPEED								:Number = 1;		public static var ORBMAX									:Number = 10;		public static var ORBSPAWNTIMER								:Number = 6000;		public static var ORBXP										:Number = 5;
	}
}
