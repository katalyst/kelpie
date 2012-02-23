package au.com.katalyst.kelpie.core
{

  import au.com.katalyst.kelpie.flash11.behaviors.*;
  import au.com.katalyst.kelpie.core.behaviors.*;
  import au.com.katalyst.kelpie.core.utils.*;

  public interface IKelpieObject extends IUpdateObject
  {

      // PROPERTIES ////////////////////////////////////////////////////////////////////////////////

      // BEHAVIOR

      function get behavior():KelpieBehavior;

      function set behavior(value:KelpieBehavior):void;

      // KELPIE OBJECT LIST

      function get kelpieObjectList():KelpieObjectList;

  }

}
