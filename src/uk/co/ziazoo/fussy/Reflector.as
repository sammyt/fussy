package uk.co.ziazoo.fussy
{
  import flash.utils.Dictionary;
  import flash.utils.describeType;
  import flash.utils.getDefinitionByName;

  public class Reflector implements IReflector
  {
    private var cache:Dictionary;

    public function Reflector()
    {
      cache = new Dictionary();
    }

    /**
     * @inheritDoc
     */
    public function forType(type:Class):XML
    {
      var description:XML = cache[type] as XML;

      if (description)
      {
        return description;
      }

      description = cache[type] = describeType(type);

      return description;
    }

    /**
     * @inheritDoc
     */
    public function forQName(qName:String):XML
    {
      var type:Class = Class(getDefinitionByName(qName));
      return forType(type);
    }

    /**
     * @inheritDoc
     */
    public function clearAll():void
    {
      cache = null;
      cache = new Dictionary();
    }

    /**
     * @inheritDoc
     */
    public function clearForType(type:Class):void
    {
      if (cache[type])
      {
        delete cache[type];
      }
    }

    /**
     * @inheritDoc
     */
    public function clearForQName(qName:String):void
    {
      var type:Class = Class(getDefinitionByName(qName));
      clearForType(type);
    }

    public function hasReflection(type):Boolean
    {
      return cache[type] != null;
    }
  }
}