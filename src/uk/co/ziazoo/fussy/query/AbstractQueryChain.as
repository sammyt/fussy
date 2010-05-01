package uk.co.ziazoo.fussy.query
{
  import flash.utils.describeType;

  import uk.co.ziazoo.fussy.parser.IResultParser;

  public class AbstractQueryChain implements IQueryChain
  {
    /**
     * @private
     */
    protected var parts:Array;

    private var _parser:IResultParser;

    public function AbstractQueryChain()
    {
      parts = [];
    }

    public function forType(type:Class):Array
    {
      return parser.parse(xmlforType(type));
    }

    public function xmlforType(type:Class):XMLList
    {
      if (parts.length == 0)
      {
        return null;
      }

      var reflection:XML = describeType(type);
      var methods:XMLList = reflection.factory.method;

      var firstPart:IQueryPart = parts[0];
      var lastResult:XMLList = firstPart.filter(methods);

      var i:uint = uint(parts.length - 1);
      while (i > 0)
      {
        var part:IQueryPart = parts[i];
        lastResult = part.filter(lastResult);
        i--;
      }

      return lastResult;
    }

    public function get parser():IResultParser
    {
      return _parser;
    }

    public function set parser(value:IResultParser):void
    {
      _parser = value;
    }

    public function addQueryPart(part:IQueryPart):void
    {
      parts.push(part);
    }
  }
}