package au.com.katalyst.kelpie.flash11
{

  import au.com.katalyst.kelpie.core.behaviors.*;
  import au.com.katalyst.kelpie.core.events.*;
  import au.com.katalyst.kelpie.core.utils.*;
  import au.com.katalyst.kelpie.flash11.behaviors.*;

  import flash.display.*;
  import flash.events.*;
  import flash.geom.*;

  public class KelpieMovieClip extends MovieClip implements IKelpieMovieClip
  {

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function KelpieMovieClip()
    {
      super();

      behavior = new KelpieMovieClipBehavior(this);
      kelpieMovieClips = [];
      initialized = false;
      _kelpieObjectList = new KelpieObjectList();
      keysDown = [];
      mouseClicked = false;
      mouseClickedThis = false;

      addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);
      addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage, false, 0, true);
    }

    // PUBLIC PROPERTIES ///////////////////////////////////////////////////////////////////////////

    // BEHAVIOR

    protected var _behavior:KelpieBehavior;

    public function get behavior():KelpieBehavior
    {
      return _behavior;
    }

    public function set behavior(value:KelpieBehavior):void
    {
      newBehavior = value;
    }

    // ENTITY BEHAVIOR

    public function get kelpieMovieClipBehavior():Object
    {
      return behavior as KelpieMovieClipBehavior;
    }

    // ENTITIES

    public var kelpieMovieClips:Array;

    // INITIALIZED

    public var initialized:Boolean;

    // KELPIE OBJECT LIST

    protected var _kelpieObjectList:KelpieObjectList;

    public function get kelpieObjectList():KelpieObjectList
    {
      return _kelpieObjectList;
    }

    // KEYS_DOWN

    public var keysDown:Array;

    // MOUSE_CLICKED

    public var mouseClicked:Boolean;

    // MOUSE_CLICKED_THIS

    public var mouseClickedThis:Boolean;

    // PROTECTED PROPERTIES ////////////////////////////////////////////////////////////////////////

    protected var newBehavior:KelpieBehavior;

    // PUBLIC METHODS //////////////////////////////////////////////////////////////////////////////

    public function add(object:*, addDisplayObjectsToStage:Boolean=true):*
    {
      return kelpieMovieClipBehavior ? kelpieMovieClipBehavior.add(object, addDisplayObjectsToStage) : null;
    }

    public function freeze():void
    {
      if (kelpieMovieClipBehavior) kelpieMovieClipBehavior.freeze();
    }

    public function fin():void
    {
      if (kelpieMovieClipBehavior) kelpieMovieClipBehavior.fin();

      removeEventListener(Event.ENTER_FRAME, enterFrame);
      removeEventListener(Event.EXIT_FRAME, exitFrame);
      removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
    }

    public function init():void
    {
      updateBehavior();

      if (kelpieMovieClipBehavior) kelpieMovieClipBehavior.init();

      addEventListener(Event.ENTER_FRAME, enterFrame, false, 0, true);
      addEventListener(Event.EXIT_FRAME, exitFrame, false, 0, true);
      addEventListener(MouseEvent.MOUSE_DOWN, mouseDown, false, 0, true);
    }

    public function getClass():Class
    {
      return Object(this).constructor;
    }

    public function getGlobalPosition():Point
    {
      return localToGlobal(new Point(0, 0));
    }

    public function remove(object:*, removeDisplayObjectsFromStage:Boolean=true):*
    {
      return kelpieMovieClipBehavior ? kelpieMovieClipBehavior.remove(object, removeDisplayObjectsFromStage) : null;
    }

    public function removeAll(removeDisplayObjectsFromStage:Boolean=true):void
    {
      if (kelpieMovieClipBehavior) kelpieMovieClipBehavior.removeAll(removeDisplayObjectsFromStage);
    }

    public function stopAll():void
    {
      stop();
      for (var i:int=0; i<kelpieMovieClips.length; i++) kelpieMovieClips[i].stopAll();
    }

    public function unfreeze():void
    {
      if (kelpieMovieClipBehavior) kelpieMovieClipBehavior.unfreeze();
    }

    public function update():void
    {
      if (behavior) behavior.update();
    }

    // PRIVATE METHODS /////////////////////////////////////////////////////////////////////////////

    protected function addedToStage(event:Event):void
    {
      if (!initialized) init();

      stage.addEventListener(KeyboardEvent.KEY_DOWN, stageKeyDown, false, 0, true);
      stage.addEventListener(KeyboardEvent.KEY_UP, stageKeyUp, false, 0, true);
      stage.addEventListener(MouseEvent.MOUSE_DOWN, stageMouseDown, false, 0, true);
    }

    protected function enterFrame(event:Event):void
    {
      return;
    }

    protected function exitFrame(event:Event):void
    {
      mouseClicked = false;
      mouseClickedThis = false;

      updateBehavior();
    }

    protected function mouseDown(event:MouseEvent):void
    {
      mouseClickedThis = true;
    }

    protected function removedFromStage(event:Event):void
    {
      stage.removeEventListener(KeyboardEvent.KEY_DOWN, stageKeyDown);
      stage.removeEventListener(KeyboardEvent.KEY_UP, stageKeyUp);
      stage.removeEventListener(MouseEvent.MOUSE_DOWN, stageMouseDown);
    }

    protected function stageKeyDown(event:KeyboardEvent):void
    {
      keysDown[event.keyCode] = true;
    }

    protected function stageKeyUp(event:KeyboardEvent):void
    {
      keysDown[event.keyCode] = false;
    }

    protected function stageMouseDown(event:MouseEvent):void
    {
      mouseClicked = true;
    }

    protected function updateBehavior():void
    {
      var newBehavior:KelpieBehavior = this.newBehavior;

      this.newBehavior = null;

      if (newBehavior)
      {
        if (newBehavior != _behavior)
        {
          var oldBehavior:KelpieBehavior = _behavior;

          if (_behavior) _behavior.dispatchEvent(new BehaviorEvent(BehaviorEvent.BEHAVIOR_UNASSIGNED, newBehavior));

          _behavior = newBehavior;

          if (_behavior) _behavior.dispatchEvent(new BehaviorEvent(BehaviorEvent.BEHAVIOR_ASSIGNED, oldBehavior));
        }

        if (this.newBehavior != null) updateBehavior();
      }
    }

  }

}
