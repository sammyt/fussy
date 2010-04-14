package uk.co.ziazoo.fussy
{ 
  public class ConstructorQuery extends AbstractQuery
  {
    public function ConstructorQuery(description:XML)
    {
      super(description);
    }
    
    /**
     * @private
     * flash fail http://bugs.adobe.com/jira/browse/FP-183
     */ 
    internal function needsHack():Boolean
    {
      return hasArgs();
    }
    
    private function hasArgs():Boolean
    {
      var factory:XMLList = getFiltered().factory.(
        hasOwnProperty("constructor") && 
        constructor.hasOwnProperty("parameter")
      );
      
      if(factory.length() == 0)
      {
        return false;
      }
      return true;
    }
    
    protected function getFiltered():XMLList
    {
      if(!filtered)
      {
        filtered = new XMLList(description);
      }
      return filtered;
    }
  }
}