package uk.co.ziazoo.fussy
{
  import uk.co.ziazoo.fussy.model.Constructor;

  /**
   * Provides basic information about a class
   */
  public class TypeDescription
  {
    private var _qName:String;
    private var _isDynamic:Boolean;
    private var _isFinal:Boolean;
    private var _constructor:Constructor;
    private var _metadata:Array;

    public function TypeDescription(qName:String,
      isDynamic:Boolean, isFinal:Boolean, constructor:Constructor,
      metadata:Array)
    {
      _qName = qName;
      _isDynamic = isDynamic;
      _isFinal = isFinal;
      _constructor = constructor;
      _metadata = metadata;
    }

    /**
     * The fully qualified of a class
     */
    public function get qName():String
    {
      return _qName;
    }

    /**
     * Is this a class that describes a dynamic object
     */
    public function get isDynamic():Boolean
    {
      return _isDynamic;
    }

    /**
     * Is this a class that describes a final object
     */
    public function get isFinal():Boolean
    {
      return _isFinal;
    }

    /**
     * The constructor for this object
     */
    public function get constructor():Constructor
    {
      return _constructor;
    }

    /**
     * Any class level meta data for this class
     */
    public function get metadata():Array
    {
      return _metadata;
    }
  }
}