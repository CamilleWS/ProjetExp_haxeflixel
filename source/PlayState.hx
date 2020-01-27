package;

import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		var text = new flixel.text.FlxText(0, 0, 0, "-- { Game here } --", 24);
		text.screenCenter();
		add(text);

		var _player:Player;
		_player = new Player(20, 20);
		add(_player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
