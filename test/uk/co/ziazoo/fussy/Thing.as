package uk.co.ziazoo.fussy
{
  use namespace demo;
  use namespace nibble;

  public class Thing
  {
    public function Thing()
    {
    }

    demo function imInDemoNameSpace():void
    {

    }

    nibble function doItBacon():void
    {

    }

    demo function doItBacon():void
    {

    }
  }
}

namespace nibble = "inject.nibble";
namespace foo = "inject.foo";
