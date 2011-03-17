package enemies
{
	import objects.Hud;

	import com.greensock.TweenLite;
	import com.jbrettob.display.Actor;

	/**
	 * @author Rene Zwaan
	 */
	public class DeathLine extends Actor
	{
		private var dl:ActorDeadLine;
		private var _inputHandler:InputHandler;

		public function DeathLine(__inputHandler:InputHandler):void
		{
			_inputHandler = __inputHandler;
			
			super();
		}
		
		
		override public function init():void
		{
			dl = new ActorDeadLine();
			this.addChild(dl);
			this.y += 20;
			
			super.init();
		}

		override public function update():void
		{
			this.y += 0.05;
			input();
			
			super.update();
		}

		private function input():void
		{
			if (_inputHandler.spaceBarr == "down")
			{
				if (Hud.getInstance().upgradeTimer)
				{
					if (Hud.getInstance().upgradeTimer.canUse == true)
					{
						Hud.getInstance().upgradeTimer.useUpgrade();
						TweenLite.to(this, 1, {y:20, overwrite:true});
					}
				}
			}
		}
	}
}
