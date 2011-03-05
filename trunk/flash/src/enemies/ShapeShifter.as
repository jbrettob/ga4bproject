package enemies 
{
	/**
	 * @author futago
	 */
	public class ShapeShifter extends Enemy
	{
		private var actorShapeShifter:ActorShapeShifter;
		private var objectHolder:ObjectHolder;
	
		
		public function ShapeShifter(_objectHolder:ObjectHolder):void
		{
			
			objectHolder = _objectHolder;
			setUpShapeShifter();
		}

		private function setUpShapeShifter() : void 
		{
			actorShapeShifter = new ActorShapeShifter();
			addChild(actorShapeShifter);
			this.y += 10;
			_name = GameSetings.SHAPESHIFTERNAME;
			_moveSpeed = GameSetings.SHAPESHIFTERMOVESPEED;
			_health = GameSetings.SHAPESHIFTERHP;
			remove();
		}
		
		private function remove():void
		{
			removeChild(actorShapeShifter);
			actorShapeShifter = null;
			objectHolder.removeEnemy(this);
			_alife = false;
		}
		
	}
}
