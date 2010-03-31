# fussy is an actionscript reflection query language #

Its still in development, give me a couple more days

Mind you, this kind of thing works...

<pre>
var query:IQuery = fussy.forType(Bubbles).findMethods().withMetadata("Inject");
var query:IQuery = fussy.forType(Bubbles).findAccessors().ofType(Array).readOnly();
</pre>