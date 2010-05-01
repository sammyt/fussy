package uk.co.ziazoo.fussy.parser
{
  import uk.co.ziazoo.fussy.model.Constructor;

  public class ConstructorParser implements IResultParser
  {
    private var parameterParser:ParameterParser;

    public function ConstructorParser(parameterParser:ParameterParser)
    {
      this.parameterParser = parameterParser;
    }

    public function parse(result:XMLList):Array
    {
      var constructor:Constructor = new Constructor();
      constructor.parameters = parameterParser.parse(result.constructor.parameter);
      return [constructor];
    }
  }
}