package enemies
{
	import objects.Hud;

	import com.greensock.TweenLite;
	import com.jbrettob.display.Actor;
	import com.jbrettob.log.Log;

	/**
	 * @author Rene Zwaan
	 */
	public class DeathLine extends Actor
	{
		private var dl:ActorDeadLine;
		private var _inputHandler:InputHandler;		private var moveDownSpeed:Number;

		public function DeathLine(__inputHandler:InputHandler):void
		{
			_inputHandler = __inputHandler;
			
			super();
		}
		
		
		override public function init():void
		{
			dl = new ActorDeadLine();
			this.addChild(dl);
			this.y = GameSetings.DEATHLINESTARTHEIGHT;
			moveDownSpeed = GameSetings.DEATHLINEMOVESPEED;
			super.init();
		}

		override public function update():void
		{
			if ((parent as Game).gameState != GameSetings.PAUSED)
			{
				dl.y += moveDownSpeed;
				moveDownSpeed += GameSetings.DEATHLINEMOVESPEEDINCREASERATE;
				input();
				
				super.update();
			}
		}

		private function input():void
		{
			if (_inputHandler.spaceBarr == "down")
			{
				
						Log.log("spacebar got pressed", this);
				if (Hud.getInstance().upgradeTimer)
				{						Log.log(Hud.getInstance().upgradeTimer.canUse.toString(), this);
					if (Hud.getInstance().upgradeTimer.canUse == true)
					{						Log.log("shold move up now", this);
						Hud.getInstance().upgradeTimer.useUpgrade();
						TweenLite.to(this, 1, {y:20, overwrite:true});
						moveDownSpeed = GameSetings.DEATHLINEMOVESPEED;
					}
				}
			}
		}
	}
}
