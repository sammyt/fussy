package uk.co.ziazoo.fussy
{
  import uk.co.ziazoo.fussy.query.IQuery;

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

      var list:Array = query.forType(Bubbles);
    }
  }
}