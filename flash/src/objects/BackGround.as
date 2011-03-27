package objects
{
	import com.jbrettob.log.Log;
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 */
	public class BackGround extends MovieClip
	{
		private var bgState:String = "one";
		private var bgHolder:BG;
		
		public function BackGround():void
		{
			bgHolder = new BG();
			addChild(bgHolder);
		}
		
		public function goToNextStage():void
		{
			{
				bgHolder.gotoAndStop("two");
				bgState= "two";
			}
		}
	}
}
