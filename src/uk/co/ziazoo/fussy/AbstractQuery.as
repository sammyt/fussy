package uk.co.ziazoo.fussy
{
  public class AbstractQuery implements IFilter
  {
    protected var description:XML;
    protected var filtered:XMLList;
    
    public function AbstractQuery(description:XML)
    {
      this.description = description;
    }
    
    public function get length():int
    {
      return filtered.length();
    }
    
    public function get result():Array
    {
      return null;
    }
        
    /**
     * @private
     * just for use in unit tests
     */ 
    internal function getResult():XMLList
    {
      return filtered;
    }
  }
}