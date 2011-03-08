package enemies 
{
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 */
	public class Enemy extends MovieClip
	{
		private var _health:Number;
		private var _alife:Boolean = true;
		private var _moveSpeed:Number;
		
		
		public function Enemy():void
		{
			
		}

		public function get moveSpeed() : Number 
		{
			return _moveSpeed;
		}

		public function set moveSpeed(moveSpeed : Number) : void {
			this._moveSpeed = moveSpeed;
		}

		public function get health() : Number {
			return _health;
		}

		public function set health(health : Number) : void {
			this._health = health;
		}

		public function get alife() : Boolean {
			return _alife;
		}

		public function set alife(alife : Boolean) : void {
			this._alife = alife;
		}

	}
}
