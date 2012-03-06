package au.com.katalyst.kelpie.flash11
{

  import au.com.katalyst.kelpie.flash11.*;

  import flash.events.*;

  public class KelpieWorld extends KelpieEntity
  {

    // PROTECTED METHODS ///////////////////////////////////////////////////////////////////////////

    override protected function removedFromStage(event:Event):void
    {
      super.removedFromStage(event);
      if (initialized) fin();
    }

  }

}
