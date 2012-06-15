package au.com.katalyst.kelpie.flash11
{

  import au.com.katalyst.kelpie.flash11.*;

  public class KComponent extends KElement
  {

    // PUBLIC PROPERTIES ///////////////////////////////////////////////////////////////////////////

    // ENGINE

    public function get base():KBase
    {
      if (root is KBase) return root as KBase;
      if (parent is KBase) return parent as KBase;
      if (parent is KComponent) return (parent as KComponent).base;
      return null;
    }

    // SCREEN

    public function get screen():KScreen
    {
      if (parent is KScreen) return parent as KScreen;
      if (parent is KComponent) return (parent as KComponent).screen;
      return null;
    }

  }

}
