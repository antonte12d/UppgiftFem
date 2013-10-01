package 
{
	import adobe.utils.CustomActions;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * NTI Kornhusgatan
	 * Anton Pettersson
	 * TE12D
	 */
	public class Main extends Sprite 
	{
		// Player Attribute
		private const PLAYER:String = "Human";
		private var playerHP:int = 75;
		private var playerStrength:int = 15;
		private var playerDefence:int = 5;
		private var playerDamage:int;
		
		// Enemy Attribute
		private const ENEMY:String = "Monster";
		private var enemyHP:int = 100;
		private var enemyStrength:int = 18;
		private var enemyDefence:int = 8;
		private var enemyDamage:int;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var t:TextField = new TextField;
			t.width = 800;
			t.height = 600;
			
			
			
			//Generating Rounds
			for (var i:int = 0; i <= 4; i++) 
			{
				// Generating Damage to HP
				playerDamage = Math.random() * (playerStrength - enemyDefence);
				enemyDamage = Math.random() * (enemyStrength - playerDefence);
				playerHP -= enemyDamage;
				enemyHP -= playerDamage;
				
				t.appendText("Round " + (i + 1) + "\n" + PLAYER + " deals " + playerDamage + " damage " + ENEMY + " has " + enemyHP +
				" HP left.\n" + ENEMY + " deals " + enemyDamage + " damage " + PLAYER + " has " + playerHP + " HP left.\n\n")
				addChild(t);
			}
		}
	}
	
}