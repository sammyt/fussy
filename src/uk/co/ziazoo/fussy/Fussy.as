package uk.co.ziazoo.fussy
{
  import flash.utils.Dictionary;
  import flash.utils.describeType;
  
  import uk.co.ziazoo.fussy.query.Query;

  public class Fussy
  {
    private var cache:Dictionary;
    
    public function Fussy()
    {
      this.cache = new Dictionary();
    }
    
    public function forType(type:Class):QueryBuilder
    {
      return new QueryBuilder(getDescription(type));
    }
    
    private function getDescription(type:Class):XML
    {
      if(!cache[type])
      {
        cache[type] = describeType(type);
      }
      return cache[type] as XML
    }
    
    public function query():Query
    {
      return new Query();
    }
  }
}