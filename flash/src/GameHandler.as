package
{
	import enemies.ShapeShifter;

	import objects.Hud;
	import objects.Orb;

	import com.greensock.TweenLite;
	import com.jbrettob.display.Actor;
	import com.jbrettob.enum.Sounds;
	import com.jbrettob.log.Log;
	import com.jbrettob.media.sound.SoundChannelKing;

	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Rene Zwaan
	 */
	public class GameHandler extends MovieClip
	{
		private var _updateTimer:Timer;
		private var _objectHolder:ObjectHolder;
		private var _canAddEnemy:Boolean = false;
		private var _canAddEnemyTimer:Timer;
		private var _canAddOrbTimer:Timer;
		private var _gameState:String;
		private var _tutorialEnemyCount:Number = 0;
		private var thisParrent:Game;
		private var hud:Hud;
	

		public function GameHandler(game:Game):void
		{
			this._objectHolder = game.objectHolder;
			
			this._updateTimer = new Timer(GameSetings.GAMESPEED);
			this._updateTimer.addEventListener(TimerEvent.TIMER, this.update);
			this._updateTimer.start();
			thisParrent = game;
			hud = thisParrent.hud;
			
		}

		private function handleAddOrbTimer(event:TimerEvent):void
		{
			if (this._objectHolder.orbs)
			{
				if (this._objectHolder.orbs.length < 10)
				{
					var orb:Orb = new Orb();
					this._objectHolder.addChild(orb);
					this._objectHolder.addOrb(orb);
				}
			}
		}

		private function handleAddEnemyTimer(event:TimerEvent):void
		{
			this._canAddEnemy = true;
		}

		public function createEnemyTimer():void
		{
			this._canAddEnemyTimer = new Timer(1000, 1);
			this._canAddEnemyTimer.addEventListener(TimerEvent.TIMER, this.handleAddEnemyTimer);
			this._canAddEnemyTimer.start();
		}

		public function createOrbTimer():void
		{
			this._canAddOrbTimer = new Timer(GameSetings.ORBSPAWNTIMER, 0);
			this._canAddOrbTimer.addEventListener(TimerEvent.TIMER, this.handleAddOrbTimer);
			this._canAddOrbTimer.start();
		}

		public function update(event:TimerEvent):void
		{
			if (this._gameState != GameSetings.PAUSED)
			{
				inputHandler();
				var i:Number = numChildren;
				while (i > 0)
				{
					if ((getChildAt(i - 1) as Actor).alife == false)
					{
						this._objectHolder.removeEnemy(i);
						removeChildAt(i - 1);
					}
					i--;
				}

				if (this._canAddEnemy)
				{
					if (parent)
					{
						if (Game(this.parent).level >= 1 && Game(this.parent).level < 4)
						{
							if (this._objectHolder.enemys.length <= 1)
							{
								createShapeShifter();
								this._canAddEnemy = false;
								this._canAddEnemyTimer.start();
								this._tutorialEnemyCount++;
								if (this._tutorialEnemyCount >= GameSetings.TUTORIALENEMYCOUNT && Game(this.parent).level == 1)
								{
									Log.log('finished tutorial: aim shoot and destroy', this);
									Game(this.parent).level = 2;
								}
							}
						}
						else if (Game(parent).level >= 5)
						{
							if (this._objectHolder.enemys)
							{
								if (this._objectHolder.enemys.length <= GameSetings.SHAPESHIFTERMAXONSCREEN)
								{
									createShapeShifter();
									this._canAddEnemy = false;
									this._canAddEnemyTimer.start();
								}
							}
						}
					}
				}

				if (parent)
				{
					if ((parent as Game).dl.y >= GameSetings.GAMEHEIGHT - 150)
					{
						(parent as Game).endGame(false);
					}
				}
			}
		}

		private function inputHandler() : void
		{
			
			if ((parent as Game).keyBoard.spaceBarr == "down")
			{
				if ((parent as Game)._hud.upgradeTimer)
				{
					if ((parent as Game)._hud.upgradeTimer.canUse == true)
					{
						thisParrent.dl.shotBack();
						thisParrent.bg.goToNextStage();
					}
				}
			}
		}

		public function createShapeShifter():void
		{
			var shapeShifter:ShapeShifter = new ShapeShifter(this._objectHolder);
			this._objectHolder.addEnemy(shapeShifter);
			shapeShifter.x = Math.random() * GameSetings.PLAYERMAXRIGHT;
			shapeShifter.y = -(Math.random() * 200);
			this._objectHolder.addChild(shapeShifter);
		}

		public function pauseGame():void
		{
			this._updateTimer.stop();
		}

		public function unpauseGame():void
		{
			this._updateTimer.start();
		}

		public function removeThisChild(child:*):void
		{
			this.removeChild(child);
		}

		public function destroy():void
		{
			if (this._canAddEnemyTimer)
			{
				this._canAddEnemyTimer.removeEventListener(TimerEvent.TIMER, this.handleAddEnemyTimer);
				this._canAddEnemyTimer.stop();
			}

			if (this._canAddOrbTimer)
			{
				this._canAddOrbTimer.removeEventListener(TimerEvent.TIMER, this.handleAddOrbTimer);
				this._canAddOrbTimer.stop();
			}

			if (this._updateTimer)
			{
				this._updateTimer.removeEventListener(TimerEvent.TIMER, this.update);
				this._updateTimer.stop();
			}

			TweenLite.killTweensOf(this);
		}

		public function pauseAllTimers():void
		{
			this._canAddEnemyTimer.removeEventListener(TimerEvent.TIMER, this.handleAddEnemyTimer);
			this._canAddOrbTimer.removeEventListener(TimerEvent.TIMER, this.handleAddOrbTimer);
			this._updateTimer.removeEventListener(TimerEvent.TIMER, this.update);

			this._canAddEnemyTimer.stop();
			this._canAddOrbTimer.stop();
			this._updateTimer.stop();

			TweenLite.to(this, 10, {onComplete:this.unPauseAllTimers, overwrite:true});
		}

		private function unPauseAllTimers():void
		{
			this._canAddEnemyTimer.addEventListener(TimerEvent.TIMER, this.handleAddEnemyTimer);
			this._canAddOrbTimer.addEventListener(TimerEvent.TIMER, this.handleAddOrbTimer);
			this._updateTimer.addEventListener(TimerEvent.TIMER, this.update);

			this._canAddEnemyTimer.start();
			this._canAddOrbTimer.start();
			this._updateTimer.start();

			Game(this.parent).dl.canMove = true;
		}

		public function set gameState(value:String):void
		{
			this._gameState = value;
		}
	}
}