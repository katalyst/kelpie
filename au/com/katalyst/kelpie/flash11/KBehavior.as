package au.com.katalyst.kelpie.flash11
{

  import au.com.katalyst.kelpie.core.*;
  import au.com.katalyst.kelpie.flash11.*;

  public class KBehavior extends au.com.katalyst.kelpie.core.KBehavior
  {

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function KBehavior(element:KElement)
    {
      super(element);
    }

    // PUBLIC PROPERTIES ///////////////////////////////////////////////////////////////////////////

    public function get element():KElement
    {
      return object as KElement;
    }

    // PUBLIC METHODS //////////////////////////////////////////////////////////////////////////////

    public function update():void
    {
      return;
    }

  }

}
