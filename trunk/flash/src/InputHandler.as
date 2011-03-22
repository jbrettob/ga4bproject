package
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	/**
	 * @author Rene Zwaan
	 */
	public class InputHandler extends MovieClip
	{	
		/**
		 * up or down
		 * 
		 */
		private var _A:String = "up";		private var _D:String = "up";
		private var _leftMouse:String = "up";
		private var _spaceBarr:String = "up";		private var _one:String = "up";		private var _two:String = "up";		private var _tree:String = "up";
		
		
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
			if (DisplayObject(event.target).name != 'mcMenu')
			{
				_leftMouse = "down";
			}
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
				case 32:
				{
					_spaceBarr = "up";
					break;
				}
				case 49:
				{
					_one = "up";
					break;
				}
				case 50:
				{
					_two = "up";
					break;
				}
				case 51:
				{
					_tree = "up";
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
				case 32:
				{
					_spaceBarr = "down";
					break;
				}
				case 49:
				{
					_one = "down";
					break;
				}
				case 50:
				{
					_two = "down";
					break;
				}
				case 51:
				{
					_tree = "down";
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

		public function get spaceBarr() : String {
			return _spaceBarr;
		}

		public function set spaceBarr(spaceBarr : String) : void {
			_spaceBarr = spaceBarr;
		}

		public function get tree() : String
		{
			return _tree;
		}

		public function set tree(tree : String) : void
		{
			_tree = tree;
		}

		public function get one() : String
		{
			return _one;
		}

		public function set one(one : String) : void
		{
			_one = one;
		}

		public function get two() : String
		{
			return _two;
		}

		public function set twee(twee : String) : void
		{
			_two = twee;
		}
		
	public function destroy():void
	{
		stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyDown);
		stage.removeEventListener(KeyboardEvent.KEY_UP,keyUp);
		stage.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		(parent as Game).removeChild(this);
	}
		
	}
	
}
