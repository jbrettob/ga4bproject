package 
{
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 * @info this clas is made for coliton detection
	 * it holds all objects in the group they belong so
	 * you can get a colition test on all of them
	 * 
	 */
	public class ObjectHolder extends MovieClip
	{
		public static var enemys					:Array;		public static var enemyProjectiles			:Array;
		public static var orbs						:Array;		public static var playerProjectiles			:Array;
		
		public function ObjectHolder():void
		{
			enemys 									= new Array();			enemyProjectiles 						= new Array();
			orbs 									= new Array();
			playerProjectiles						= new Array();
		}
		
		//Enemy
		public function addEnemy(_enemy:*):void
		{
			enemys.push(_enemy);
		}
		
		public function removeEnemy(_enemy:*):void
		{
			enemys.splice(_enemy,1);
		}
		
		public function clearEnemys():void
		{
			enemys.splice(0,enemys.length);
		}
		
		//player projectiles
		public function addplayerProjectiles(_playerProjectiles:*):void {
			playerProjectiles.push(_playerProjectiles);
		}
		
		public function removePlayerProjectiles(_playerProjectiles:*):void {
			playerProjectiles.splice(_playerProjectiles, 1);
		}
		
		public function clearPlayerProjectiles():void
		{
			playerProjectiles.splice(0,playerProjectiles.length);
		}
		
		//enemy projectiles
		 public function addEnemyProjectiles(_playerProjectiles:*):void
		{
			enemys.push(_playerProjectiles);
		}
		
		public function removeEnemyProjectiles(_playerProjectiles:*):void
		{
			enemys.splice(_playerProjectiles,1);
		}
		public function clearEnemyProjectiles():void
		{
			enemyProjectiles.splice(0,enemyProjectiles.length);
		}
		
		// Orbs 
		public function addOrb(_Orb:*):void 
		{
			orbs.push(_Orb);
		}
		
		public function removeOrb(_Orb:*):void 
		{
			orbs.splice(_Orb, 1);
		}
	
		public function clearOrbs():void
		{
			orbs.splice(0,orbs.length);
		}
		
		/**
		 * @info clears
		 * - enemy
		 * - enemyProjectile
		 * - orbs
		 * - playerProjectiles
		 */
		public function clearAll():void
		{
			clearEnemys();
			clearEnemyProjectiles();
			clearOrbs();
			clearPlayerProjectiles();
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
			playerProjectiles					= null;
			
			//Remove events
			
		}
	}
}
