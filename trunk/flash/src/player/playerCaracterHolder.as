package player
{
	import com.jbrettob.enum.Sounds;
	import com.jbrettob.media.sound.SoundChannelKing;
	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * @author Rene Zwaan
	 */
	public class playerCaracterHolder extends MovieClip
	{
		private var actor2D : Actor2D;
		private var actor3D : Actor3D;
		private var actorPro : ActorPro;
		private var _currentCaracter : String = GameSetings.ACTOR3D;
		private var _currentAnimation : String = "idle";

		public function playerCaracterHolder() : void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		}

		private function handleAddedToStage(event : Event) : void
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

		public function changeCaracterTo(_name : String) : void
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
						_currentCaracter = GameSetings.ACTOR3D;
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
				
				SoundChannelKing.getInstance().playSound(Sounds.SOUND_CHARACTERSWITCH);
			}
		}

		public function changeAnimation(animation : String) : void
		{
			if (_currentAnimation != animation)
			{
				switch(animation)
				{
					case "runLeft":
						{
						actor3D.gotoAndPlay("run");
						actor3D.scaleX = -1;
						actor2D.gotoAndPlay("run");
						actor2D.scaleX = -1;
						actorPro.gotoAndPlay("run");
						actorPro.scaleX = -1;
						_currentAnimation = animation;
						break;
						}
					case "runRight":
						{
						actor3D.gotoAndPlay("run");
						actor3D.scaleX = 1;
						actor2D.gotoAndPlay("run");
						actor2D.scaleX = 1;
						actorPro.gotoAndPlay("run");
						actorPro.scaleX = 1;
						_currentAnimation = animation;
						break;
						}
					case "idle":
						{
						actor3D.gotoAndPlay("idle");
						actor3D.scaleX = 1;
						actor2D.gotoAndPlay("idle");
						actor2D.scaleX = 1;
						actorPro.gotoAndPlay("idle");
						actorPro.scaleX = 1;
						_currentAnimation = animation;
						break;
						}
					case "fireRunLeft":
						{
						actor3D.gotoAndPlay("atackMoving");
						actor3D.scaleX = -1;
						actor2D.gotoAndPlay("atackMoving");
						actor2D.scaleX = -1;
						actorPro.gotoAndPlay("atackMoving");
						actorPro.scaleX = -1;
						_currentAnimation = animation;
						break;
						}
					case "fireRunRight":
						{
						actor3D.gotoAndPlay("atackMoving");
						actor3D.scaleX = 1;
						actor2D.gotoAndPlay("atackMoving");
						actor2D.scaleX = 1;
						actorPro.gotoAndPlay("atackMoving");
						actorPro.scaleX = 1;
						_currentAnimation = animation;
						break;
						}
					case "fire":
						{
						actor3D.gotoAndPlay("atack");
						actor3D.scaleX = 1;
						actor2D.gotoAndPlay("atack");
						actor2D.scaleX = 1;
						actorPro.gotoAndPlay("atack");
						actorPro.scaleX = 1;
						_currentAnimation = animation;
						break;
						}
				}
			}
		}

		public function destroy() : void
		{
			while (numChildren > 0)
			{
				removeChildAt(0);
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
