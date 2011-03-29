package objects
{
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 */
	public class BackGround extends MovieClip
	{
		private var bgState		:String = "one";
		private var bgHolder	:BG;
		
		public function BackGround():void
		{
			bgHolder = new BG();
			addChild(bgHolder);
		}
		
		public function goToNextStage():void
		{
			{
				if (bgHolder.currentFrameLabel == "one")
				{
					bgHolder.gotoAndStop("two");
					bgState= "two";
				}
				else if(bgHolder.currentFrameLabel == "two")
				{
					bgHolder.gotoAndStop("tre");
					bgState= "tre";
				}
			}
		}
	}
}
