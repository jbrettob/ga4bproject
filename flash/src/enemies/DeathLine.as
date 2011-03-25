package enemies
{
	import com.greensock.TweenMax;

	import objects.Hud;

	import com.greensock.TweenLite;
	import com.jbrettob.display.Actor;
	import com.jbrettob.log.Log;

	/**
	 * @author Rene Zwaan
	 */
	public class DeathLine extends Actor
	{
		private var dl : ActorDeadLine;
		private var _inputHandler : InputHandler;
		private var moveDownSpeed : Number;

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
			if ((parent as Game).gameState != GameSetings.PAUSED)
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

		private function input() : void
		{
			if (_inputHandler.spaceBarr == "down")
			{
				if (Hud.getInstance().upgradeTimer)
				{
					if (Hud.getInstance().upgradeTimer.canUse == true)
					{
						TweenLite.to(this, 1, {y:20, overwrite:false});
						Hud.getInstance().upgradeTimer.useUpgrade();
					}
				}
			}
		}
	}
}
