package
{
	import enemies.DeathLine;

	import objects.BGCastle;
	import objects.Hud;

	import player.Player;

	import popup.PopUp;

	import com.jbrettob.enum.Sounds;
	import com.jbrettob.log.Log;
	import com.jbrettob.media.sound.SoundChannelKing;

	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * @author futago
	 * @flowerModelElementId _QbQ0MEUaEeCheqrE2fpzuQ
	 */
	public class Game extends MovieClip
	{
		public var gameHandler				:GameHandler;
		public var player					:Player;
		public var gameSetings				:GameSetings;
		public var objectHolder				:ObjectHolder;
		public var keyBoard					:InputHandler;
		public var BgCastle					:BGCastle;
		public var hud						:Hud;
		public var bg						:BG;
		public var dl						:DeathLine;
		public var popUp					:PopUp;

		public function Game():void
		{
			Log.log('Main: ' + Math.random(), this);
			
			this.addEventListener(Event.ADDED_TO_STAGE, addetToStage);
		}

		private function addetToStage(event : Event) : void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addetToStage);
			
			Log.log('addetToStage: ' + Math.random(), this);
			
			newGame();
//			Mouse.hide();
		}
		
		

		private function newGame():void
		{
			Log.log('newGame: ' + Math.random(), this);
			
			bg 					= new BG();
			BgCastle 			= new BGCastle();
			gameSetings 		= new GameSetings();
			objectHolder 		= new ObjectHolder();
			gameHandler 		= new GameHandler(objectHolder);
			keyBoard 			= new InputHandler();
			player 				= new Player(this);
			hud 				= new Hud();
			objectHolder.player = player;
			dl 					= new DeathLine(keyBoard);
			popUp				= new PopUp();
			
			bg.y += 25;
			
			
			addChild(bg);
			addChild(BgCastle);
			addChild(keyBoard);
			addChild(player);
			addChild(gameHandler);
			addChild(objectHolder);
			addChild(dl);
			addChild(hud);
			addChild(popUp);
			
			hud.addEventListener('POPUP_SHOW_MENU', this.handlePopupShowMenu);

			SoundChannelKing.getInstance().init();
			SoundChannelKing.getInstance().playMusic(Sounds.BACKGROUND_MUSIC_01);
		}

		private function handlePopupShowMenu(event:Event):void
		{
			trace('handlePopupShowMenu');
			this.popUp.shown();
		}

		public function removeGame():void
		{
			this.objectHolder.clearAll();
			this.gameHandler.removeAll();
		}
	}
}