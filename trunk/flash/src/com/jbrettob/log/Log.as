package com.jbrettob.log
{
	/**
	 * @author jaycerettob
	 */
	public class Log
	{
		static public function log(output:String, object:Object):void
		{
			if (GameSetings.SHOW_LOG)
			{
				trace('Log: ' + (object) + ' : ' + output);
			}
		}
		
		static public function debug(output:String, object:Object):void
		{
			if (GameSetings.SHOW_LOG)
			{
				trace('Debug: ' + (object) + ' : ' + output);
			}
		}
	}
}
