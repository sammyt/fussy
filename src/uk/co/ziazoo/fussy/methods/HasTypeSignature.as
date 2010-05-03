package uk.co.ziazoo.fussy.methods
{
  import flash.utils.getQualifiedClassName;

  import uk.co.ziazoo.fussy.query.IQueryPart;

  public class HasTypeSignature implements IQueryPart
  {
    private var types:Array;

    public function HasTypeSignature(types:Array)
    {
      this.types = types;
    }

    public function filter(data:XMLList):XMLList
    {
      var filtered:XMLList = new XMLList(<root />);

      for each(var method:XML in data)
      {
        var parameters:XMLList = method.parameter;

        if (lengthIsCorrect(parameters)
          && typesAreCorrect(parameters))
        {
          filtered.appendChild(method);
        }
      }
      return filtered.method;
    }

    private function lengthIsCorrect(parameters:XMLList):Boolean
    {
      return types.length == parameters.length();
    }

    private function typesAreCorrect(parameters:XMLList):Boolean
    {
      for each(var parameter:XML in parameters)
      {
        var type:Class = types[Number(parameter.@index) - 1] as Class;
        var qName:String = getQualifiedClassName(type);
        if (parameter.@type != qName)
        {
          return false;
        }
      }

      return true;
    }
  }
}