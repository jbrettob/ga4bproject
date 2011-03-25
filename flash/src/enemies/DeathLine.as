package enemies
{
	import com.jbrettob.log.Log;
	import objects.Hud;

	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.jbrettob.display.Actor;

	/**
	 * @author Rene Zwaan
	 */
	public class DeathLine extends Actor
	{
		private var dl : ActorDeadLine;
		private var _inputHandler : InputHandler;
		private var moveDownSpeed : Number;
		private var movingBackUp : Boolean;

		public function DeathLine(__inputHandler : InputHandler) : void
		{
			_inputHandler = __inputHandler;

			super();
		}

		override public function init() : void
		{
			dl = new ActorDeadLine();
			this.addChild(dl);
			this.y = GameSetings.DEATHLINESTARTHEIGHT;
			moveDownSpeed = GameSetings.DEATHLINEMOVESPEED;
			super.init();
		}

		override public function update() : void
		{
			if (parent)
			{
				if ((parent as Game).gameState != GameSetings.PAUSED && movingBackUp == false) ;
				{
					if (!TweenMax.isTweening(this))
					{
						dl.y += moveDownSpeed;
						moveDownSpeed += GameSetings.DEATHLINEMOVESPEEDINCREASERATE;
						input();
	
						super.update();
					}
				}
			}

			// if(movingBackUp) tweenUp();
		}

		private	function input() : void
		{
			if (_inputHandler.spaceBarr == "down")
			{
				if (Hud.getInstance().upgradeTimer)
				{
					if (Hud.getInstance().upgradeTimer.canUse == true)
					{
						TweenLite.to(this.dl, 1, {y:20, overwrite:false});
						Hud.getInstance().upgradeTimer.useUpgrade();
					}
				}
			}
		}

		override public function destroy() : void
		{
			if (dl)
			{
				removeChild(dl);
				dl = null;
			}
			super.destroy();
		}
	}
}
