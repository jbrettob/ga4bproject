package {
	import flash.events.Event;
	import enemies.DeathLine;
	import com.jbrettob.media.sound.SoundChannel;
	import objects.BGCastle;
	import objects.Hud;

	import player.Player;

	import flash.display.MovieClip;
	import flash.ui.Mouse;

	/**
	 * @author futago
	 * @flowerModelElementId _QbQ0MEUaEeCheqrE2fpzuQ
	 */
	public class Main extends MovieClip
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

		public function Main():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addetToStage);
		}

		private function addetToStage(event : Event) : void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addetToStage);
			
			newGame();
			Mouse.hide();
		}
		
		

		private function newGame():void
		{
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
			
			bg.y += 25;
			
			BgCastle.y = GameSetings.GAMEHEIGHT;
			
			addChild(bg);
			addChild(BgCastle);
			addChild(keyBoard);
			addChild(player);
			addChild(gameHandler);
			addChild(objectHolder);
			addChild(hud);
			addChild(dl);

			SoundChannel.getInstance().init();
			SoundChannel.getInstance().playSound();
		}

		public function removeGame():void
		{
			
		}
	}
}
