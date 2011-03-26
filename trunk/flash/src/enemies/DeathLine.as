package enemies
{
	import objects.Hud;

	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.jbrettob.display.Actor;

	/**
	 * @author Rene Zwaan
	 */
	public class DeathLine extends Actor
	{
		private var _dl : ActorDeadLine;
		private var _inputHandler : InputHandler;
		private var _moveDownSpeed:Number;
		private var _canMove:Boolean = false;

		public function DeathLine(__inputHandler : InputHandler) : void
		{
			_inputHandler = __inputHandler;

			super();
		}

		override public function init() : void
		{
			this._dl = new ActorDeadLine();
			this.addChild(this._dl);
			this.y = GameSetings.DEATHLINESTARTHEIGHT;
			this._moveDownSpeed = GameSetings.DEATHLINEMOVESPEED;
			super.init();
		}

		override public function update() : void
		{
			if (parent)
			{
				if (this.gameState != GameSetings.PAUSED)
				{
					if (!TweenMax.isTweening(this) && this._canMove)
					{
						this.y += this._moveDownSpeed;
						this._moveDownSpeed += GameSetings.DEATHLINEMOVESPEEDINCREASERATE;
						input();
	
						super.update();
					}
				}
			}

		}

		private	function input() : void
		{
			if (_inputHandler.spaceBarr == "down")
			{
				if (Hud.getInstance().upgradeTimer)
				{
					if (Hud.getInstance().upgradeTimer.canUse == true)
					{
						TweenLite.to(this, 1, {y:GameSetings.DEATHLINESTARTHEIGHT, delay: .6, overwrite:false});
						Hud.getInstance().upgradeTimer.useUpgrade();
						
						this._canMove = false;
						
						if (parent)
						{
							(parent as Game).bgCastle.shoot();
							Game(this.parent).level++;
							Game(this.parent).pauseGamePlay();
						}
					}
				}
			}
		}

		override public function destroy() : void
		{
			super.destroy();
		}

		public function get canMove():Boolean
		{
			return this._canMove;
		}

		public function set canMove(value:Boolean):void
		{
			this._canMove = value;
		}
	}
}
