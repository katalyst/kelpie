package au.com.katalyst.kelpie.core
{

  public class KFactory extends Object
  {

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function KFactory(object:Object)
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

  }

}
