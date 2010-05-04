package uk.co.ziazoo.fussy.query
{
  import flash.utils.describeType;

  import uk.co.ziazoo.fussy.IReflector;
  import uk.co.ziazoo.fussy.parser.IResultParser;

  public class AbstractQueryChain implements IQueryChain
  {
    /**
     * @private
     */
    protected var parts:Array;

    /**
     * @private
     */
    protected var reflector:IReflector;

    private var _parser:IResultParser;


    public function AbstractQueryChain(reflector:IReflector, parser:IResultParser)
    {
      parts = [];
      _parser = parser;
      this.reflector = reflector;
    }

    public function forType(type:Class):Array
    {
      return parser.parse(xmlForType(type));
    }

    public function xmlForType(type:Class):XMLList
    {
      if (parts.length == 0)
      {
        return null;
      }

      var firstPart:IQueryPart = parts[0];
      var lastResult:XMLList = firstPart.filter(getList(reflector.forType(type)));

      var i:int = parts.length - 1;

      while (i >= 0)
      {
        var part:IQueryPart = parts[i];
        lastResult = part.filter(lastResult);
        i--;
      }
      return lastResult;
    }

    protected function getList(reflection:XML):XMLList
    {
      return null;
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