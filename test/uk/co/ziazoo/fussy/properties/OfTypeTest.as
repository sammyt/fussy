package uk.co.ziazoo.fussy.properties
{
  import flash.utils.describeType;
  
  import org.flexunit.Assert;
  
  import uk.co.ziazoo.fussy.Bubbles;
  import uk.co.ziazoo.fussy.properties.OfType;
  
  public class OfTypeTest
  {
    private var properties:XMLList;
    
    [Before]
    public function setUp():void
    {
      var description:XML = describeType(Bubbles);
      var p:XMLList = new XMLList(<root/>);
      p.appendChild(description.factory.variable);
      p.appendChild(description.factory.accessor);
      properties = p.*; 
    }
    
    [After]
    public function tearDown():void
    {
      properties = null;
    }
    
    [Test]
    public function all_props_of_string():void
    {
      var ofType:OfType = new OfType(String);
      var result:XMLList = ofType.filter(properties);
      Assert.assertNotNull(result);
      Assert.assertTrue(result.length() == 3);
    }
  }
}