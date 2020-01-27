# Haxe - Projet Expérience

## Installer Haxe

Sur http://haxeflixel.com/documentation/getting-started/ installez Haxe et HaxeFlixel
et faites le HelloWorld proposé.

Suivez les instructions sur http://haxeflixel.com/documentation/groundwork/ pour créer un button qui va permettre de passer du MainMenu au jeu.

Une fois cela fait vous devriez avoir ceci :

### Main.hx :

    package;

    import flixel.FlxGame;
    import openfl.display.Sprite;

    class Main extends Sprite
    {
        public function new()
        {
            super();
            addChild(new FlxGame(0, 0, MenuState));
        }
    }


### PlayState.hx :

    package;

    import flixel.FlxState;

    class PlayState extends FlxState
    {
        override public function create():Void
        {
            super.create();
            var text = new flixel.text.FlxText(0, 0, 0, "Hello World", 24);
            text.screenCenter();
            add(text);
        }

        override public function update(elapsed:Float):Void
        {
            super.update(elapsed);
        }
    }


### MenuState.hx :

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
            add(_btnPlay);
        }

        override public function update(elapsed:Float):Void
        {
            super.update(elapsed);
        }
    }
