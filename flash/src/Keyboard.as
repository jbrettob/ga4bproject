package {
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.MovieClip;
	/**
	 * @author Rene Zwaan
	 * 
	 */
	public class Keyboard extends MovieClip
	{	
		/**
		 * up or down
		 * 
		 */
		public static var A:String = "up";
		
		public function Keyboard()
		{
			addEventListener(KeyboardEvent.KEY_DOWN,keyDown);
		}

		private function keyDown(event : KeyboardEvent) : void 
		{
			trace(event.keyCode);
			
		}
		
	}
}
