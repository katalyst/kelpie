package au.com.katalyst.kelpie.flashpunk
{

  import au.com.katalyst.kelpie.flash11.*;
  import au.com.katalyst.kelpie.core.*;
  import au.com.katalyst.kelpie.flash11.behaviors.*;
  import au.com.katalyst.kelpie.core.behaviors.*;
  import au.com.katalyst.kelpie.core.events.*;
  import au.com.katalyst.kelpie.core.utils.*;

  import net.flashpunk.*;

  public class KelpieEntity extends Entity implements IKelpieObject
  {

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function KelpieEntity()
    {
      super();

      _kelpieObjectList = new KelpieObjectList();
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

      if (!_behavior) updateBehavior();
    }

    // KELPIE OBJECT LIST

    protected var _kelpieObjectList:KelpieObjectList;

    public function get kelpieObjectList():KelpieObjectList
    {
      return _kelpieObjectList;
    }

    // PROTECTED PROPERTIES ////////////////////////////////////////////////////////////////////////

    protected var newBehavior:KelpieBehavior;

    // PUBLIC METHODS //////////////////////////////////////////////////////////////////////////////

    override public function added():void
    {
      super.added();

      behavior = getInitBehavior();
      updateBehavior();
    }

    override public function removed():void
    {
      super.removed();

      behavior = getFinBehavior();
      updateBehavior();
    }

    override public function update():void
    {
      super.update();
      if (behavior) behavior.update();
      updateBehavior();
    }

    // PROTECTED METHODS ///////////////////////////////////////////////////////////////////////////

    protected function getFinBehavior():KelpieBehavior
    {
      return null;
    }

    protected function getInitBehavior():KelpieBehavior
    {
      return null;
    }

    protected function updateBehavior():void
    {
      if (this.newBehavior)
      {
        var newBehavior:KelpieBehavior = this.newBehavior;

        this.newBehavior = null;

        if (newBehavior != _behavior)
        {
          var oldBehavior:KelpieBehavior = _behavior;

          if (_behavior)
          {
            _behavior.dispatchEvent(new BehaviorEvent(BehaviorEvent.BEHAVIOR_UNASSIGNED, newBehavior)); // DEPRECATED
            _behavior.unassigned();
          }

          _behavior = newBehavior;

          if (_behavior)
          {
            _behavior.dispatchEvent(new BehaviorEvent(BehaviorEvent.BEHAVIOR_ASSIGNED, oldBehavior)); // DEPRECATED
            _behavior.assigned();
          }
        }

        if (this.newBehavior != null) updateBehavior();
      }
    }

  }

}
