package Intro
{
	import com.greensock.TweenNano;
	import com.jbrettob.display.AbstractIntro;

	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * @author Jayce Rettob
	 */
	public class IntroKing extends AbstractIntro
	{
		private var _bg:Sprite;
		
		public function IntroKing()
		{
			super();
		}

		override public function init():void
		{
			this._bg = new Sprite();
			this._bg.graphics.beginFill(0xa9c2db);
			this._bg.graphics.drawRect(0, 0, GameSetings.GAMEWITH, GameSetings.GAMEHEIGHT);
			this._bg.graphics.endFill();
			this.addChild(this._bg);
			
			this.movie = new Intro_Team();
			this.movie.x = GameSetings.GAMEWITH / 2;
			this.movie.y = GameSetings.GAMEHEIGHT / 2;
			this.movie.cacheAsBitmap = true;
			this.addChild(this.movie);
			
			TweenNano.to(this, 4, {onComplete: this.endMovie});
			
			super.init();
		}
		
		private function endMovie():void
		{
			this.dispatchEvent(new Event('IntroMovie_END'));
		}

		override public function destroy():void
		{
			if (this.movie)
			{
				if (this.contains(this.movie)) this.removeChild(this.movie);
				this.movie = null;
			}
			
			if (this._bg)
			{
				if (this.contains(this._bg)) this.removeChild(this._bg);
				this._bg = null;
			}
			
			super.destroy();
		}

	}
}
