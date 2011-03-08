package {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
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
		private var A:String = "up";		private var D:String = "up";
		
		public function Keyboard():void
		{
			addEventListener(Event.ADDED_TO_STAGE, stageEvent);
		}

		private function stageEvent(event : Event) : void 
		{
			trace("new to stage");
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDown);			stage.addEventListener(KeyboardEvent.KEY_UP,keyUp);
		}

		private function keyUp(event : KeyboardEvent) : void 
		{
			switch(event.keyCode)
			{
				case 65:
				{
					A = "up";
					break;
				}
				case 68:
				{
					D = "up";
					break;
				}
			}
		}

		private function keyDown(event : KeyboardEvent) : void 
		{
			switch(event.keyCode)
			{
				case 65:
				{
					A = "down";
					break;
				}
				case 68:
				{
					D = "down";
					break;
				}
			}
		}

		 public function get _D() : String 
		 {
			return D;
		 }

		 public function set _D(D : String) : void 
		 {
			D = D;
		}

		public function get _A() : String {
			return A;
		}

		public function set _A(a : String) : void {
			A = a;
		}
		
	}
}
