package uk.co.ziazoo.fussy
{
  import flash.utils.describeType;
  
  import org.flexunit.Assert;

  public class PropertyQueryTest
  {
    [Test]
    public function filterOnType():void
    {
      var properties:PropertyQuery = new PropertyQuery(describeType(Bubbles));
      var strings:XMLList = properties.ofType(String).getResult();
      Assert.assertTrue("found 3", strings.length() == 3);
    }
    
    [Test]
    public function filterOnMetadata():void
    {
      var properties:PropertyQuery = new PropertyQuery(describeType(Bubbles));
      var fussyLot:XMLList = properties.withMetadata("Fussy").getResult()
      Assert.assertTrue("one var, one accessor", fussyLot.length() == 2);
    }
    
    [Test]
    public function filterOnMetadataAndType():void
    {
      var properties:PropertyQuery = new PropertyQuery(describeType(Bubbles));
      var fussyLot:XMLList = properties.withMetadata("Fussy").ofType(String).getResult();
      Assert.assertTrue("one var, one accessor", fussyLot.length() == 2);
    }
    
    [Test]
    public function filterOnMetadataAndTypeNotThere():void
    {
      var properties:PropertyQuery = new PropertyQuery(describeType(Bubbles));
      var fussyLot:XMLList = properties.withMetadata("Fussy").ofType(Array).getResult();
      Assert.assertTrue("there are none", fussyLot.length() == 0);
    }
  }
}