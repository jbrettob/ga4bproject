package enemies {
	import objects.UpgradeTimer;
	import objects.Hud;
	import com.jbrettob.display.Actor;
	/**
	 * @author Rene Zwaan
	 */
	public class DeathLine extends Actor
	{
		private var dl:ActorDeadLine;
		private var _inputHandler:InputHandler;
		private var _upgradeTimer:UpgradeTimer;
		
		public function DeathLine(__inputHandler:InputHandler,__hud:UpgradeTimer):void
		{
			_inputHandler = __inputHandler;
			_upgradeTimer = __hud;
			dl = new ActorDeadLine();
			this.addChild(dl);
			this.y += 20;
		}
		override public function update():void
		{
			this.y += 0.1;
			input();
			super.update();
		}

		private function input() : void 
		{
	
			if(_inputHandler.spaceBarr == "down")
			{
				if(_upgradeTimer != null)
				{
				if(_upgradeTimer.canUse == true)
				{
					_upgradeTimer.useUpgrade();
					this.y -= 20;
				}
				}
				else{_upgradeTimer = (parent as Main).hud.upgradeTimer;}
			}
		}
	}
}
