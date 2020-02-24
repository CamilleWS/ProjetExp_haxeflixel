package;

import flash.system.System;
import flixel.FlxG;
import flixel.FlxSprite;
// import flixel.FlxTimer;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.math.FlxPoint;
import flixel.math.FlxAngle;
import flixel.util.FlxColor;
import flixel.util.FlxCollision;
import flixel.group.FlxGroup;
import openfl.display.FPS;
using flixel.util.FlxSpriteUtil;
import flixel.FlxG;
import flixel.util.FlxDestroyUtil.IFlxDestroyable;
using StringTools;

class PlayState extends FlxState
{
	var aliens:FlxTypedGroup<FlxSprite>;

	var _player:Player;

	var life:Int = 3;

	var score:Int = 0;

	var textlife:flixel.text.FlxText;

	var textscore:flixel.text.FlxText;

	// var timer:flixel.FlxTimer;

	override public function create():Void
	{
		super.create();

		// timer.start(1000, false, 1);

		textlife = new flixel.text.FlxText(0, 0, 0, "Life = " + life, 24);
		// textlife.screenCenter();
		add(textlife);

		textscore = new flixel.text.FlxText(0, 0, 0, "" + score, 24);
		textscore.screenCenter();
		add(textscore);

		_player = new Player(20, 20);
		add(_player);

		add(aliens = new FlxTypedGroup<FlxSprite>());
		for (i in 1...50) {
			var alien = aliens.recycle(FlxSprite);
			var posx = FlxG.random.int(0, 5000);
			var posy = FlxG.random.int(0, Std.int(FlxG.height));
			alien.setPosition(posx, posy);
			alien.loadGraphic("assets/alien.png", true); // load graphics from asset
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		mouvAliens();
		checkCollision();
		respawnPoint();
		// if (timer.finished)
		// 	{
				score = score + 1;
				textscore.text = "" + score;
				// timer.reset();
			// }
	}

	public function mouvAliens() {
		for (i in 0...aliens.length) 
		{
			aliens.members[i].velocity.set(200, 0);
            aliens.members[i].velocity.rotate(FlxPoint.weak(0, 0), 180);
		}
	}

	public function respawnPoint() {
		for (i in 0...aliens.length) 
		{
			var alien = aliens.members[i];
			if (alien.x < 0 && alien.y > 0 && alien.y < FlxG.height) {
				var posx = FlxG.random.int(Std.int(FlxG.width), 500);
				var posy = FlxG.random.int(0, Std.int(FlxG.height));
				alien.setPosition(posx, posy);
			}
		}
	}

	public function checkCollision() {
		for (i in 0...aliens.length) 
		{
			var alien = aliens.members[i];
			if (FlxCollision.pixelPerfectCheck(alien, _player, 1)) {
				life = life - 1;
				alien.setPosition(-100, 0);
				textlife.text = "Life : " + life;
			}
		}
		if (life <= 0) {
			clickPlay();
		}
	}

	function clickPlay():Void
	{
		FlxG.switchState(new MenuState());
	}
}