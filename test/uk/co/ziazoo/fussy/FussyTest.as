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

    [Test]
    public function findInjectableVars():void
    {
      var fussy:Fussy = new Fussy();
      var query:IQuery = fussy.query().findVariables().withMetadata("Inject");

      var list:Array = query.forType(Bubbles);

      Assert.assertEquals(0, list.length);
    }

    [Test]
    public function filterBySignature():void
    {
      var fussy:Fussy = new Fussy();
      var query:IQuery = fussy.query().findMethods().withTypeSignature(int, String);

      var list:Array = query.forType(Bubbles);
      Assert.assertEquals(1, list.length);

      var method:Method = list[0] as Method;
      Assert.assertEquals(method.name, "wowowo");
    }

    [Test]
    public function filterByArgsLengh():void
    {
      var fussy:Fussy = new Fussy();
      var query:IQuery = fussy.query().findMethods().withArgsLengthOf(1);

      var list:Array = query.forType(Bubbles);
      Assert.assertEquals(1, list.length);

      var method:Method = list[0] as Method;
      Assert.assertEquals(method.name, "doIt");
    }

    [Test]
    [Ignore]
    public function getTypeDescription():void
    {
      var fussy:Fussy = new Fussy();
      var description:TypeDescription = fussy.query().getTypeQuery().forType(Bubbles);
    }
  }
}