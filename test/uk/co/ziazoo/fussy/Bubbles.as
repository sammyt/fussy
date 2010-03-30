package uk.co.ziazoo.fussy
{
  public class Bubbles
  {
    public var wibble:Wibble;
    
    public var wobble:int;
    
    public var foo:String;
    
    [Fussy]
    public var bar:String;
    
    public function Bubbles()
    {
    }
    
    [Inject]
    public function wowowo(a:int, b:String):void
    {
    }
    
    [Inject]
    [Fussy]
    public function bebeb():void
    {
    }
    
    public function bebeboo(h:Object, r:Object):void
    {
    }
    
    public function get sammy():Array
    {
      return null;
    }
    
    public function get window():Object
    {
      return null;
    }
    
    public function set window(value:Object):void
    {
    }
    
    [Inject]
    public function set thing(value:String):void
    {
      
    }
  }
}