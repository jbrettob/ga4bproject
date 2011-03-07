package enemies
{
	import flash.display.MovieClip;

	/**
	 * @author Rene Zwaan
	 */
	public class Enemy extends MovieClip
	{
		private var health:Number;
		private var alife:Boolean = true;
		private var moveSpeed:Number;
		private var Enemyname:String;

		public function Enemy():void
		{
		}

		public function get _moveSpeed():Number
		{
			return moveSpeed;
		}

		public function set _moveSpeed(moveSpeed:Number):void
		{
			this.moveSpeed = moveSpeed;
		}

		public function get _name():String
		{
			return Enemyname;
		}

		public function set _name(_name:String):void
		{
			this.Enemyname = _name;
		}

		public function get _health():Number
		{
			return health;
		}

		public function set _health(health:Number):void
		{
			this.health = health;
		}

		public function get _alife():Boolean
		{
			return alife;
		}

		public function set _alife(alife:Boolean):void
		{
			this.alife = alife;
		}
	}
}
