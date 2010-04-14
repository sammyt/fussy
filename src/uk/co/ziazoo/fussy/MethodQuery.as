package uk.co.ziazoo.fussy
{
  import uk.co.ziazoo.fussy.parser.MethodParser;
  
  public class MethodQuery extends AbstractQuery
  {
    private var methodParser:MethodParser;
    
    public function MethodQuery(description:XML, methodParser:MethodParser)
    {
      super(description);
      
      this.methodParser = methodParser;
    }
    
    public function noArgs():MethodQuery
    {
      filtered = getFiltered().( 
        !hasOwnProperty("parameter")
      );
      return this; 
    }
    
    public function argLength(num:int):MethodQuery
    {
      filtered = getFiltered().( 
        hasOwnProperty("parameter") && parameter.length() == num
      );
      return this; 
    }
    
    public function withMetadata(name:String):MethodQuery
    {
      filtered = getFiltered().( 
        hasOwnProperty("metadata") && metadata.(@name == name)
      );
      return this;
    }
    
    protected function getFiltered():XMLList
    {
      if(!filtered)
      {
        filtered = description.factory.method;
      }
      return filtered;
    }
    
    /**
     * @inheritDoc
     */ 
    override public function get result():Array
    {
      return [];      
    }
  }
}