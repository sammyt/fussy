package uk.co.ziazoo.fussy.model
{
  public class Property
  {
    public var name:String;
    public var type:String;
    public var metadata:Array;

    public function Property()
    {
    }

    public function setter(instance:Object, arg:Object):void
    {
      instance[name] = arg;
    }

    public function getter(instance:Object):Object
    {
      return instance[name];
    }
  }
}