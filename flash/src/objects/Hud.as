package objects
{
	import com.jbrettob.log.Log;
	import com.jbrettob.media.sound.SoundChannelKing;

	import flash.display.MovieClip;
	import flash.display.StageQuality;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Jayce Rettob
	 */
	public class Hud extends MovieClip
	{
		private static var _HUD_WIDTH:Number = 0;
		private static var _instance:Hud;
		private var _sprite:Interface_Hud;
		private var _upgradeTimer:UpgradeTimer;
		private var _lives:Number = 3;
		private var _score:Number = 0;

		public function Hud():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		static public function getInstance():Hud
		{
			return _instance;
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);

			_instance = this;

			this.init();
		}

		private function init():void
		{
			this.setupHud();
		}

		private function setupHud():void
		{
			this._sprite = new Interface_Hud();
			this._sprite.x = (GameSetings.GAMEWITH);
			this.addChild(this._sprite);

			_HUD_WIDTH = this._sprite.width;

			this._upgradeTimer = new UpgradeTimer();
			this._upgradeTimer.x = 10;
			this._upgradeTimer.y = ( (GameSetings.GAMEHEIGHT - this._upgradeTimer.height) - 20);

			this.addChild(this._upgradeTimer);

			this.updateLives();
			this.updateScore();
			this.setupDropDownMenu();
		}

		private function setupDropDownMenu():void
		{
			if (this._sprite)
			{
				this._sprite.mcDropDownMenu.gotoAndStop('closed');
				this._sprite.mcDropDownMenu.mcMenu.gotoAndStop('menu');
				this._sprite.mcDropDownMenu.mcMusic.gotoAndStop('music');
				this._sprite.mcDropDownMenu.mcSound.gotoAndStop('sound');
				this._sprite.mcDropDownMenu.mcQuality.gotoAndStop('quality');

				this._sprite.mcDropDownMenu.mcMenu.buttonMode = true;
				this._sprite.mcDropDownMenu.mcMusic.buttonMode = true;
				this._sprite.mcDropDownMenu.mcSound.buttonMode = true;
				this._sprite.mcDropDownMenu.mcQuality.buttonMode = true;

				this._sprite.mcDropDownMenu.mcMenu.mouseChildren = false;
				this._sprite.mcDropDownMenu.mcMusic.enabled = this._sprite.mcDropDownMenu.mcMusic.visible = this._sprite.mcDropDownMenu.mcMusic.mouseChildren = false;
				this._sprite.mcDropDownMenu.mcSound.enabled = this._sprite.mcDropDownMenu.mcSound.visible = this._sprite.mcDropDownMenu.mcSound.mouseChildren = false;
				this._sprite.mcDropDownMenu.mcQuality.enabled = this._sprite.mcDropDownMenu.mcQuality.visible = this._sprite.mcDropDownMenu.mcQuality.mouseChildren = false;

				this._sprite.mcDropDownMenu.addEventListener(MouseEvent.CLICK, this.handleDropDownClick);
				this._sprite.mcDropDownMenu.addEventListener(MouseEvent.ROLL_OVER, this.handleDropDownRollOver);
				this._sprite.mcDropDownMenu.addEventListener(MouseEvent.ROLL_OUT, this.handleDropDownRollOut);
			}
		}

		private function handleDropDownClick(event:MouseEvent):void
		{
			switch (event.target)
			{
				case this._sprite.mcDropDownMenu.mcMenu:
					this.showMenu();
					break;
				case this._sprite.mcDropDownMenu.mcMusic:
					SoundChannelKing.getInstance().muteALlMusic();
					break;
				case this._sprite.mcDropDownMenu.mcSound:
					SoundChannelKing.getInstance().muteALlSound();
					break;
				case this._sprite.mcDropDownMenu.mcQuality:
					this.switchQuality();
					break;
			}
		}

		private function showMenu():void
		{
			this.log('showMenu');
			
			this.dispatchEvent(new Event('POPUP_SHOW_MENU'));
		}

		private function switchQuality():void
		{
			switch (GameSetings.GAMEQUALITY)
			{
				case StageQuality.HIGH:
					GameSetings.GAMEQUALITY = StageQuality.MEDIUM;
					break;
				case StageQuality.MEDIUM:
					GameSetings.GAMEQUALITY = StageQuality.LOW;
					break;
				case StageQuality.LOW:
					GameSetings.GAMEQUALITY = StageQuality.HIGH;
					break;
			}

			this.stage.quality = GameSetings.GAMEQUALITY;
		}

		private function handleDropDownRollOut(event:MouseEvent):void
		{
			if (this._sprite)
			{
				this._sprite.mcDropDownMenu.gotoAndStop('closed');

				this._sprite.mcDropDownMenu.mcMusic.enabled = this._sprite.mcDropDownMenu.mcMusic.visible = false;
				this._sprite.mcDropDownMenu.mcSound.enabled = this._sprite.mcDropDownMenu.mcSound.visible = false;
				this._sprite.mcDropDownMenu.mcQuality.enabled = this._sprite.mcDropDownMenu.mcQuality.visible = false;
			}
		}

		private function handleDropDownRollOver(event:MouseEvent):void
		{
			if (this._sprite)
			{
				this._sprite.mcDropDownMenu.gotoAndStop('open');

				this._sprite.mcDropDownMenu.mcMusic.enabled = this._sprite.mcDropDownMenu.mcMusic.visible = true;
				this._sprite.mcDropDownMenu.mcSound.enabled = this._sprite.mcDropDownMenu.mcSound.visible = true;
				this._sprite.mcDropDownMenu.mcQuality.enabled = this._sprite.mcDropDownMenu.mcQuality.visible = true;
			}
		}

		private function updateLives():void
		{
			if (this._sprite)
			{
				// this._sprite.txtLives.text = String(this._lives);
				switch (this._lives)
				{
					case 0:
						if (this._sprite.contains(this._sprite.mcLives.Live_0)) this._sprite.mcLives.removeChild(this._sprite.mcLives.Live_0);
						if (this._sprite.contains(this._sprite.mcLives.Live_1)) this._sprite.mcLives.removeChild(this._sprite.mcLives.Live_1);
						if (this._sprite.contains(this._sprite.mcLives.Live_2)) this._sprite.mcLives.removeChild(this._sprite.mcLives.Live_2);
						break;
					case 1:
						if (this._sprite.contains(this._sprite.mcLives.Live_0)) this._sprite.mcLives.removeChild(this._sprite.mcLives.Live_0);
						if (this._sprite.contains(this._sprite.mcLives.Live_1)) this._sprite.mcLives.removeChild(this._sprite.mcLives.Live_1);
						break;
					case 2:
						if (this._sprite.contains(this._sprite.mcLives.Live_0)) this._sprite.mcLives.removeChild(this._sprite.mcLives.Live_0);
						break;
				}
			}
		}

		private function updateScore():void
		{
			if (this._sprite) this._sprite.mcScore.txtScore.text = String(this._score);
		}

		static public function get HUD_WIDTH():Number
		{
			return _HUD_WIDTH;
		}

		public function get lives():Number
		{
			return this._lives;
		}

		public function set lives(value:Number):void
		{
			this._lives = value;

			this.updateLives();
		}

		public function get score():Number
		{
			return this._lives;
		}

		public function set score(value:Number):void
		{
			this._score += value;

			this.updateScore();
		}

		public function destroy():void
		{
			if (this._sprite)
			{
				this.removeChild(this._sprite);
				this._sprite = null;
			}
		}

		public function get upgradeTimer():UpgradeTimer
		{
			return this._upgradeTimer;
		}

		// logging for traces
		public function log(output:String):void
		{
			Log.log(output, this);
		}

		public function debug(output:String):void
		{
			Log.debug(output, this);
		}
	}
}
