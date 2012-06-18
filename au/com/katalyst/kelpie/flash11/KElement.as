package au.com.katalyst.kelpie.flash11
{

  import au.com.katalyst.kelpie.flash11.*;

  import flash.display.*;
  import flash.events.*;

  public class KElement extends MovieClip
  {

    // NAMESPACES //////////////////////////////////////////////////////////////////////////////////

    public namespace kelpie = "http://katalyst.com.au/kelpie";

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function KElement()
    {
      super();

      autoInitialize = true;
      autoFinalize = true;
      _behavior = null;
      _initialized = false;
      updateOnEnterFrame = true;

      addEventListener(Event.ADDED_TO_STAGE, kelpie::addedToStage, false, 0, true);
    }

    // PUBLIC PROPERTIES ///////////////////////////////////////////////////////////////////////////

    // AUTO FINALIZE

    public var autoFinalize:Boolean;

    // AUTO INITIALIZE

    public var autoInitialize:Boolean;

    // BEHAVIOR

    protected var _behavior:KBehavior;

    public function get behavior():KBehavior
    {
      return _behavior;
    }

    public function set behavior(value:KBehavior):void
    {
      newBehavior = value;
    }

    // INITIALIZED

    protected var _initialized:Boolean;

    public function get initialized():Boolean
    {
      return _initialized;
    }

    // UPDATE ON ENTER FRAME

    public var updateOnEnterFrame:Boolean;

    // PROTECTED PROPERTIES ////////////////////////////////////////////////////////////////////////

    protected var newBehavior:KBehavior;

    // PUBLIC METHODS //////////////////////////////////////////////////////////////////////////////

    public function fin():void
    {
      behavior = kelpie::getFinBehavior();
      updateBehavior();

      removeEventListener(Event.ENTER_FRAME, kelpie::enterFrame);
    }

    public function init():void
    {
      behavior = kelpie::getInitBehavior();
      updateBehavior();

      if (updateOnEnterFrame) addEventListener(Event.ENTER_FRAME, kelpie::enterFrame, false, 0, true);
    }

    public function update():void
    {
      if (behavior) behavior.update();
    }

    // KELPIE METHODS //////////////////////////////////////////////////////////////////////////////

    kelpie function addedToStage(event:Event):void
    {
      removeEventListener(Event.ADDED_TO_STAGE, kelpie::addedToStage);

      if (!initialized && autoInitialize)
      {
        init();
        _initialized = true;
      }

      addEventListener(Event.EXIT_FRAME, kelpie::exitFrame, false, 0, true);
      addEventListener(Event.REMOVED_FROM_STAGE, kelpie::removedFromStage, false, 0, true);
    }

    kelpie function enterFrame(event:Event):void
    {
      update();
    }

    kelpie function exitFrame(event:Event):void
    {
      updateBehavior();
    }

    kelpie function getInitBehavior():KBehavior
    {
      return new KBehavior(this);
    }

    kelpie function getFinBehavior():KBehavior
    {
      return new KBehavior(this);
    }

    kelpie function removedFromStage(event:Event):void
    {
      removeEventListener(Event.EXIT_FRAME, kelpie::exitFrame);
      removeEventListener(Event.REMOVED_FROM_STAGE, kelpie::removedFromStage);

      if (initialized && autoFinalize)
      {
        fin();
        _initialized = false;
      }

      addEventListener(Event.ADDED_TO_STAGE, kelpie::addedToStage, false, 0, true);
    }

    protected function updateBehavior():void
    {
      var newBehavior:KBehavior = this.newBehavior;

      this.newBehavior = null;

      if (newBehavior)
      {
        if (newBehavior != _behavior)
        {
          var oldBehavior:KBehavior = _behavior;

          if (_behavior) _behavior.unassigned();

          _behavior = newBehavior;

          if (_behavior) _behavior.assigned();
        }

        if (this.newBehavior != null) updateBehavior();
      }
    }

  }

}
