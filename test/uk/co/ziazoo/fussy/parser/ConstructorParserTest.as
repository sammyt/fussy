package uk.co.ziazoo.fussy.parser
{
  import flash.utils.describeType;

  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Bubbles;
  import uk.co.ziazoo.fussy.model.Constructor;

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

      var result:Array = parser.parse(describeType(Bubbles).factory);

      var constructor:Constructor = result[0] as Constructor;

      Assert.assertNotNull(constructor);
      Assert.assertEquals(1, constructor.parameters.length);
    }
  }
}