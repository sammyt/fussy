package uk.co.ziazoo.fussy.methods
{
  import flash.utils.describeType;

  import uk.co.ziazoo.fussy.Bubbles;

  public class MethodQueryChainTest
  {
    private var methodsList:XMLList;

    [Before]
    public function setUp():void
    {
      var tmp:XML = describeType(Bubbles);
      methodsList = tmp.factory.method;
    }

    [After]
    public function tearDown():void
    {
      methodsList = null;
    }

    [Test]
    public function createNameQuery():void
    {
      var chain:MethodQueryChain = new MethodQueryChain(null);
      chain.named("wowowo");
    }
  }
}