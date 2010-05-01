package uk.co.ziazoo.fussy.parser
{
  import uk.co.ziazoo.fussy.model.*;

  import flash.utils.describeType;

  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Bubbles;
  import uk.co.ziazoo.fussy.parser.ParameterParser;

  public class ParameterParserTest
  {
    private var paramList:XMLList;

    public function ParameterParserTest()
    {
    }

    [Before]
    public function setUp():void
    {
      paramList = describeType(Bubbles).factory.method.parameter;
    }

    [After]
    public function tearDown():void
    {
      paramList = null;
    }


    [Test]
    public function parseListOfParameters():void
    {
      var parser:ParameterParser = new ParameterParser();
      var parameters:Array = parser.parse(paramList);

      Assert.assertNotNull(parameters);
      Assert.assertTrue(parameters.length == 5);

      var index:int = parameters.length - 1;
      while (index >= 0)
      {
        var param:Object = parameters[index];
        Assert.assertNotNull(param);
        Assert.assertTrue(param is Parameter);

        index --;
      }
    }

    [Test]
    public function parseOneParam():void
    {
      var p:XMLList = new XMLList('' +
        '<parameter index="1" optional="true" type="uk.co.ziazoo.fussy::Bubbles"/>');

      var parser:ParameterParser = new ParameterParser();
      var params:Array = parser.parse(p);

      Assert.assertTrue(params.length == 1);

      var param:Parameter = params[0] as Parameter;
      Assert.assertNotNull(param);
      Assert.assertTrue(param.index == 1);
      Assert.assertTrue(param.optional == true);
      Assert.assertTrue(param.type == "uk.co.ziazoo.fussy::Bubbles");
    }
  }
}