package com.jbrettob.display
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * @author Jayce Rettob
	 */
	public class AbstractIntro extends MovieClip
	{
		public var movie:DisplayObject;
		
		public function AbstractIntro()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
		}

		private function handleAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage);
			
			this.init();
		}

		public function init():void
		{
			
		}
		
		public function destroy():void
		{
			if (this.movie)
			{
				if (this.contains(this.movie))
				{
					this.removeChild(this.movie);
				}
				this.movie = null;
			}
		}
	}
}
