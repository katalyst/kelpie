package au.com.katalyst.kelpie.flash11
{

  import au.com.katalyst.kelpie.flash11.*;

  public class KScreen extends KElement
  {

    // NAMESPACES //////////////////////////////////////////////////////////////////////////////////

    public namespace kelpie = "http://katalyst.com.au/kelpie";

    // PUBLIC PROPERTIES ///////////////////////////////////////////////////////////////////////////

    // BASE

    kelpie function get base():KBase
    {
      return parent as KBase;
    }

  }

}
