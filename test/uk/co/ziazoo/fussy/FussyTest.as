package uk.co.ziazoo.fussy
{
  import flash.utils.describeType;

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
    public function filterByArgsLength():void
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
    public function letsSee():void
    {
      var a:XML = describeType(Thing);
      trace(a);

      var ns:Namespace = new Namespace("inject.demo");
      var thing:Thing = new Thing();
      var f:* = ns::thing["doItBacon"];

      trace(f);
    }


    [Test]
    public function issue3Test():void
    {
      var fussy:Fussy = new Fussy();
      var query1:IQuery = fussy.query().findVariables().withMetadata("Fussy");
      var list1:Array = query1.forType(Bubbles);

      Assert.assertEquals(list1.length, 1);
      trace("list1.length:", list1.length);
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