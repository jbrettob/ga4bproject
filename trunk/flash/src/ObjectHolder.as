package 
{
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 * @todo orbs holder
	 * @
	 */
	public class ObjectHolder extends MovieClip
	{
		public static var enemys					:Array;		public static var enemyProjectiles			:Array;
		public static var orbs						:Array;
		
		public function ObjectHolder():void
		{
			enemys 									= new Array();			enemyProjectiles 						= new Array();
			orbs 									= new Array();
		}
		
		public function addEnemy(_enemy:*):void
		{
			enemys.push(_enemy);
		}
		
		public function removeEnemy(_enemy:*):void
		{
			enemys.splice(_enemy,1);
		}
		/**
		 * @todo needs testing
		 */
		public function clearEnemys():void
		{
			enemys.splice(0,enemys.length);
		}
		
		/**
		 * @todo needs testing
		 */
		public function clearEnemyProjectiles():void
		{
			enemyProjectiles.splice(0,enemyProjectiles.length);
		}
		/**
		 * @todo needs to be tested
		 */
		public function clearOrbs():void
		{
			orbs.splice(0,orbs.length);
		}
		
		/**
		 * @info clears the enemy and the enemyProjectile and the orbs
		 */
		public function clearAll():void
		{
			clearEnemys();
			clearEnemyProjectiles();
			clearOrbs();
		}
		
		/**
		 * @todo remove all events and children from this class
		 */
		public function removeGame():void
		{
			clearAll();
			enemys 								= null;
			enemyProjectiles 					= null;
			orbs 								= null;
			
			//Remove events
			
		}
	}
}
