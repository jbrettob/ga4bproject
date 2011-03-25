package com.jbrettob.data.xml
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * @author Jayce Rettob
	 */
	public class XmlLoadSettings extends Sprite
	{
		public function XmlLoadSettings()
		{
			
		}
		
		public function loadXML(url:String = 'xml/settings.xml'):void
		{
			var req:URLRequest = new URLRequest(url);
			var ldr:URLLoader = new URLLoader();
			ldr.load(req);
			ldr.addEventListener(Event.COMPLETE, this.handleXMLComplete);
		}
		
		private function handleXMLComplete(event:Event):void
		{
			var xml:XML = XML(event.target['data']);
			var xmlList:XMLList = XMLList(xml.settings);

			// temp get new values
			// global game settings
			var gameSpeed:Number = Number(xmlList.child('game').attribute('gamespeed'));
			var gameWidth:Number = Number(xmlList.child('game').attribute('gamewidth'));
			var gameHeight:Number = Number(xmlList.child('game').attribute('gameheight'));
			var gameQuality:String = String(xmlList.child('game').attribute('gamequality'));
			
			// global player settings
			var playerLives:Number = Number(xmlList.child('game').child('player').attribute('lives'));
			var playerMovingSpeed:Number = Number(xmlList.child('game').child('player').attribute('movingspeed'));
			var playerStartX:Number = Number(xmlList.child('game').child('player').attribute('posx'));
			var playerStartY:Number = Number(xmlList.child('game').child('player').attribute('posy'));
			var playerBoundsLeft:Number = Number(xmlList.child('game').child('player').attribute('boundsLeft'));
			var playerBoundsRight:Number = Number(xmlList.child('game').child('player').attribute('boundsRight'));
			
			// actor3d settings
			var actor3DProjectileSpeed:Number = Number(xmlList.child('game').child('actor3d').attribute('projectileSpeed'));
			var actor3DProjectileDamage:Number = Number(xmlList.child('game').child('actor3d').attribute('projectileDamage'));
			var actor3DReload:Number = Number(xmlList.child('game').child('actor3d').attribute('reload'));
			
			// actor3d settings
			var actor2DProjectileSpeed:Number = Number(xmlList.child('game').child('actor2d').attribute('projectileSpeed'));
			var actor2DProjectileDamage:Number = Number(xmlList.child('game').child('actor2d').attribute('projectileDamage'));
			var actor2DReload:Number = Number(xmlList.child('game').child('actor2d').attribute('reload'));
			
			// actorPro settings
			var actorProProjectileSpeed:Number = Number(xmlList.child('game').child('actorPro').attribute('projectileSpeed'));
			var actorProProjectileDamage:Number = Number(xmlList.child('game').child('actorPro').attribute('projectileDamage'));
			var actorProReload:Number = Number(xmlList.child('game').child('actorPro').attribute('reload'));
			
			// bug settings
			var bugHp:Number = Number(xmlList.child('game').child('bug').attribute('hp'));
			var bugMovingSpeed:Number = Number(xmlList.child('game').child('bug').attribute('movingspeed'));
			var bugPoints:Number = Number(xmlList.child('game').child('bug').attribute('points'));
			var bugProjectileSpeed:Number = Number(xmlList.child('game').child('bug').attribute('projectileSpeed'));
			var bugProjectileDamage:Number = Number(xmlList.child('game').child('bug').attribute('projectileDamage'));
			var bugMinReload:Number = Number(xmlList.child('game').child('bug').attribute('minReload'));
			var bugMaxReload:Number = Number(xmlList.child('game').child('bug').attribute('maxReload'));
			
			// orb settings
			var orbMovingSpeed:Number = Number(xmlList.child('game').child('orb').attribute('movingSpeed'));
			var orbRespawnTime:Number = Number(xmlList.child('game').child('orb').attribute('respawn'));
			var orbExp:Number = Number(xmlList.child('game').child('orb').attribute('exp'));
			
			// deadline settings
			var deadlineMovingSpeed:Number = Number(xmlList.child('game').child('deadline').attribute('movingSpeed'));
			var deadlineAccelerate:Number = Number(xmlList.child('game').child('deadline').attribute('accelerate'));
			var deadlineStartY:Number = Number(xmlList.child('game').child('deadline').attribute('posY'));
			
			// check if temp value is not null
			if (!gameSpeed) gameSpeed = GameSetings.GAMESPEED;
			if (!gameWidth) gameWidth = GameSetings.GAMEWITH;
			if (!gameHeight) gameHeight = GameSetings.GAMEHEIGHT;
			if (!gameQuality) gameQuality = GameSetings.GAMEQUALITY;
			if (!playerLives) playerLives = GameSetings.PLAYER_LIVES;
			if (!playerMovingSpeed) playerMovingSpeed = GameSetings.PLAYERMOVESPEED;
			if (!playerStartX) playerStartX = GameSetings.PLAYERXPOS;
			if (!playerStartY) playerStartY = GameSetings.PLAYERYPOS;
			if (!playerBoundsLeft) playerBoundsLeft = GameSetings.PLAYERMAXLEFT;
			if (!playerBoundsRight) playerBoundsRight = GameSetings.PLAYERMAXRIGHT;
			if (!actor3DProjectileSpeed) actor3DProjectileSpeed = GameSetings.ACTOR3DPROJECTILESPEED;
			if (!actor3DProjectileDamage) actor3DProjectileDamage = GameSetings.ACTOR3DPROJECTILEDAMAGE;
			if (!actor3DReload) actor3DReload = GameSetings.ACTOR3DPROJECTILERELOADSPEED;
			if (!actor2DProjectileSpeed) actor2DProjectileSpeed = GameSetings.ACTOR2DPROJECTILESPEED;
			if (!actor2DProjectileDamage) actor2DProjectileDamage = GameSetings.ACTOR2DPROJECTILEDAMAGE;
			if (!actor2DReload) actor2DReload = GameSetings.ACTOR2DPROJECTILERELOADSPEED;
			if (!actorProProjectileSpeed) actorProProjectileSpeed = GameSetings.ACTORPROPROJECTILESPEED;
			if (!actorProProjectileDamage) actorProProjectileDamage = GameSetings.ACTORPROPROJECTILEDAMAGE;
			if (!actorProReload) actorProReload = GameSetings.ACTORPROPROJECTILERELOADSPEED;
			
			// TODO: bug != shapeshifter ??
			if (!bugHp) bugHp = GameSetings.SHAPESHIFTERHP;
			if (!bugPoints) bugPoints = GameSetings.SHAPESHIFTERSCORE;
			if (!bugMovingSpeed) bugMovingSpeed = GameSetings.SHAPESHIFTERMOVESPEED;
			if (!bugProjectileSpeed) bugProjectileSpeed = GameSetings.SHAPESHIFTERPROJECTILESPEED;
			if (!bugProjectileDamage) bugProjectileDamage = GameSetings.SHAPESHIFTERPROJECTILEDAMAGE;
			if (!bugMinReload) bugMinReload = GameSetings.SHAPESHIFTERMINSHOOTWAIT;
			if (!bugMaxReload) bugMaxReload = GameSetings.SHAPESHIFTERMAXSHOOTWAIT;
			
			if (!orbMovingSpeed) orbMovingSpeed = GameSetings.ORBMOVESPEED;
			if (!orbRespawnTime) orbRespawnTime = GameSetings.ORBSPAWNTIMER;
			if (!orbExp) orbRespawnTime = GameSetings.ORBXP;
			if (!deadlineMovingSpeed) deadlineMovingSpeed = GameSetings.DEATHLINEMOVESPEED;
			if (!deadlineAccelerate) deadlineAccelerate = GameSetings.DEATHLINEMOVESPEEDINCREASERATE;
			if (!deadlineStartY) deadlineStartY = GameSetings.DEATHLINESTARTHEIGHT;
			
			// set new value
			GameSetings.GAMESPEED = gameSpeed;
			GameSetings.GAMEWITH = gameWidth;
			GameSetings.GAMEHEIGHT = gameHeight;
			GameSetings.GAMEQUALITY = gameQuality;
			GameSetings.PLAYER_LIVES = playerLives;
			GameSetings.PLAYERMOVESPEED = playerMovingSpeed;
			GameSetings.PLAYERXPOS = playerStartX;
			GameSetings.PLAYERYPOS = playerStartY;
			GameSetings.PLAYERMAXLEFT = playerBoundsLeft;
			GameSetings.PLAYERMAXRIGHT = playerBoundsRight;
			GameSetings.ACTOR3DPROJECTILESPEED = actor3DProjectileSpeed;
			GameSetings.ACTOR3DPROJECTILEDAMAGE = actor3DProjectileDamage;
			GameSetings.ACTOR3DPROJECTILERELOADSPEED = actor3DReload;
			GameSetings.ACTOR2DPROJECTILESPEED = actor2DProjectileSpeed;
			GameSetings.ACTOR2DPROJECTILEDAMAGE = actor2DProjectileDamage;
			GameSetings.ACTOR2DPROJECTILERELOADSPEED = actor2DReload;
			GameSetings.ACTORPROPROJECTILESPEED = actorProProjectileSpeed;
			GameSetings.ACTORPROPROJECTILEDAMAGE = actorProProjectileDamage;
			GameSetings.ACTORPROPROJECTILERELOADSPEED = actorProReload;
			GameSetings.SHAPESHIFTERHP = bugHp;
			GameSetings.SHAPESHIFTERSCORE = bugPoints;
			GameSetings.SHAPESHIFTERMOVESPEED = bugMovingSpeed;
			GameSetings.SHAPESHIFTERPROJECTILESPEED = bugProjectileSpeed;
			//GameSetings.SHAPESHIFTERPROJECTILEDAMAGE = bugProjectileDamage;
			GameSetings.SHAPESHIFTERMINSHOOTWAIT = bugMinReload;
			GameSetings.SHAPESHIFTERMAXSHOOTWAIT = bugMaxReload;
			GameSetings.ORBMOVESPEED = orbMovingSpeed;
			GameSetings.ORBSPAWNTIMER = orbRespawnTime;
			GameSetings.ORBXP = orbExp;
			GameSetings.DEATHLINEMOVESPEED = deadlineMovingSpeed;
			GameSetings.DEATHLINEMOVESPEEDINCREASERATE = deadlineAccelerate;
			GameSetings.DEATHLINESTARTHEIGHT = deadlineStartY;
			
			this.dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}
