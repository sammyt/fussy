package uk.co.ziazoo.fussy.query
{
  import flash.utils.describeType;

  public class AbstractQueryChain implements IQueryChain
  {
    /**
     * @private
     */ 
    protected var parts:Array;
    
    public function AbstractQueryChain()
    {
      parts = [];
    }
    
    public function forType(type:Class):XMLList
    {
      if(parts.length == 0)
      {
        return null;
      }
      
      var reflection:XML = describeType(type);
      var methods:XMLList = reflection.factory.method;
      
      var firstPart:IQueryPart = parts[0];
      var lastResult:XMLList = firstPart.filter(methods);
      
      var i:uint = uint(parts.length - 1);
      while(i > 0)
      {
        var part:IQueryPart = parts[i];
        lastResult = part.filter(lastResult);
        i--;
      }
      
      return lastResult;
    }
  }
}