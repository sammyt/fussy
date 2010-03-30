package uk.co.ziazoo.fussy
{
  public class MethodQuery extends AbstractQuery
  {
    public function MethodQuery(description:XML)
    {
      super(description);
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