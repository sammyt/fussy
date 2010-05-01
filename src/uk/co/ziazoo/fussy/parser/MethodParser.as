package uk.co.ziazoo.fussy.parser
{
  import uk.co.ziazoo.fussy.model.Method;

  public class MethodParser implements IResultParser
  {
    private var parameterParser:ParameterParser;
    private var metadataParser:MetadataParser;

    public function MethodParser(parameterParser:ParameterParser,
      metadataParser:MetadataParser)
    {
      this.parameterParser = parameterParser;
      this.metadataParser = metadataParser;
    }

    public function parse(result:XMLList):Array
    {
      var methods:Array = [];
      for each(var method:XML in result)
      {
        methods.push(parseMethod(method));
      }
      return methods;
    }

    public function parseMethod(reflection:XML):Method
    {
      var method:Method = new Method();
      method.name = reflection.@name;
      method.parameters = parameterParser.parse(reflection.parameter);
      method.metadata = metadataParser.parse(reflection.metadata);
      return method;
    }
  }
}