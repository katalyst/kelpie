package au.com.katalyst.kelpie.core.utils
{

  import au.com.katalyst.kelpie.core.*;

  public class KelpieObjectList extends Object
  {

    // CONSTRUCTOR /////////////////////////////////////////////////////////////////////////////////

    public function KelpieObjectList()
    {
      super();

      objects = [];
    }

    // PROTECTED PROPERTIES ////////////////////////////////////////////////////////////////////////

    protected var objects:Array;

    // PUBIC METHODS ///////////////////////////////////////////////////////////////////////////////

    public function add(object:IUpdateObject):void
    {
      var index:int = objects.indexOf(object);

      if (index == -1) objects.push(object);
    }

    public function remove(object:IUpdateObject):void
    {
      var index:int = objects.indexOf(object);

      if (index != -1) objects.splice(index, 1);
    }

    public function update():void
    {
      for (var i:int=0; i<objects.length; i++) objects[i].update();
    }

  }

}
