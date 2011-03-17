package com.jbrettob.enum
{
	import objects.Hud;
	/**
	 * @author jaycerettob
	 */
	public class DataManager
	{
		private static var _instance:DataManager;
		
		private var _lives:Number;
		private var _score:Number;
		
		public function DataManager():void
		{
			if (_instance) new Error("Singleton use DataManager.getInstance()");
		}
		
		static public function getInstance():DataManager
		{
			if (!_instance)
			{
				_instance = new DataManager();
			}
			
			return _instance;
		}

		public function get lives():Number
		{
			return this._lives;
		}

		public function set lives(value:Number):void
		{
			this._lives = value;
			
			Hud.getInstance().lives = this.lives;
		}

		public function get score():Number
		{
			return this._score;
		}

		public function set score(value:Number):void
		{
			this._score = value;
			
			Hud.getInstance().lives = this._score;
		}
		
	}
}
