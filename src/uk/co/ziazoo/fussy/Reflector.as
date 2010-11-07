package uk.co.ziazoo.fussy
{
  import flash.system.ApplicationDomain;
  import flash.utils.Dictionary;
  import flash.utils.describeType;

  public class Reflector implements IReflector
  {
    private var cache:Dictionary;
    private var _applicationDomain:ApplicationDomain;

    public function Reflector(applicationDomain:ApplicationDomain = null)
    {
      cache = new Dictionary();
      _applicationDomain = applicationDomain;
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

      description = describeType(type);
      var constructor:XML = description.factory.constructor[0];

      if (constructor &&
              constructor.parameter.(@type == "*").length()
                      == constructor.parameter.@type.length())
      {
        var parameters:XMLList = constructor.parameter;
        if (parameters.length() > 0)
        {
          try
          {
            var args:Array = [];
            for (var i:int = 0; i < parameters.length(); i++)
            {
              args.push(null);
            }
            InstanceCreator.create(type, args);
            description = describeType(type);
          }
          catch(error:Error)
          {
          }
        }
      }

      cache[type] = description;
      return description;
    }

    /**
     * @inheritDoc
     */
    public function forQName(qName:String):XML
    {
      var type:Class = Class(applicationDomain.getDefinition(qName));
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
      var type:Class = Class(applicationDomain.getDefinition(qName));
      clearForType(type);
    }

    public function hasReflection(type:Class):Boolean
    {
      return cache[type] != null;
    }

    public function get applicationDomain():ApplicationDomain
    {
      return _applicationDomain || ApplicationDomain.currentDomain;
    }

    public function set applicationDomain(value:ApplicationDomain):void
    {
      _applicationDomain = value;
    }
  }
}