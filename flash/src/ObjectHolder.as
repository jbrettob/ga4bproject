package
{
	import player.Player;

	import com.jbrettob.display.Actor;
	import com.jbrettob.display.Projectile;
	import com.jbrettob.log.Log;

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
		private var _player:Player;
		private var _enemys:Array;
		private var _enemyProjectiles:Array;
		private var _orbs:Array;
		private var _playerProjectiles:Array;
		private var _gameState:String;
		private var _parent:Game;
		private var updateTimer:Timer;

		public function ObjectHolder(parrent:Game):void
		{
			_parent = parrent;
			_enemys = new Array();
			_enemyProjectiles = new Array();
			_orbs = new Array();
			_playerProjectiles = new Array();

			updateTimer = new Timer(GameSetings.GAMESPEED);
			updateTimer.addEventListener(TimerEvent.TIMER, update);
			updateTimer.start();
		}

		private function update(event:Event):void
		{
			_gameState = (parent as Game).gameState;
			if (gameState != (parent as Game).gameState)
			{
				Log.log(gameState, this);
			}
		}

		// Enemy
		public function addEnemy(_enemy:*):void
		{
			_enemys.push(_enemy);
		}

		public function removeEnemy(_enemy:*):void
		{
			if (_enemys) _enemys.splice(_enemy, 1);
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

			if (_enemys) _enemys.splice(0, _enemys.length);
		}

		// player projectiles
		public function addplayerProjectiles(projectile:Projectile):void
		{
			if (_playerProjectiles) _playerProjectiles.push(projectile);
		}

		public function removePlayerProjectiles(projectile:Projectile):void
		{
			if (this.contains(projectile)) this.removeChild(projectile);
			if (_playerProjectiles) _playerProjectiles.splice(projectile, 0);
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

			if (_playerProjectiles) _playerProjectiles.splice(0, _playerProjectiles.length);
		}

		// enemy projectiles
		public function addEnemyProjectiles(projectile:Projectile):void
		{
			if (_enemyProjectiles) _enemyProjectiles.push(projectile);
		}

		public function removeEnemyProjectiles(projectile:Projectile):void
		{
			if (_enemyProjectiles) _enemyProjectiles.splice(projectile, 0);
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
			if (_enemyProjectiles) _enemyProjectiles.splice(0, _enemyProjectiles.length);
		}

		// Orbs
		public function addOrb(_Orb:*):void
		{
			if (_orbs) _orbs.push(_Orb);
		}

		public function removeOrb(_Orb:*):void
		{
			if (_orbs) _orbs.splice(_Orb, 1);
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

			if (_orbs) _orbs.splice(0, _orbs.length);
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
			_enemys = null;
			_enemyProjectiles = null;
			_orbs = null;
			_playerProjectiles = null;

			// Remove events
			if (this.updateTimer)
			{
				updateTimer.removeEventListener(TimerEvent.TIMER, update);
				updateTimer.stop();
				updateTimer = null;
			}
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
