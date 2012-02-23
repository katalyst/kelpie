package au.com.katalyst.kelpie.flash11.behaviors
{

  import au.com.katalyst.kelpie.core.*;
  import au.com.katalyst.kelpie.core.behaviors.*;
  import au.com.katalyst.kelpie.core.events.*;
  import au.com.katalyst.kelpie.flash11.*;
  import au.com.katalyst.kelpie.flash11.behaviors.*;

  import flash.display.*;

  public class KelpieMovieClipBehavior extends KelpieBehavior
  {

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function KelpieMovieClipBehavior(kelpieMovieClip:KelpieMovieClip)
    {
      super(kelpieMovieClip);

      addEventListener(BehaviorEvent.BEHAVIOR_ASSIGNED, behaviorAssigned, false, 0, true);
      addEventListener(BehaviorEvent.BEHAVIOR_UNASSIGNED, behaviorUnassigned, false, 0, true);
    }

    // PUBLIC PROPERTIES ///////////////////////////////////////////////////////////////////////////

    // ENTITY

    public function get kelpieMovieClip():KelpieMovieClip
    {
      return object as KelpieMovieClip;
    }

    // PUBLIC METHODS //////////////////////////////////////////////////////////////////////////////

    public function add(object:*, addDisplayObjectsToStage:Boolean=true):*
    {
      var addKelpieMovieClip:IKelpieMovieClip = object as IKelpieMovieClip;
      var addDisplayObject:DisplayObject = object as DisplayObject;

      if (addDisplayObject)
      {
        var parentKelpieMovieClip:IKelpieMovieClip = addDisplayObject.parent as IKelpieMovieClip;

        if (parentKelpieMovieClip && parentKelpieMovieClip != kelpieMovieClip) parentKelpieMovieClip.remove(addKelpieMovieClip, false);
        if (addDisplayObjectsToStage && !kelpieMovieClip.contains(addDisplayObject)) kelpieMovieClip.addChild(addDisplayObject);
      }

      if (addKelpieMovieClip && kelpieMovieClip.kelpieMovieClips.indexOf(addKelpieMovieClip) == -1) kelpieMovieClip.kelpieMovieClips[kelpieMovieClip.kelpieMovieClips.length] = addKelpieMovieClip;

      return object;
    }

    public function freeze():void
    {
      kelpieMovieClip.stop();
      for (var i:int=0; i<kelpieMovieClip.kelpieMovieClips.length; i++) kelpieMovieClip.kelpieMovieClips[i].freeze();
    }

    public function fin():void
    {
      kelpieMovieClip.initialized = false;
    }

    public function init():void
    {
      addChildEntities();
      kelpieMovieClip.initialized = true;
    }

    public function remove(object:*, removeDisplayObjectsFromStage:Boolean=true):*
    {
      var removeKelpieMovieClip:IKelpieMovieClip = object as IKelpieMovieClip;
      var removeDisplayObject:DisplayObject = object as DisplayObject;

      if (removeKelpieMovieClip) kelpieMovieClip.kelpieMovieClips.splice(kelpieMovieClip.kelpieMovieClips.indexOf(removeKelpieMovieClip), 1);
      if (removeDisplayObjectsFromStage && removeDisplayObject && kelpieMovieClip.contains(removeDisplayObject)) kelpieMovieClip.removeChild(removeDisplayObject);

      return object;
    }

    public function removeAll(removeDisplayObjectsFromStage:Boolean=true):void
    {
      for (var i:int=kelpieMovieClip.kelpieMovieClips.length; i<kelpieMovieClip.kelpieMovieClips.length; i++)
        if (removeDisplayObjectsFromStage && kelpieMovieClip.kelpieMovieClips[i] is DisplayObject && kelpieMovieClip.contains(kelpieMovieClip.kelpieMovieClips[i]))
          kelpieMovieClip.removeChild(kelpieMovieClip.kelpieMovieClips[i]);

      kelpieMovieClip.kelpieMovieClips = [];

      if (removeDisplayObjectsFromStage) while (kelpieMovieClip.numChildren) kelpieMovieClip.removeChildAt(0);
    }

    public function unfreeze():void
    {
      kelpieMovieClip.play();
      for (var i:int=0; i<kelpieMovieClip.kelpieMovieClips.length; i++) kelpieMovieClip.kelpieMovieClips[i].unfreeze();
    }

    override public function update():void
    {
      super.update();
      updateEntities();
    }

    // PROTECTED METHODS ///////////////////////////////////////////////////////////////////////////

    protected function addChildEntities():void
    {
      var child:IKelpieMovieClip;

      for (var i:int=0; i<kelpieMovieClip.numChildren; i++)
      {
        child = kelpieMovieClip.getChildAt(i) as IKelpieMovieClip;
        if (child) kelpieMovieClip.add(child, false);
      }
    }

    protected function behaviorAssigned(event:BehaviorEvent):void
    {
      return;
    }

    protected function behaviorUnassigned(event:BehaviorEvent):void
    {
      return;
    }

    protected function updateEntities():void
    {
      for (var i:int=0; i<kelpieMovieClip.kelpieMovieClips.length; i++) kelpieMovieClip.kelpieMovieClips[i].update();
    }

  }

}
