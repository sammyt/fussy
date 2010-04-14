package uk.co.ziazoo.fussy.model
{
  public class Parser
  {
    public function Parser()
    {
    }
    
    public function parseConstructor( reflection:XML ):Constructor
    {
      var constructor:Constructor = new Constructor();
      
      for each( var p:XML in reflection.constructor.parameter )
      {
        constructor.params.push( parseParameter( p ) );
      }
      
      for each( var m:XML in reflection.metadata )
      {
        constructor.metadatas.push( parseMetadata( m ) );
      }
      return constructor;
    }
    
    public function parseProperty( prop:XML ):Property
    {
      var property:Property = new Property();
      property.name = prop.@name;
      property.type = prop.@type;
      
      for each( var m:XML in prop.metadata )
      {
        property.metadatas.push( parseMetadata( m ) );
      }
      return property;
    }
    
    public function parseMethod( reflection:XML ):Method
    {
      var method:Method = new Method();
      method.name = reflection.@name;
      
      for each( var p:XML in reflection.parameter )
      {
        method.params.push( parseParameter( p ) );
      }
      
      for each( var m:XML in reflection.metadata )
      {
        method.metadatas.push( parseMetadata( m ) );
      }
      
      return method;
    }
    
    public function parseMetadata( reflection:XML ):Metadata
    {
      var metadata:Metadata = new Metadata();
      metadata.name = reflection.@name;
      
      for each( var p:XML in reflection.arg )
      {
        metadata.properties[p.@key as String] = p.@value as String;
      }
      return metadata;
    }
    
    public function parseParameter( reflection:XML ):Parameter
    {
      var parameter:Parameter = new Parameter();
      parameter.index = parseInt( reflection.@index );
      parameter.type = reflection.@type;
      parameter.optional = reflection.@optional == "true";
      return parameter;
    }
  }
}