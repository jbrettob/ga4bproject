package player
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * @author futago
	 */
	public class IdleCaracters extends MovieClip
	{
		private var actor2D1 		: Actor2D;
		private var actor3D1 		: Actor3D;
		private var actorPro1 		: ActorPro;
		private var actor2D2 		: Actor2D;
		private var actor3D2 		: Actor3D;
		private var actorPro2 		: ActorPro;
		private var point1			: Point;
		private var point2			: Point;
		private var spot1			: String = GameSetings.ACTOR2D;
		private var spot2			: String = GameSetings.ACTORPRO;
		private var smoke1			: Cloud;
		private var smoke2			: Cloud;
		
		public function IdleCaracters():void
		{
			actor2D1 	= new Actor2D();
			actor3D1 	= new Actor3D();
			actorPro1 	= new ActorPro();
			actor2D2	= new Actor2D();
			actor3D2 	= new Actor3D();
			actorPro2 	= new ActorPro();
			
			smoke1 		= new Cloud();
			smoke2 		= new Cloud();

			addChild(actor2D1);
			addChild(actor3D1);
			addChild(actorPro1);
			addChild(actor2D2);
			addChild(actor3D2);
			addChild(actorPro2);
			addChild(smoke1);
			addChild(smoke2);
			init();
			
		}
		private function init():void
		{
			point1 = new Point(380,720);
			point2 = new Point(450,720);
			
			actor3D1.visible = false;
			actorPro1.visible = false;
			
			actor2D1.x = point1.x;
			actor2D1.y = point1.y;
			actorPro1.x = point1.x;
			actorPro1.y = point1.y;
			actor3D1.x = point1.x;
			actor3D1.y = point1.y;
			
			actor3D2.visible = false;
			actor2D2.visible = false;
			
			actor2D2.x = point2.x;
			actor2D2.y = point2.y;
			actorPro2.x = point2.x;
			actorPro2.y = point2.y;
			actor3D2.x = point2.x;
			actor3D2.y = point2.y;
			
			smoke1.scaleX = 0.4;
			smoke1.scaleY = 0.4;
			smoke1.x	= point1.x - 30;
			smoke1.y 	= point1.y - 60;
			
			smoke2.scaleX = 0.4;
			smoke2.scaleY = 0.4;
			smoke2.x 	= point2.x - 30;
			smoke2.y 	= point2.y - 60;
		}
		
		public function swichCaracter(name:String,onStage:String):void
		{
			if(spot1 == name)
			{
				smoke1.gotoAndPlay(1);
				switch(onStage)
				{
					case GameSetings.ACTOR2D:
					{
						actor2D1.visible = true;
						actor3D1.visible = false;
						actorPro1.visible = false;
						spot1 = onStage;
						break;
					}
					case GameSetings.ACTOR3D:
					{
						actor2D1.visible = false;
						actor3D1.visible = true;
						actorPro1.visible = false;
						spot1 = onStage;
						break;
					}
					case GameSetings.ACTORPRO:
					{
						actor2D1.visible = false;
						actor3D1.visible = false;
						actorPro1.visible = true;
						spot1 = onStage;
						break;
					}
				}
			}
			
			if(spot2 == name)
			{
				smoke2.gotoAndPlay(1);
				switch(onStage)
				{
					case GameSetings.ACTOR2D:
					{
						actor2D2.visible = true;
						actor3D2.visible = false;
						actorPro2.visible = false;
						spot2 = onStage;
						break;
					}
					case GameSetings.ACTOR3D:
					{
						actor2D2.visible = false;
						actor3D2.visible = true;
						actorPro2.visible = false;
						spot2 = onStage;
						break;
					}
					case GameSetings.ACTORPRO:
					{
						actor2D2.visible = false;
						actor3D2.visible = false;
						actorPro2.visible = true;
						spot2 = onStage;
						break;
					}
				}
			}
		}
	}
}
