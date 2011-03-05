package enemies 
{
	/**
	 * @author futago
	 */
	public class ShapeShifter extends Enemy
	{
		private var actorShapeShifter:ActorShapeShifter;
		
		public function ShapeShifter():void
		{
			setUpShapeShifter();
		}

		private function setUpShapeShifter() : void 
		{
			actorShapeShifter = new ActorShapeShifter();
			addChild(actorShapeShifter);
			
			_name = GameSetings.SHAPESHIFTERNAME;
			_moveSpeed = GameSetings.SHAPESHIFTERMOVESPEED;
			_health = GameSetings.SHAPESHIFTERHP;
		}
		
		
	}
}
