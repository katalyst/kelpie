package au.com.katalyst.kelpie.flash11
{

  import au.com.katalyst.kelpie.flash11.*;
  import au.com.katalyst.kelpie.utils.*;

  import flash.display.*;
  import flash.events.*;

  public class KBase extends KElement
  {

    // PUBLIC METHODS //////////////////////////////////////////////////////////////////////////////

    override public function init():void
    {
      super.init();

      Input.enable(this);
    }

    override public function fin():void
    {
      super.fin();

      // TODO: Disable.
      // Input.disable(this);
    }

    override public function update():void
    {
      super.update();

      Input.update();
    }

    // PUBLIC PROPERTIES ///////////////////////////////////////////////////////////////////////////

    // SCREEN

    protected var _screen:KScreen;

    public function get screen():KScreen
    {
      return _screen;
    }

    public function set screen(value:KScreen):void
    {
      if (value != _screen)
      {
        if (_screen) removeChild(_screen);

        _screen = value;

        if (_screen) addChild(_screen);
      }
    }

  }

}
