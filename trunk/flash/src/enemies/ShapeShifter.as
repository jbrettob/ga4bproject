package enemies 
{
	/**
	 * @author futago
	 */
	public class ShapeShifter extends Enemy
	{
		
		public function ShapeShifter():void
		{
			setUpShapeShifter();
		}

		private function setUpShapeShifter() : void 
		{
			_name = GameSetings.SHAPESHIFTERNAME;
			_moveSpeed = GameSetings.SHAPESHIFTERMOVESPEED;
			
		}
	}
}
