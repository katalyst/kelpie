package au.com.katalyst.kelpie.core
{

  public class KBehavior extends Object
  {

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function KBehavior(object:Object)
    {
      super();

      _object = object;
    }

    // PUBLIC PROPERTIES ///////////////////////////////////////////////////////////////////////////

    // OBJECT

    protected var _object:Object;

    public function get object():Object
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

  }

}
