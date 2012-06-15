package au.com.katalyst.kelpie.utils
{

  public function shuffle(array:Array):Array
  {
    var m:int = array.length;
    var t:*;
    var i:int;

    while (m)
    {
      i = Math.floor(Math.random()*m--);
      t = array[m];
      array[m] = array[i];
      array[i] = t;
    }

    return array;
  }

}
