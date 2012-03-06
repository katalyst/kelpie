package au.com.katalyst.kelpie.flash11
{

  import au.com.katalyst.kelpie.flash11.*;
  import au.com.katalyst.kelpie.flash11.behaviors.*;

  public class KelpieEntity extends KelpieMovieClip
  {

    // PUBLIC METHODS //////////////////////////////////////////////////////////////////////////////

    override public function fin():void
    {
      super.fin();
      behavior = getFinBehavior();
      updateBehavior();
    }

    override public function init():void
    {
      super.init();
      behavior = getInitBehavior();
      updateBehavior();
    }

    public function reset():void
    {
      if (initialized) fin();
      if (!initialized) init();
    }

    // PROTECTED METHODS ///////////////////////////////////////////////////////////////////////////

    protected function getFinBehavior():KelpieMovieClipBehavior
    {
      return null;
    }

    protected function getInitBehavior():KelpieMovieClipBehavior
    {
      return null;
    }

  }

}
