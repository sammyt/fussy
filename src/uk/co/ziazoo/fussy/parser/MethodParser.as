package uk.co.ziazoo.fussy.parser
{ 
  public class MethodParser
  {
    private var parameterParser:ParameterParser;
    private var metadataParser:MetadataParser;
    
    public function MethodParser(parameterParser:ParameterParser,
      metadataParser:MetadataParser)
    {
      this.parameterParser = parameterParser;
      this.metadataParser = metadataParser;
    }
  }
}