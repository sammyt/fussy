package uk.co.ziazoo.fussy
{
  import flash.system.ApplicationDomain;
  import flash.system.Capabilities;

  import flash.utils.Dictionary;

  import uk.co.ziazoo.fussy.parser.AccessorParser;
  import uk.co.ziazoo.fussy.parser.ConstructorParser;
  import uk.co.ziazoo.fussy.parser.IResultParser;
  import uk.co.ziazoo.fussy.parser.MetadataParser;
  import uk.co.ziazoo.fussy.parser.MethodParser;
  import uk.co.ziazoo.fussy.parser.ParameterParser;
  import uk.co.ziazoo.fussy.parser.PropertyParser;
  import uk.co.ziazoo.fussy.parser.VariableParser;
  import uk.co.ziazoo.fussy.query.QueryBuilder;

  public class Fussy
  {
    private var methodParser:IResultParser;
    private var propertyParser:IResultParser;
    private var constructorParser:IResultParser;
    private var metadataParser:MetadataParser;
    private var _reflector:IReflector;

    public function Fussy(reflector:IReflector = null)
    {
      var parameterParser:ParameterParser = new ParameterParser();
      metadataParser = new MetadataParser();

      methodParser = new MethodParser(parameterParser, metadataParser);
      propertyParser = new PropertyParser(
              new VariableParser(metadataParser), new AccessorParser(metadataParser));

      constructorParser = new ConstructorParser(parameterParser);

      _reflector = reflector;
    }

    public function query():QueryBuilder
    {
      return new QueryBuilder(reflector, methodParser,
              propertyParser, constructorParser, metadataParser);
    }

    public function get reflector():IReflector
    {
      if (!_reflector) {
        _reflector = new Reflector();
      }
      return _reflector;
    }
  }
}