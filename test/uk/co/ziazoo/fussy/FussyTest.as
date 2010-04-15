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
    public function createVariableFussy():void
    {
      var fussy:Fussy = new Fussy();
      
      var query:IQuery = fussy.query().findMethods().withMetadata("Inject");
      
      var list:XMLList = query.forType(Bubbles);
      
      trace(list);
      /*
      
      var factory:XMLList = getFiltered().factory.(
      hasOwnProperty("constructor") && 
      constructor.hasOwnProperty("parameter")
      );
      
      */
    }
  }
}