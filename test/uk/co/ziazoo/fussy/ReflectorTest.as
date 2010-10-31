package uk.co.ziazoo.fussy
{
  import flash.system.Capabilities;
  import flash.utils.getQualifiedClassName;

  import org.flexunit.Assert;

  public class ReflectorTest
  {
    private var reflector:Reflector;

    public function ReflectorTest()
    {
    }

    [Before]
    public function setUp():void
    {
      reflector = new Reflector();
    }

    [After]
    public function tearDown():void
    {
      reflector = null;
    }

    [Test]
    public function doesCache():void
    {
      var desc:XML = reflector.forType(Bubbles);
      Assert.assertNotNull(desc);

      Assert.assertEquals(true, reflector.hasReflection(Bubbles));
    }

    [Test]
    public function getCorrectResult():void
    {
      var desc:XML = reflector.forType(Bubbles);
      Assert.assertNotNull(desc);

      Assert.assertEquals(true, reflector.hasReflection(Bubbles));

      Assert.assertEquals(desc, reflector.forType(Bubbles));
    }

    [Test]
    public function getForQName():void
    {
      var desc:XML = reflector.forQName(getQualifiedClassName(Bubbles));
      Assert.assertNotNull(desc);

      Assert.assertEquals(true, reflector.hasReflection(Bubbles));

      Assert.assertEquals(desc, reflector.forType(Bubbles));
    }

    [Test]
    public function clearAll():void
    {
      reflector.forType(Bubbles);
      reflector.forType(Wibble);
      reflector.forType(Array);

      Assert.assertEquals(true, reflector.hasReflection(Bubbles));
      Assert.assertEquals(true, reflector.hasReflection(Wibble));
      Assert.assertEquals(true, reflector.hasReflection(Array));

      reflector.clearAll();

      Assert.assertEquals(false, reflector.hasReflection(Bubbles));
      Assert.assertEquals(false, reflector.hasReflection(Wibble));
      Assert.assertEquals(false, reflector.hasReflection(Array));
    }

    [Test]
    public function clearSomeByType():void
    {
      reflector.forType(Bubbles);
      reflector.forType(Wibble);
      reflector.forType(Array);

      Assert.assertEquals(true, reflector.hasReflection(Bubbles));
      Assert.assertEquals(true, reflector.hasReflection(Wibble));
      Assert.assertEquals(true, reflector.hasReflection(Array));

      reflector.clearForType(Wibble)

      Assert.assertEquals(true, reflector.hasReflection(Bubbles));
      Assert.assertEquals(false, reflector.hasReflection(Wibble));
      Assert.assertEquals(true, reflector.hasReflection(Array));
    }

    [Test]
    public function clearSomeByQName():void
    {
      reflector.forType(Bubbles);
      reflector.forType(Wibble);
      reflector.forType(Array);

      Assert.assertEquals(true, reflector.hasReflection(Bubbles));
      Assert.assertEquals(true, reflector.hasReflection(Wibble));
      Assert.assertEquals(true, reflector.hasReflection(Array));

      reflector.clearForQName(getQualifiedClassName(Wibble));

      Assert.assertEquals(true, reflector.hasReflection(Bubbles));
      Assert.assertEquals(false, reflector.hasReflection(Wibble));
      Assert.assertEquals(true, reflector.hasReflection(Array));
    }
  }
}