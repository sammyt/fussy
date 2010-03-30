package uk.co.ziazoo.fussy
{
  import flash.utils.describeType;
  
  import org.flexunit.Assert;

  public class VariableQueryTest
  {		
    [Test]
    public function filterOnType():void
    {
      var variables:VariableQuery = new VariableQuery(describeType(Bubbles));
      var strings:XMLList = variables.ofType(String).getResult();
      Assert.assertTrue("found 2", strings.length() == 2);
    }
    
    [Test]
    public function filterOnMetadata():void
    {
      var variables:VariableQuery = new VariableQuery(describeType(Bubbles));
      var fussyLot:XMLList = variables.withMetadata("Fussy").getResult()
      Assert.assertTrue("only 1", fussyLot.length() == 1);
    }
    
    [Test]
    public function filterOnMetadataAndType():void
    {
      var variables:VariableQuery = new VariableQuery(describeType(Bubbles));
      var fussyLot:XMLList = variables.withMetadata("Fussy").ofType(String).getResult();
      Assert.assertTrue("only 1", fussyLot.length() == 1);
    }
    
    [Test]
    public function filterOnMetadataAndTypeNotThere():void
    {
      var variables:VariableQuery = new VariableQuery(describeType(Bubbles));
      var fussyLot:XMLList = variables.withMetadata("Fussy").ofType(Array).getResult();
      Assert.assertTrue("there are none", fussyLot.length() == 0);
    }
  }
}