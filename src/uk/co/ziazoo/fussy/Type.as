package uk.co.ziazoo.fussy
{
  import uk.co.ziazoo.fussy.model.Constructor;

  /**
   * Provides basic information about a class
   */
  public class Type
  {
    public function Type()
    {
    }

    /**
     * The name of a class.  For a class with a fully qualified
     * name of com.example::Tree the name is Tree
     */
    public function get name():String
    {
      return null;
    }

    /**
     * The fully qualified of a class
     */
    public function get qName():String
    {
      return null;
    }

    /**
     * Is this a class that describes a dynamic object
     */
    public function get isDynamic():String
    {
      return null;
    }

    /**
     * Is this a class that describes a final object
     */
    public function get isFinal():String
    {
      return null;
    }

    /**
     * The constructor for this object
     */
    public function get constructor():Constructor
    {
      return null;
    }

    /**
     * Any class level meta data for this class
     */
    public function get metaData():Array
    {
      return null;
    }
  }
}