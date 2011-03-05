package enemies 
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	/**
	 * @author Rene Zwaan
	 */
	public class Enemy extends MovieClip
	{
		private var health:Number;
		private var alife:Boolean;
		private var updateTimer:Timer;
		private var moveSpeed:Number;
		private var Enemyname:String;
		
		
		public function Enemy():void
		{
		}

		public function get _moveSpeed() : Number 
		{
			return moveSpeed;
		}

		public function set _moveSpeed(moveSpeed : Number) : void {
			this.moveSpeed = moveSpeed;
		}

		public function get _name() : String {
			return Enemyname;
		}

		public function set _name(_name : String) : void {
			this.Enemyname = _name;
		}

	}
}
