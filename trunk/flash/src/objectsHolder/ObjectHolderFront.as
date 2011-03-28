package objectsHolder
{
	import player.Player;

	import com.jbrettob.display.Actor;
	import com.jbrettob.display.Projectile;

	import flash.display.MovieClip;

	/**
	 * @author Rene Zwaan
	 * @info this class is made for collision detection
	 * it holds all objects in the group they belong so
	 * you can get a collision check on all of them
	 * 
	 */
	public class ObjectHolderFront extends MovieClip
	{
		private var _player:Player;
		private var _enemys:Array;
		private var _enemyProjectiles:Array;
		private var _orbs:Array;
		private var _playerProjectiles:Array;
		private var _gameState:String;
		private var _parent:Game;

		public function ObjectHolderFront(value:Game):void
		{
			this._parent = value;
			this._enemyProjectiles = new Array();
			this._orbs = new Array();
			this._playerProjectiles = new Array();
		}

		// Enemy
		public function addEnemy(_enemy:*):void
		{
			this._enemys.push(_enemy);
		}

		public function removeEnemy(_enemy:*):void
		{
			if (this._enemys) this._enemys.splice(_enemy, 1);
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

			if (this._enemys) this._enemys.splice(0, this._enemys.length);
		}

		// player projectiles
		public function addplayerProjectiles(projectile:Projectile):void
		{
			if (this._playerProjectiles) this._playerProjectiles.push(projectile);
		}

		public function removePlayerProjectiles(projectile:Projectile):void
		{
			if (this.contains(projectile)) this.removeChild(projectile);
			if (this._playerProjectiles) this._playerProjectiles.splice(projectile, 0);
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

			if (this._playerProjectiles) this._playerProjectiles.splice(0, this._playerProjectiles.length);
		}

		// enemy projectiles
		public function addEnemyProjectiles(projectile:Projectile):void
		{
			if (this._enemyProjectiles) this._enemyProjectiles.push(projectile);
		}

		public function removeEnemyProjectiles(projectile:Projectile):void
		{
			if (this._enemyProjectiles) this._enemyProjectiles.splice(projectile, 0);
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
			if (this._enemyProjectiles) this._enemyProjectiles.splice(0, this._enemyProjectiles.length);
		}

		// Orbs
		public function addOrb(_Orb:*):void
		{
			if (this._orbs) this._orbs.push(_Orb);
		}

		public function removeOrb(_Orb:*):void
		{
			if (this._orbs) this._orbs.splice(_Orb, 1);
		}

		public function clearOrbs():void
		{
			for each (var i : Actor in  this._orbs)
			{
				if (this.contains(i))
				{
//					this.removeChild(i);
				}

				i.destroy();
			}

			if (this._orbs) this._orbs.splice(0, this._orbs.length);
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
			this.clearEnemys();
			this.clearEnemyProjectiles();
			this.clearOrbs();
			this.clearPlayerProjectiles();
		}

		/**
		 * @todo remove all events and children from this class
		 */
		public function removeGame():void
		{
			this.clearAll();
			this._enemys = null;
			this._enemyProjectiles = null;
			this._orbs = null;
			this._playerProjectiles = null;
		}

		public function get enemys():Array
		{
			return _enemys;
		}

		public function set enemys(enemys:Array):void
		{
			_enemys = enemys;
		}

		public function get enemyProjectiles():Array
		{
			return _enemyProjectiles;
		}

		public function set enemyProjectiles(enemyProjectiles:Array):void
		{
			_enemyProjectiles = enemyProjectiles;
		}

		public function get orbs():Array
		{
			return _orbs;
		}

		public function set orbs(orbs:Array):void
		{
			_orbs = orbs;
		}

		public function get playerProjectiles():Array
		{
			return _playerProjectiles;
		}

		public function set playerProjectiles(playerProjectiles:Array):void
		{
			_playerProjectiles = playerProjectiles;
		}

		public function get player():Player
		{
			return _player;
		}

		public function set player(output:Player):void
		{
			_player = output;
		}

		public function get gameState():String
		{
			return _gameState;
		}

		public function set gameState(gameState:String):void
		{
			_gameState = gameState;
		}

		public function get __parent():Game
		{
			return _parent;
		}

		public function set __parent(parent:Game):void
		{
			_parent = parent;
		}
	}
}
