package {
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

		public function Main():void
		{
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
			objectHolder.player = player;
			hud 				= new Hud();
			bg.y += 25;
			addChild(bg);
			addChild(BgCastle);
			addChild(keyBoard);
			addChild(player);
			addChild(gameHandler);
			addChild(objectHolder);
			addChild(hud);

			SoundChannel.getInstance().init();
			
			SoundChannel.getInstance().playSound();
			
			SoundChannel.getInstance().stopSound();
		}

		public function removeGame():void
		{
			
		}
	}
}
