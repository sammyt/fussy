package uk.co.ziazoo.fussy.model
{
  public class Method
  {
    public var name:String;
    public var parameters:Array;
    public var metadata:Array;

    public function Method()
    {
    }

    public function invoke(instance:Object, args:Array = null):Object
    {
      var fnt:Function = instance[ name ] as Function;
      return fnt.apply(instance, args);
    }
  }
}