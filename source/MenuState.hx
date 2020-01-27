package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{
    function clickPlay():Void
    {
        FlxG.switchState(new PlayState());
    }

	override public function create():Void
	{
        super.create();
        
        var _btnPlay:FlxButton;
        _btnPlay = new FlxButton(10, 10, "Play", clickPlay);
        _btnPlay.screenCenter();

		var _title = new flixel.text.FlxText(20, 5, 0, "Flappy cui'cui'", 22);
        var _subTitle = new flixel.text.FlxText(350, 450, 0, "By Benjamin.R & Camille.V", 14);

        add(_title);
        add(_subTitle);
        add(_btnPlay);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
