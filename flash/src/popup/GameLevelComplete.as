package popup
{
	import com.greensock.TweenLite;
	import com.jbrettob.utils.TimelineFrameLabel;

	import flash.events.Event;
	/**
	 * @author Jayce Rettob
	 */
	public class GameLevelComplete extends PopUp_LevelComplete
	{
		public function GameLevelComplete()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
			
			this.mouseChildren = this.buttonMode = false;
			
			this.init();
		}

		private function init():void
		{
			this.addFrameScript(TimelineFrameLabel.getInstance().getLabelFrame('frame_pauze', this), this.handleAddFrameScript);
			this.addFrameScript(TimelineFrameLabel.getInstance().getLabelFrame('frame_end', this) - 1, this.handleComplete);
		}
		
		private function handleAddFrameScript():void
		{
			this.stop();
			TweenLite.to(this, 3, {onComplete: this.handleTweenComplete});
		}
		
		private function handleTweenComplete():void
		{
			this.play();
		}
		
		private function handleComplete():void
		{
			this.dispatchEvent(new Event('POPUP_COMPLETE'));
		}
		
		public function destroy():void
		{
			this.stop();
			
			while (this.numChildren > 0)
			{
				this.removeChildAt(0);
			}
			
			TweenLite.killTweensOf(this);
		}
	}
}
