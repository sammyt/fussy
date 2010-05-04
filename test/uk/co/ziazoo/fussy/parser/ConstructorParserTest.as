package uk.co.ziazoo.fussy.parser
{
  import flash.utils.describeType;

  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Banana;
  import uk.co.ziazoo.fussy.Bubbles;
  import uk.co.ziazoo.fussy.model.Constructor;
  import uk.co.ziazoo.fussy.model.Parameter;

  public class ConstructorParserTest
  {
    public function ConstructorParserTest()
    {
    }

    [Test]
    public function parseConsructor():void
    {
      var parser:ConstructorParser =
        new ConstructorParser(new ParameterParser());

      var result:Array = parser.parse(describeType(Banana).factory);

      var constructor:Constructor = result[0] as Constructor;

      Assert.assertNotNull(constructor);
      Assert.assertEquals(2, constructor.parameters.length);

      var param1:Parameter = constructor.parameters[0] as Parameter;
      Assert.assertEquals("uk.co.ziazoo.fussy::Wibble", param1.type);

      var param2:Parameter = constructor.parameters[1] as Parameter;
      Assert.assertEquals("Array", param2.type);
    }
  }
}