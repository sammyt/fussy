package uk.co.ziazoo.fussy
{
  import flash.utils.getQualifiedClassName;

  public class VariableQuery extends AbstractQuery
  {
    public function VariableQuery(description:XML)
    {
      super(description);
    }
    
    public function ofType(type:Class):VariableQuery
    {
      filtered = getFiltered().(@type == getQualifiedClassName(type));
      return this;
    }
    
    public function withMetadata(name:String):VariableQuery
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
        filtered = description.factory.variable;
      }
      return filtered;
    }
    
    /**
     * @inhertDoc
     */ 
    override public function get result():Array
    {
      return null;
    }
  }
}