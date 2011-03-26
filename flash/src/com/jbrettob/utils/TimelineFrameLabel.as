package com.jbrettob.utils
{
	import flash.display.MovieClip;

	/**
	 * @author Jayce Rettob
	 */
	public class TimelineFrameLabel extends Object
	{
		private static var _INSTANCE:TimelineFrameLabel;

		public function TimelineFrameLabel()
		{
			if (_INSTANCE) new Error("Singleton use TimelineFrameLabel.getInstance()");
		}

		public static function getInstance():TimelineFrameLabel
		{
			if (!_INSTANCE)
			{
				_INSTANCE = new TimelineFrameLabel();
			}

			return _INSTANCE;
		}

		public function getLabelFrame(frLabel:String, mc:MovieClip):int
		{
			for (var i:int = 0; i < mc.currentLabels.length; i++)
			{
				if (mc.currentLabels[i]['name'] == frLabel)
				{
					return mc.currentLabels[i]['frame'];
				}
			}

			return -1;
		}
	}
}
