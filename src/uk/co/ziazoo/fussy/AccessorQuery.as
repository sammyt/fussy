package uk.co.ziazoo.fussy
{
  import flash.utils.getQualifiedClassName;

  public class AccessorQuery extends AbstractQuery
  {
    public function AccessorQuery(description:XML)
    {
      super(description);
    }
    
    public function ofType(type:Class):AccessorQuery
    {
      filtered = getFiltered().(
        @type == getQualifiedClassName(type)
      );
      return this;
    }
    
    public function withMetadata(name:String):AccessorQuery
    {
      filtered = getFiltered().( 
        hasOwnProperty("metadata") && metadata.(@name == name)
      );
      return this;
    }
    
    public function readable():AccessorQuery
    {
      filtered = getFiltered().(
        @access == "readwrite" || @access == "readonly"
      );
      return this;
    }
    
    public function writable():AccessorQuery
    {
      filtered = getFiltered().(
        @access == "readwrite" || @access == "writeonly"
      );
      return this;
    }
    
    public function readOnly():AccessorQuery
    {
      filtered = getFiltered().(
        @access == "readonly"
      );
      return this;
    }
    
    public function writeOnly():AccessorQuery
    {
      filtered = getFiltered().(
        @access == "writeonly"
      );
      return this;
    }
    
    public function readAndWrite():AccessorQuery
    {
      filtered = getFiltered().(
        @access == "readwrite"
      );
      return this;
    }
    
    protected function getFiltered():XMLList
    {
      if(!filtered)
      {
        filtered = description.factory.accessor;
      }
      return filtered;
    }
    
    /**
     * @inheritDoc
     */ 
    override public function get result():Array
    {
      return null;
    }
  }
}