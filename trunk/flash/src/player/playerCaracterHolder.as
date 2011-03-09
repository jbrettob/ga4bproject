package player 
{
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 */
	public class playerCaracterHolder extends MovieClip
	{
		private var actor2D:Actor2D;		private var actor3D:Actor3D;		private var actorPro:ActorPro;
		private var _currentCaracter:String = "actor3d";
			
		public function playerCaracterHolder():void 
		{
			actor2D = new Actor2D();			actor3D = new Actor3D();			actorPro = new ActorPro();

			addChild(actor2D);			addChild(actor3D);			addChild(actorPro);

			actor2D.visible = false;
			actorPro.visible = false;
		}
		
		public function changeCaracterTo(_name:String):void
		{
			switch(_name)
			{
				case "actor2d":
				{
					actor2D.visible = true;
					actor3D.visible = false;
					actorPro.visible = false;
					_currentCaracter = _name;
					break;
				}
				case "actor3d":
				{
					actor2D.visible = false;
					actor3D.visible = true;
					actorPro.visible = false;
					_currentCaracter = _name;
					break;
				}
				case "actorpro":
				{
					actor3D.visible = false;
					actor2D.visible = false;
					actorPro.visible = true;
					_currentCaracter = _name;
					break;
				}
			}
		}

		public function get currentCaracter() : String
		{
			return _currentCaracter;
		}

		public function set currentCaracter(currentCaracter : String) : void
		{
			_currentCaracter = currentCaracter;
		}
	}
}
