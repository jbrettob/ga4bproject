package popup
{
	import com.jbrettob.enum.Sounds;
	import com.jbrettob.media.sound.SoundChannelKing;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Jayce Rettob
	 */
	public class PopUp extends MovieClip
	{
		private var _sprite:PopUp_Menu;
		private var _shown:Boolean = false;
		private var _bg:Sprite;

		public function PopUp()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}


		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);

			this.init();
		}

		private function init():void
		{
			this._sprite = new PopUp_Menu();
			this.setupMenu();
			this.addChild(this._sprite);
			this.visible = this.enabled = false;

			this.x = GameSetings.GAMEWITH / 2;
			this.y = GameSetings.GAMEHEIGHT / 2;
		}

		private function setupMenu():void
		{
			this._sprite.addEventListener(MouseEvent.CLICK, this.handleClick);

			this._sprite.mcReturnToGame.mouseChildren = false;
			this._sprite.mcMainMenu.mouseChildren = false;
			this._sprite.mcOptions.mouseChildren = false;

			TextField(this._sprite.mcMainMenu['txtLabel']).text = 'Return to Main Menu';
			TextField(this._sprite.mcOptions['txtLabel']).text = 'Options';
			TextField(this._sprite.mcReturnToGame['txtLabel']).text = 'Return to game';

			this._sprite.mcOptions.buttonMode = true;
			this._sprite.mcReturnToGame.buttonMode = true;
			this._sprite.mcMainMenu.buttonMode = true;
			this._sprite.mcClose.buttonMode = true;

			this._sprite.mcReturnToGame.buttonMode = this._sprite.mcMainMenu.buttonMode = this._sprite.mcOptions.buttonMode = true;
		}

		private function handleClick(event:MouseEvent):void
		{
			switch (event.target)
			{
				case this._sprite.mcReturnToGame:
				case this._sprite.mcClose:
					SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
					this.shown();
					break;
				case this._sprite.mcMainMenu:
					SoundChannelKing.getInstance().playSound(Sounds.SOUND_BUTTONPRESSED);
					this.showMainMenu();
					break;
			}
		}

		private function showMainMenu():void
		{
			this.dispatchEvent(new Event('GAME_TOMAINMENU'));
		}

		public function shown():void
		{
			this._shown = this.visible = this.enabled = (this._shown) ? false : true;
			
			if ((parent as Game).gameState == GameSetings.PAUSED)
			{
				(parent as Game).gameState = GameSetings.PLAYING;
			}
			else
			{
				(parent as Game).gameState = GameSetings.PAUSED;
				
				if (this._bg)
				{
					this.removeChild(this._bg);
					this._bg = null;
				}
				
				this._bg = new Sprite();
				this._bg.graphics.beginFill(0x000000, .25);
				this._bg.graphics.drawRect(0, 0, GameSetings.GAMEWITH, GameSetings.GAMEHEIGHT);
				this._bg.graphics.endFill();
				this._bg.x = -(GameSetings.GAMEWITH / 2);
				this._bg.y = -(GameSetings.GAMEHEIGHT / 2);
				this.addChildAt(this._bg, 0);
			}
		}
		
		public function destroy():void
		{
			if (this._sprite)
			{
				this._sprite.removeEventListener(MouseEvent.CLICK, this.handleClick);
				this.removeChild(this._sprite);
				this._sprite = null;
			}
		}
	}
}
