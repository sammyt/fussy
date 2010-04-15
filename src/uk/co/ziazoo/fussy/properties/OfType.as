package uk.co.ziazoo.fussy.properties
{
  import flash.utils.getQualifiedClassName;
  
  import uk.co.ziazoo.fussy.query.IQueryPart;
  
  public class OfType implements IQueryPart
  {
    private var type:Class;
    
    public function OfType(type:Class)
    {
      this.type = type;
    }
    
    public function filter(data:XMLList):XMLList
    {
      return data.(
        @type == getQualifiedClassName(type)
      );
    }
  }
}