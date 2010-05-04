package uk.co.ziazoo.fussy
{
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
  }
}