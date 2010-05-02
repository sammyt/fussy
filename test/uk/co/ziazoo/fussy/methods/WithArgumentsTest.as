package uk.co.ziazoo.fussy.methods
{
  import flash.utils.describeType;

  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Bubbles;

  public class WithArgumentsTest
  {
    private var methods:XMLList;

    public function WithArgumentsTest()
    {
    }

    [Before]
    public function setUp():void
    {
      methods = describeType(Bubbles).factory.method;
    }

    [After]
    public function tearDown():void
    {
      methods = null;
    }

    [Test]
    public function noNeededArgs():void
    {
      var withArgs:WithArguments = new WithArguments();
      var result:XMLList = withArgs.filter(methods);
      Assert.assertNotNull(result);
      Assert.assertTrue(result.length() == 3);
    }
  }
}