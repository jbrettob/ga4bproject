package {
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	/**
	 * @author Rene Zwaan
	 * 
	 */
	public class InputHandler extends MovieClip
	{	
		/**
		 * up or down
		 * 
		 */
		private var _A:String = "up";		private var _D:String = "up";
		private var _leftMouse:String = "up";
		
		public function InputHandler():void
		{
			addEventListener(Event.ADDED_TO_STAGE, stageEvent);
		}

		private function stageEvent(event : Event) : void 
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDown);			stage.addEventListener(KeyboardEvent.KEY_UP,keyUp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}

		private function mouseDown(event : MouseEvent) : void 
		{
			_leftMouse = "down";
		}
		
		private function mouseUp(event : MouseEvent) : void 
		{
			_leftMouse = "up";
		}

		private function keyUp(event : KeyboardEvent) : void 
		{
			switch(event.keyCode)
			{
				case 65:
				{
					_A = "up";
					break;
				}
				case 68:
				{
					_D = "up";
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
					_A = "down";
					break;
				}
				case 68:
				{
					_D = "down";
					break;
				}
			}
		}

		 

		public function get leftMouse() : String {
			return _leftMouse;
		}

		public function set leftMouse(leftMouse : String) : void {
			_leftMouse = leftMouse;
		}

		public function get A() : String {
			return _A;
		}

		public function set A(a : String) : void {
			_A = a;
		}

		public function get D() : String {
			return _D;
		}

		public function set D(d : String) : void {
			_D = d;
		}
		
	}
}
