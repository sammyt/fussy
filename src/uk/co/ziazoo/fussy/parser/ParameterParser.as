package uk.co.ziazoo.fussy.parser
{
  import uk.co.ziazoo.fussy.model.Parameter;

  public class ParameterParser implements IResultParser
  {
    public function ParameterParser()
    {
      super();
    }


    public function parse(result:XMLList):Array
    {
      var params:Array = [];
      for each(var param:XML in result)
      {
        params.push(parseParameter(param));
      }
      return params;
    }

    public function parseParameter(reflection:XML):Parameter
    {
      var parameter:Parameter = new Parameter();
      parameter.index = parseInt(reflection.@index);
      parameter.type = reflection.@type;
      parameter.optional = reflection.@optional == "true";
      return parameter;
    }
  }
}