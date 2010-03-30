package uk.co.ziazoo.fussy
{
  import flash.utils.getQualifiedClassName;

  public class PropertyQuery extends AbstractQuery
  {
    public function PropertyQuery(description:XML)
    {
      super(description);
      getFiltered();
    }
    
    public function ofType(type:Class):PropertyQuery
    {
      filtered = getFiltered().(
        @type == getQualifiedClassName(type)
      );
      return this;
    }
    
    public function withMetadata(name:String):PropertyQuery
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
        var properties:XMLList = new XMLList(<root/>);
        properties.appendChild(description.factory.variable);
        properties.appendChild(description.factory.accessor);
        filtered = properties.*;
      }
      return filtered;
    }
  }
}