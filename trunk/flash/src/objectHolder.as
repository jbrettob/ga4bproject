package 
{
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 * @todo orbs holder
	 * @
	 */
	public class objectHolder extends MovieClip
	{
		public static var enemys					:Array;		public static var enemyProjectiles			:Array;
		
		public function objectHolder():void
		{
			enemys 									= new Array();			enemyProjectiles 						= new Array();
		}
		/**
		 * @todo clear the enemys array
		 */
		public function clearEnemys():void
		{
			
		}
		
		/**
		 * @todo clear the enemyProjectiles array
		 */
		public function clearEnemyProjectiles():void
		{
			
		}
		
		/**
		 * @info clears the enemy abd the enemyProjectile
		 */
		public function clearAll():void
		{
			clearEnemys();
			clearEnemyProjectiles();
		}
		
		/**
		 * @todo remove all events and children from this class
		 */
		public function removeGame():void
		{
			clearAll();
			enemys 								= null;
			enemyProjectiles 					= null;
			//Remove events
			
		}
	}
}
