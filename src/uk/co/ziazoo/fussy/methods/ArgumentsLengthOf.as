package uk.co.ziazoo.fussy.methods
{
  import uk.co.ziazoo.fussy.query.IQueryPart;

  public class ArgumentsLengthOf implements IQueryPart
  {
    private var count:int;

    public function ArgumentsLengthOf(count:int)
    {
      this.count = count;
    }

    public function filter(data:XMLList):XMLList
    {
      return data.(
        hasOwnProperty("parameter") && parameter.length() == count
        );
    }
  }
}