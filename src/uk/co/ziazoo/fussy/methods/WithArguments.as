package uk.co.ziazoo.fussy.methods
{
  import uk.co.ziazoo.fussy.query.IQueryPart;

  public class WithArguments implements IQueryPart
  {
    public function WithArguments()
    {
    }

    public function filter(data:XMLList):XMLList
    {
      return data.(
        hasOwnProperty("parameter")
        );
    }
  }
}