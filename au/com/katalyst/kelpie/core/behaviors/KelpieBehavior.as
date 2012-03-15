package au.com.katalyst.kelpie.core.behaviors
{

  import au.com.katalyst.kelpie.flash11.*;
  import au.com.katalyst.kelpie.core.*;

  import flash.events.*;

  public class KelpieBehavior extends EventDispatcher
  {

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function KelpieBehavior(object:IKelpieObject)
    {
      super();

      _object = object;
    }

    // PUBLIC PROPERTIES ///////////////////////////////////////////////////////////////////////////

    // OBJECT

    protected var _object:IKelpieObject;

    public function get object():IKelpieObject
    {
      return _object;
    }

    // PUBLIC METHODS //////////////////////////////////////////////////////////////////////////////

    public function assigned():void
    {
      return;
    }

    public function unassigned():void
    {
      return;
    }

    public function update():void
    {
      object.kelpieObjectList.update(); // DEPRECATED
    }

  }

}
