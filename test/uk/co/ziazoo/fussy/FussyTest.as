package uk.co.ziazoo.fussy 
{
  import uk.co.ziazoo.fussy.query.IQuery;
  import uk.co.ziazoo.fussy.query.Query;

  /**
   * nothing useful here yet, just demos of the api
   */ 
  public class FussyTest
  {		
    [Test]
    public function createMethodFussy():void
    {
      var fussy:Fussy = new Fussy();
      var filter:IFilter = fussy.forType(Bubbles).findMethods().withMetadata("Inject");
    }
    
    [Test]
    public function createVariableFussy():void
    {
      var fussy:Fussy = new Fussy();
      var filter:IFilter = fussy.forType(Bubbles).findVariables().ofType(String);
      
      var query:IQuery = fussy.query().findMethods().named("getThing");
      
      query.forType(Bubbles);
    }
  }
}