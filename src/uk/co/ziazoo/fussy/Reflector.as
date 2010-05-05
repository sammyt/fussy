package uk.co.ziazoo.fussy
{
  import flash.utils.Dictionary;
  import flash.utils.describeType;
  import flash.utils.getDefinitionByName;

  public class Reflector implements IReflector
  {
    private var cache:Dictionary;
    private var needsPlayerFix:Boolean;

    public function Reflector(needsPlayerFix:Boolean = false)
    {
      this.needsPlayerFix = needsPlayerFix;
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

      description = describeType(type);

      if (needsPlayerFix)
      {
        var parameters:XMLList = description.factory.constructor.parameter;
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

    public function hasReflection(type:Class):Boolean
    {
      return cache[type] != null;
    }
  }
}