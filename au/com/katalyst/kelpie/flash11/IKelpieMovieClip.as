package au.com.katalyst.kelpie.flash11
{

  import au.com.katalyst.kelpie.flash11.*;
  import au.com.katalyst.kelpie.core.*;

  public interface IKelpieMovieClip extends IKelpieObject
  {

    function add(object:*, addDisplayObjectsToStage:Boolean=false):*;

    function freeze():void;

    function fin():void;

    // Called the first time kelpieMovieClip is add to the stage.
    function init():void;

    function remove(object:*, removeDisplayObjectsFromStage:Boolean=true):*;

    function removeAll(removeDisplayObjectsFromStage:Boolean=true):void;

    function unfreeze():void;

  }

}
