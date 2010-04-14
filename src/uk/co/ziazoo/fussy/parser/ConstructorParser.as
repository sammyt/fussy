package uk.co.ziazoo.fussy.parser
{ 
  public class ConstructorParser
  {
    private var parameterParser:ParameterParser;
    
    public function ConstructorParser(parameterParser:ParameterParser)
    {
      this.parameterParser = parameterParser;
    }
  }
}