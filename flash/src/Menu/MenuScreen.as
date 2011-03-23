package Menu
{
	import com.jbrettob.enum.Sounds;
	import com.jbrettob.log.Log;
	import com.jbrettob.media.sound.SoundChannelKing;

	import flash.display.MovieClip;
	import flash.display.StageQuality;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Jayce Rettob
	 */
	public class MenuScreen extends HUD_Menu
	{
		public var mcStartGame:MovieClip;
		public var mcOpties:MovieClip;
		public var mcHighScore:MovieClip;
		public var mcCredits:MovieClip;

		public function MenuScreen()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);

			this.x += 25;

			this.init();
		}

		private function init():void
		{
			this.mcBack.enabled = this.mcBack.buttonMode = false;
			this.mcMusicOn.enabled = this.mcMusicOn.buttonMode = false;
			this.mcMusicOff.enabled = this.mcMusicOff.buttonMode = false;
			this.mcSoundOn.enabled = this.mcSoundOn.buttonMode = false;
			this.mcSoundOff.enabled = this.mcSoundOff.buttonMode = false;
			this.mcQualityLow.enabled = this.mcQualityLow.buttonMode = false;
			this.mcQualityMed.enabled = this.mcQualityMed.buttonMode = false;
			this.mcQualityHigh.enabled = this.mcQualityHigh.buttonMode = false;

			this.mcStartGame = this.mcContainer['mcStartGame'];
			this.mcOpties = this.mcContainer['mcOpties'];
			this.mcCredits = this.mcContainer['mcCredits'];

			TextField(this.mcStartGame['txtLabel']).text = 'Start Game';
			TextField(this.mcOpties['txtLabel']).text = 'Opties';
			TextField(this.mcCredits['txtLabel']).text = 'Credits';

			this.mcStartGame.buttonMode = true;
			this.mcOpties.buttonMode = true;
			this.mcCredits.buttonMode = true;

			this.mcStartGame.mouseChildren = false;
			this.mcOpties.mouseChildren = false;
			this.mcCredits.mouseChildren = false;

			this.addFrameScript(50 - 1, this.handleStopAtMainMenu);
			this.addFrameScript(75 - 1, this.handleStopAtOption);
			this.addFrameScript(139 - 1, this.handleStopAtCredits);
		}

		private function handleStopAtMainMenu():void
		{
			this.stop();

			this.mcContainer.visible = true;

			this.mcBack.enabled = this.mcBack.buttonMode = this.mcBack.visible = false;
			this.mcMusicOn.enabled = this.mcMusicOn.buttonMode = this.mcMusicOn.visible = false;
			this.mcMusicOff.enabled = this.mcMusicOff.buttonMode = this.mcMusicOff.visible = false;
			this.mcSoundOn.enabled = this.mcSoundOn.buttonMode = this.mcSoundOn.visible = false;
			this.mcSoundOff.enabled = this.mcSoundOff.buttonMode = this.mcSoundOff.visible = false;
			this.mcQualityLow.enabled = this.mcQualityLow.buttonMode = this.mcQualityLow.visible = false;
			this.mcQualityMed.enabled = this.mcQualityMed.buttonMode = this.mcQualityMed.visible = false;
			this.mcQualityHigh.enabled = this.mcQualityHigh.buttonMode = this.mcQualityHigh.visible = false;

			this.addEventListener(MouseEvent.CLICK, handleMouseClick);
		}

		private function handleStopAtOption():void
		{
			this.stop();

			this.addEventListener(MouseEvent.CLICK, handleMouseClick);

			this.mcContainer.enabled = true;

			this.mcBack.enabled = this.mcBack.buttonMode = this.mcBack.visible = true;
			this.mcMusicOn.enabled = this.mcMusicOn.buttonMode = this.mcMusicOn.visible = true;
			this.mcMusicOff.enabled = this.mcMusicOff.buttonMode = this.mcMusicOff.visible = true;
			this.mcSoundOn.enabled = this.mcSoundOn.buttonMode = this.mcSoundOn.visible = true;
			this.mcSoundOff.enabled = this.mcSoundOff.buttonMode = this.mcSoundOff.visible = true;
			this.mcQualityLow.enabled = this.mcQualityLow.buttonMode = this.mcQualityLow.visible = true;
			this.mcQualityMed.enabled = this.mcQualityMed.buttonMode = this.mcQualityMed.visible = true;
			this.mcQualityHigh.enabled = this.mcQualityHigh.buttonMode = this.mcQualityHigh.visible = true;

			this.mcStartGame.buttonMode = this.mcStartGame.visible = false;
			this.mcOpties.buttonMode = this.mcOpties.visible = false;
			this.mcCredits.buttonMode = this.mcCredits.visible = false;
		}

		private function handleStopAtCredits():void
		{
			this.stop();

			this.addEventListener(MouseEvent.CLICK, handleMouseClick);

			this.mcContainer.enabled = true;

			this.mcBack.enabled = this.mcBack.buttonMode = this.mcBack.visible = true;

			this.mcMusicOn.enabled = this.mcMusicOn.buttonMode = this.mcMusicOn.visible = false;
			this.mcMusicOff.enabled = this.mcMusicOff.buttonMode = this.mcMusicOff.visible = false;
			this.mcSoundOn.enabled = this.mcSoundOn.buttonMode = this.mcSoundOn.visible = false;
			this.mcSoundOff.enabled = this.mcSoundOff.buttonMode = this.mcSoundOff.visible = false;
			this.mcQualityLow.enabled = this.mcQualityLow.buttonMode = this.mcQualityLow.visible = false;
			this.mcQualityMed.enabled = this.mcQualityMed.buttonMode = this.mcQualityMed.visible = false;
			this.mcQualityHigh.enabled = this.mcQualityHigh.buttonMode = this.mcQualityHigh.visible = false;

			this.mcStartGame.buttonMode = this.mcStartGame.visible = false;
			this.mcOpties.buttonMode = this.mcOpties.visible = false;
			this.mcCredits.buttonMode = this.mcCredits.visible = false;
		}

		private function handleMouseClick(event:MouseEvent):void
		{
			switch(event.target)
			{
				case this.mcStartGame:
					if (this.mcContainer.enabled)
					{
						SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
						this.startGame();
					}
					break;
				case this.mcOpties:
					if (this.mcContainer.enabled)
					{
						SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
						this.showOptions();
					}
					break;
				case this.mcBack:
					if (this.mcBack.enabled)
					{
						SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
						this.showMenu();
					}
					break;
				case this.mcCredits:
					if (this.mcContainer.enabled)
					{
						SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
						this.showCredits();
					}
					break;
				case this.mcMusicOn:
					SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
					SoundChannelKing.getInstance().unMuteAllMusic();
					break;
				case this.mcMusicOff:
					SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
					SoundChannelKing.getInstance().muteALlMusic();
					break;
				case this.mcSoundOn:
					SoundChannelKing.getInstance().unMuteAllSound();
					break;
				case this.mcSoundOff:
					SoundChannelKing.getInstance().muteALlSound();
					break;
				case this.mcQualityLow:
					SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
					GameSetings.GAMEQUALITY = StageQuality.LOW;
					this.stage.quality = GameSetings.GAMEQUALITY;
					break;
				case this.mcQualityMed:
					SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
					GameSetings.GAMEQUALITY = StageQuality.MEDIUM;
					this.stage.quality = GameSetings.GAMEQUALITY;
					break;
				case this.mcQualityHigh:
					SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
					GameSetings.GAMEQUALITY = StageQuality.HIGH;
					this.stage.quality = GameSetings.GAMEQUALITY;
					break;
			}
		}

		private function showMenu():void
		{
			this.removeEventListener(MouseEvent.CLICK, handleMouseClick);

			this.play();

			this.mcStartGame.buttonMode = this.mcStartGame.visible = true;
			this.mcOpties.buttonMode = this.mcOpties.visible = true;
			this.mcCredits.buttonMode = this.mcCredits.visible = true;

			this.mcBack.enabled = this.mcBack.buttonMode = false;
			this.mcMusicOn.enabled = this.mcMusicOn.buttonMode = false;
			this.mcMusicOff.enabled = this.mcMusicOff.buttonMode = false;
			this.mcSoundOn.enabled = this.mcSoundOn.buttonMode = false;
			this.mcSoundOff.enabled = this.mcSoundOff.buttonMode = false;
			this.mcQualityLow.enabled = this.mcQualityLow.buttonMode = false;
			this.mcQualityMed.enabled = this.mcQualityMed.buttonMode = false;
			this.mcQualityHigh.enabled = this.mcQualityHigh.buttonMode = false;
		}

		private function showOptions():void
		{
			this.removeEventListener(MouseEvent.CLICK, handleMouseClick);

			this.gotoAndPlay('MainMenu');

			this.mcStartGame.buttonMode = false;
			this.mcOpties.buttonMode = false;
			this.mcCredits.buttonMode = false;
			this.mcContainer.enabled = false;

			this.mcBack.buttonMode = this.mcBack.visible = true;
			this.mcMusicOn.enabled = this.mcMusicOn.buttonMode = this.mcMusicOn.visible = true;
			this.mcMusicOff.enabled = this.mcMusicOff.buttonMode = this.mcMusicOff.visible = true;
			this.mcSoundOn.enabled = this.mcSoundOn.buttonMode = this.mcSoundOn.visible = true;
			this.mcSoundOff.enabled = this.mcSoundOff.buttonMode = this.mcSoundOff.visible = true;
			this.mcQualityLow.enabled = this.mcQualityLow.buttonMode = this.mcQualityLow.visible = true;
			this.mcQualityMed.enabled = this.mcQualityMed.buttonMode = this.mcQualityMed.visible = true;
			this.mcQualityHigh.enabled = this.mcQualityHigh.buttonMode = this.mcQualityHigh.visible = true;
		}

		private function showCredits():void
		{
			this.removeEventListener(MouseEvent.CLICK, handleMouseClick);

			Log.log('showCredits', this);

			this.gotoAndPlay('MainCredits');
		}

		private function startGame():void
		{
			this.dispatchEvent(new Event('MENUSCREEN_STARTGAME'));
			this.destroy();
		}

		public function destroy():void
		{
			this.removeEventListener(MouseEvent.CLICK, handleMouseClick);
		}
	}
}
