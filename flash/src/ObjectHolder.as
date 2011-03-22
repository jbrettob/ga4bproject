package 
{
	import objects.Orb;

	import player.Player;

	import com.jbrettob.display.Actor;
	import com.jbrettob.display.Projectile;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * @author Rene Zwaan
	 * @info this clas is made for coliton detection
	 * it holds all objects in the group they belong so
	 * you can get a colition test on all of them
	 * 
	 */
	public class ObjectHolder extends MovieClip
	{
		private var _player						:Player;
		private var _enemys						:Array;		private var _enemyProjectiles			:Array;
		private var _orbs						:Array;		private var _playerProjectiles			:Array;
		
		private var updateTimer					:Timer;
		
		public function ObjectHolder():void
		{
			_enemys 								= new Array();			_enemyProjectiles 						= new Array();
			_orbs 									= new Array();
			_playerProjectiles						= new Array();

			updateTimer = new Timer(GameSetings.GAMESPEED);
			updateTimer.addEventListener(TimerEvent.TIMER, update);
			updateTimer.start();
		}

		private function update(event : Event) : void
		{
			trace((parent as Game).gameState);
			checkPoused();
		}
		
		private function checkPoused():void
		{
			if ((parent as Game).gameState == GameSetings.PAUSE)
			{
				for each (var iStop : Actor in _enemys)
				{
					if(iStop.timer) iStop.timer.stop();	
				}

				for each (var es : Projectile in _enemyProjectiles)
				{
					if(es.timer) es.timer.stop();	
				}
				for each (var os : Orb in _orbs)
				{
					if(os.timer) os.timer.stop();	
				}
				for each (var pps : Projectile in _playerProjectiles)
				{
					if(pps.timer) pps.timer.stop();	
				}
				(parent as Game).gameState = GameSetings.PAUSED;
			}

			if ((parent as Game).gameState == GameSetings.UNPOUSED)
			{
				for each (var i : Actor in _enemys)
				{
					if (i.timer) i.timer.start();	
				}

				for each (var e : Projectile in _enemyProjectiles)
				{
					if (e.timer) e.timer.start();	
				}
				for each (var o : Orb in _orbs)
				{
					if (o.timer) o.timer.start();	
				}
				for each (var pp : Projectile in _playerProjectiles)
				{
					if (pp.timer) pp.timer.start();	
				}
				(parent as Game).gameState = GameSetings.PLAYING;
			}
		}
		
		//Enemy
		public function addEnemy(_enemy:*):void
		{
			_enemys.push(_enemy);
		}
		
		public function removeEnemy(_enemy:*):void
		{
			_enemys.splice(_enemy,1);
		}
		
		public function clearEnemys():void
		{
			for each (var i : Actor in  this._enemys)
			{
				if (this.contains(i))
				{
					this.removeChild(i);
				}
				
				i.destroy();
			}
			
			_enemys.splice(0,_enemys.length);
		}
		
		//player projectiles
		public function addplayerProjectiles(projectile:Projectile):void {
			_playerProjectiles.push(projectile);
		}
		
		public function removePlayerProjectiles(projectile:Projectile):void
		{
			if (this.contains(projectile)) this.removeChild(projectile);
			_playerProjectiles.splice(projectile,0);
		}
		
		public function clearPlayerProjectiles():void
		{
			for each (var i : Projectile in  this._playerProjectiles)
			{
				if (this.contains(i))
				{
					if (this.contains(i)) this.removeChild(i);
				}
				
				i.destroy();
			}
			
			_playerProjectiles.splice(0,_playerProjectiles.length);
		}
		
		//enemy projectiles
		public function addEnemyProjectiles(projectile:Projectile):void
		{
			_enemyProjectiles.push(projectile);
		}
		
		public function removeEnemyProjectiles(projectile:Projectile):void
		{
			_enemyProjectiles.splice(projectile,1);
		}
		public function clearEnemyProjectiles():void
		{
			for each (var i : Projectile in  this._enemyProjectiles)
			{
				if (this.contains(i))
				{
					this.removeChild(i);
				}
				
				i.destroy();
			}
			_enemyProjectiles.splice(0,_enemyProjectiles.length);
		}
		
		// Orbs 
		public function addOrb(_Orb:*):void 
		{
			_orbs.push(_Orb);
		}
		
		public function removeOrb(_Orb:*):void 
		{
			_orbs.splice(_Orb, 0);
		}
	
		public function clearOrbs():void
		{
			for each (var i : Actor in  this._orbs)
			{
				if (this.contains(i))
				{
					this.removeChild(i);
				}
				
				i.destroy();
			}
			
			_orbs.splice(0,_orbs.length);
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
			_enemys 								= null;
			_enemyProjectiles 						= null;
			_orbs 									= null;
			_playerProjectiles						= null;
			
			//Remove events
		}

		public function get enemys() : Array {
			return _enemys;
		}

		public function set enemys(enemys : Array) : void {
			_enemys = enemys;
		}

		public function get enemyProjectiles() : Array {
			return _enemyProjectiles;
		}

		public function set enemyProjectiles(enemyProjectiles : Array) : void {
			_enemyProjectiles = enemyProjectiles;
		}

		public function get orbs() : Array {
			return _orbs;
		}

		public function set orbs(orbs : Array) : void {
			_orbs = orbs;
		}

		public function get playerProjectiles() : Array {
			return _playerProjectiles;
		}

		public function set playerProjectiles(playerProjectiles : Array) : void {
			_playerProjectiles = playerProjectiles;
		}

		public function get player() : Player {
			return _player;
		}

		public function set player(output : Player) : void
		{
			_player = output;
		}
	}
}
