package uk.co.ziazoo.fussy.query
{
  import flash.utils.Dictionary;
  import flash.utils.getDefinitionByName;

  import uk.co.ziazoo.fussy.IReflector;
  import uk.co.ziazoo.fussy.TypeDescription;
  import uk.co.ziazoo.fussy.model.Constructor;
  import uk.co.ziazoo.fussy.parser.IResultParser;

  public class TypeQuery implements ITypeQuery
  {
    private var reflector:IReflector;
    private var constructorParser:IResultParser;
    private var metadataParser:IResultParser;
    private var cache:Dictionary;

    public function TypeQuery(reflector:IReflector,
      constructorParser:IResultParser, metadataParser:IResultParser)
    {
      this.reflector = reflector;
      this.constructorParser = constructorParser;
      this.metadataParser = metadataParser;
      this.cache = new Dictionary();
    }

    public function forType(type:Class):TypeDescription
    {
      var description:TypeDescription = cache[type] as TypeDescription;

      if (description)
      {
        return description;
      }
      var reflection:XML = reflector.forType(type);

      description = new TypeDescription
        (
          getQName(reflection),
          getIsDynamic(reflection),
          getIsFinal(reflection),
          getConstructor(reflection),
          getMetadata(reflection)
          );

      cache[type] = description;
      return description;
    }

    public function forQName(qName:String):TypeDescription
    {
      return forType(Class(getDefinitionByName(qName)));
    }

    private function getQName(reflection:XML):String
    {
      return reflection.@name;
    }

    private function getIsDynamic(reflection:XML):Boolean
    {
      return String(reflection.@isDynamic) == "true";
    }

    private function getIsFinal(reflection:XML):Boolean
    {
      return String(reflection.@isFinal) == "true";
    }

    private function getConstructor(reflection:XML):Constructor
    {
      var result:Array = constructorParser.parse(reflection.factory);
      var constructor:Constructor = result[0] as Constructor;
      return constructor;
    }

    private function getMetadata(reflection:XML):Array
    {
      return metadataParser.parse(reflection.factory.metadata);
    }

    internal function hasTypeCached(type:Class):Boolean
    {
      return cache[type] != null;
    }
  }
}