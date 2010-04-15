package uk.co.ziazoo.fussy.methods
{
  import flash.utils.describeType;
  
  import org.flexunit.Assert;
  
  import uk.co.ziazoo.fussy.Bubbles;

  public class NamedTest
  {
    private var methods:XMLList;
    
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
    public function getOne():void
    {
      var named:Named = new Named("wowowo");
      var result:XMLList = named.filter(methods);
      Assert.assertNotNull(result);
      Assert.assertTrue(result.length() == 1);
      Assert.assertTrue(String(result.@name) == "wowowo" );
    }
  }
}