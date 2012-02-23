package au.com.katalyst.kelpie.core.events
{

  import au.com.katalyst.kelpie.flash11.behaviors.*;
  import au.com.katalyst.kelpie.core.behaviors.*;

  import flash.events.*;

  public class BehaviorEvent extends Event
  {

    // CONSTANTS ///////////////////////////////////////////////////////////////////////////////////

    public static const BEHAVIOR_ASSIGNED:String = "behaviorAssigned";

    public static const BEHAVIOR_UNASSIGNED:String = "behaviorUnassigned";

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function BehaviorEvent(type:String, relatedBehavior:KelpieBehavior)
    {
      super(type);

      _relatedBehavior = relatedBehavior;
    }

    // PUBLIC PROPERTIES ///////////////////////////////////////////////////////////////////////////

    // RELATED_BEHAVIOR

    protected var _relatedBehavior:KelpieBehavior;

    public function get relatedBehavior():KelpieBehavior
    {
      return _relatedBehavior;
    }

    // PUBLIC METHODS //////////////////////////////////////////////////////////////////////////////

    /**
     * Creates a clone of the event for propagation purposes.
     *
     * @return A copy of the event.
     */
    override public function clone():Event
    {
      return new BehaviorEvent(type, relatedBehavior);
    }

    /**
     * @return A string representation of the event.
     */
    override public function toString():String
    {
      return formatToString("BehaviorEvent", "type", "bubbles", "cancelable", "eventPhase");
    }

  }

}
