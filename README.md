# fussy is an actionscript reflection query language #

Fussy allows you to query your actionscript types using a simple DSL

### Why ###
Because I didn't need a full OO representation of my types, I just needed to know some specific things about them

### How ###
Fussy allows you to perform the business logic of you reflection (find me such-and-such) with a query language, then only parses into strictly typed objects those facets of the type that satisfy your query

### Code ###

Want to know somethings about some types? Create a Fussy.

<pre>
var fussy:Fussy = new Fussy()
</pre>

Explain what you want to know by creating a query

<pre>
var query:IQuery = fussy.query().findMethods().withTypeSignature(int, String);
</pre>

This will find any methods that have a signiture of int, string e.g. public function setAgeAndName(age:int, name:String):void; or public function addToCart(prodId:int, name:String):void;

Now to use the query

<pre>
var methods:Array = query.forType(Person);
</pre>

Result is strongly typed into Method objects

<pre>
for each(var method:Method in methods)
{
  trace(method.name);
  trace(method.parameters.length);
  method.invoke(myPerson, [1, "Bacon"]);
}
</pre>

### And some more... ###

Take from [dawns](http://github.com/sammyt/dawn) code base

<pre>
var query:QueryBuilder = fussy.query();

query.findMethods().withMetadata("Inject").withArguments();
query.findProperties().withMetadata("Inject");
query.findMethods().withMetadata("Provider").noCompulsoryArguments();
query.findMethods().withMetadata("Execute").withArgsLengthOf(1);
query.getTypeQuery();
</pre>