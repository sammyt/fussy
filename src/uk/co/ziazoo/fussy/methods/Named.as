package uk.co.ziazoo.fussy.methods
{
  import org.flexunit.runner.Result;
  
  import uk.co.ziazoo.fussy.query.IQueryPart;
  import uk.co.ziazoo.fussy.query.IQueryPartResult;
  
  public class Named implements IQueryPart
  {
    private var name:String;
    
    public function Named(name:String)
    {
      this.name = name;
    }
    
    public function filter(data:XML):IQueryPartResult
    {
      return new Result(data.(@name == name));
    }
  }
}
import uk.co.ziazoo.fussy.query.IQueryPartResult;

class Result implements IQueryPartResult
{
  private var _data:XML;
  
  public function Result(data:XML)
  {
    _data = data;
  }
  
  public function get data():XML
  {
    return _data;
  }
}