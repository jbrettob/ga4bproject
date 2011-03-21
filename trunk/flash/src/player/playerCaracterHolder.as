package player 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 */
	public class playerCaracterHolder extends MovieClip
	{
		private var actor2D:Actor2D;		private var actor3D:Actor3D;		private var actorPro:ActorPro;
		private var _currentCaracter:String = GameSetings.ACTOR3D;
			
		public function playerCaracterHolder():void 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
			
			actor2D = new Actor2D();
			actor3D = new Actor3D();
			actorPro = new ActorPro();

			addChild(actor2D);
			addChild(actor3D);
			addChild(actorPro);

			actor2D.visible = false;
			actorPro.visible = false;
		}
		
		public function changeCaracterTo(_name:String):void
		{
			if (_name != _currentCaracter)
			{
				
			switch(_name)
			{
				case GameSetings.ACTOR2D:
				{
					actor2D.visible = true;
					actor3D.visible = false;
					actorPro.visible = false;
					_currentCaracter = GameSetings.ACTOR2D;
					(parent as Player)._shootTimer.delay = GameSetings.ACTOR2DPROJECTILERELOADSPEED;
					break;
				}
				case GameSetings.ACTOR3D:
				{
					actor2D.visible = false;
					actor3D.visible = true;
					actorPro.visible = false;
					_currentCaracter =  GameSetings.ACTOR3D;
					(parent as Player)._shootTimer.delay = GameSetings.ACTOR3DPROJECTILERELOADSPEED;
					break;
				}
				case GameSetings.ACTORPRO:
				{
					actor3D.visible = false;
					actor2D.visible = false;
					actorPro.visible = true;
					_currentCaracter = GameSetings.ACTORPRO;
					(parent as Player)._shootTimer.delay = GameSetings.ACTORPROPROJECTILERELOADSPEED;
					break;
				}
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
