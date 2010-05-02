package uk.co.ziazoo.fussy
{
  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.model.Method;
  import uk.co.ziazoo.fussy.query.IQuery;

  public class FussyTest
  {

    [Test]
    public function findInjectableMethods():void
    {
      var fussy:Fussy = new Fussy();
      var query:IQuery = fussy.query().findMethods().withMetadata("Inject").withArguments();

      var list:Array = query.forType(Bubbles);

      Assert.assertEquals(1, list.length);

      var method:Method = list[0] as Method;
      Assert.assertEquals(method.name, "wowowo");
      Assert.assertEquals(method.parameters.length, 2);
    }

    [Test]
    public function findInjectableProperties():void
    {
      var fussy:Fussy = new Fussy();

      var query:IQuery = fussy.query().findProperties().withMetadata("Inject");

      var list:Array = query.forType(Bubbles);

      Assert.assertEquals(1, list.length);
    }
  }
}