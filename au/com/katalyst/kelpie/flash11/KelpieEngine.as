package au.com.katalyst.kelpie.flash11
{

  import flash.events.*;

  import au.com.katalyst.kelpie.flash11.*;

  public class KelpieEngine extends KelpieWorld
  {

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function KelpieEngine()
    {
      super();
    }

    // PROTECTED METHODS ///////////////////////////////////////////////////////////////////////////

    override protected function enterFrame(event:Event):void
    {
      update();
    }

  }

}
