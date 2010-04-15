package uk.co.ziazoo.fussy.methods
{
  import flash.utils.describeType;
  
  import org.flexunit.Assert;
  
  import uk.co.ziazoo.fussy.Bubbles;
  
  public class NoArgsTest
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
    public function noNeededArgs():void
    {
      var noArgs:NoArgs = new NoArgs();
      var result:XMLList = noArgs.filter(methods);
      Assert.assertNotNull(result);
      Assert.assertTrue(result.length() == 1);
    }
  }
}