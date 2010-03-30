package uk.co.ziazoo.fussy 
{
  /**
   * nothing useful here yet, just demos of the api
   */ 
  public class FussyTest
  {		
    [Test]
    public function createMethodFussy():void
    {
      var fussy:Fussy = new Fussy();
      var query:IQuery = fussy.forType(Bubbles).findMethods().withMetadata("Inject");
    }
    
    [Test]
    public function createVariableFussy():void
    {
      var fussy:Fussy = new Fussy();
      var query:IQuery = fussy.forType(Bubbles).findVariables().ofType(String);
    }
  }
}