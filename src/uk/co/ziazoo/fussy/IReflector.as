package uk.co.ziazoo.fussy
{
  import flash.system.ApplicationDomain;
  
  /**
   * stores result of describeType calls
   */
  public interface IReflector
  {
    /**
     * Get reflection for a class
     * @param type the class to reflect
     * @return result of describeType
     */
    function forType(type:Class):XML;

    /**
     * Get reflection for a types qualified name
     * @param qName of type to reflect
     * @return result of describeType
     */
    function forQName(qName:String):XML;

    /**
     * Release all type description in memory (drop references)
     */
    function clearAll():void;

    /**
     * Release specific types description
     * @param type who's description reference can be released
     */
    function clearForType(type:Class):void;

    /**
     * Release specific types description
     * @param qName of type who's description reference can be released
     */
    function clearForQName(qName:String):void;

    /**
     * Gets the class definition for a object
     * @param object
     * @return the class object for the object
     */
    function getType(object:Object):Class;

    /**
     * The application domain which fussy will request class
     * definitions from
     */ 
    function get applicationDomain():ApplicationDomain;
    function set applicationDomain(value:ApplicationDomain):void;
  }
}