package uk.co.ziazoo.fussy.methods
{
  import uk.co.ziazoo.fussy.parser.IResultParser;
  import uk.co.ziazoo.fussy.query.AbstractQueryChain;
  import uk.co.ziazoo.fussy.query.Named;
  import uk.co.ziazoo.fussy.query.WithMetadata;

  public class MethodQueryChain extends AbstractQueryChain
  {
    public function MethodQueryChain(parser:IResultParser)
    {
      super(parser);
    }

    override protected function getList(reflection:XML):XMLList
    {
      return reflection.factory.method;
    }

    /**
     * Filters based on the method name
     * @param name of method
     * @return MethodQueryChain to allow query DSL
     */
    public function named(name:String):MethodQueryChain
    {
      parts.push(new Named(name));
      return this;
    }

    /**
     * Allows filtering by the type signature of the arguments
     * e.g. hasTypeSignature(String,int,Array) would return all the
     * methods which take a string, followed by a int then an array as
     * their argument list
     *
     * @param types the classes of the arguments
     * @return MethodQueryChain to allow query DSL
     */
    public function hasTypeSignature(...types):MethodQueryChain
    {
      return this;
    }

    /**
     * Filters by the number of arguements the method takes
     * @param count number of arguments the method has in its signature
     * @return MethodQueryChain to allow query DSL
     */
    public function argumentsLengthOf(count:int):MethodQueryChain
    {
      return this;
    }

    /**
     * Filters by metadata name
     * @param named the name of the metadata a method must have to pass through
     * this filter
     * @return MethodQueryChain to allow query DSL
     */
    public function withMetadata(named:String):MethodQueryChain
    {
      parts.push(new WithMetadata(named));
      return this;
    }

    /**
     * To find methods that take not arguments
     * @return MethodQueryChain to allow query DSL
     */
    public function noArguments():MethodQueryChain
    {
      parts.push(new NoArgs());
      return this;
    }

    /**
     * To find methods that have no arguments that must be provided.  Methods
     * with many arguments that have default values can pass this filter
     * @return MethodQueryChain to allow query DSL
     */
    public function noCompulsoryArguments():MethodQueryChain
    {
      parts.push(new NoCompulsoryArgs());
      return this;
    }

    /**
     * To find methods that have one or more arguments
     * @return MethodQueryChain to allow query DSL
     */
    public function withArguments():MethodQueryChain
    {
      parts.push(new WithArguments());
      return this;
    }
  }
}