#To Run#
On the command line run:

```
ruby exercise.rb
```
Then type in your json in the standard in.

Example json:
```
[
  {"price": 1.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 2.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 3.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 4.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 5.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 6.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 7.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 8.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 9.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 10.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 11.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 12.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 13.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 14.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 15.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 16.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 17.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 18.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 19.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 20.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 21.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 22.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 23.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 24.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 25.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 26.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 27.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 28.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 29.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 30.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 31.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 1.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 2.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 3.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 4.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 5.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 6.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 7.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 8.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 9.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 10.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 11.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 12.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 13.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 14.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 15.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 16.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 17.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 18.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 19.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 20.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 21.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 22.99,"tracks": [{"seconds": 1800,"name": "one"},{"seconds": 500,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 22.99,"tracks": [{"seconds": 1800,"name": "one"},{"seconds": 500,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 22.99,"tracks": [{"seconds": 1800,"name": "one"},{"seconds": 500,"name": "two"},{"seconds": 300,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 22.99,"tracks": [{"seconds": 1800,"name": "one"},{"seconds": 500,"name": "two"},{"seconds": 600,"name": "two"},{"seconds": 400,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 23.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 24.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 25.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 26.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 27.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 28.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 29.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 30.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 31.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 1.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 2.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "fred","type": "book"},
  {"price": 3.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "george","type": "book"},
  {"price": 4.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "peter","type": "book"},
  {"price": 5.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "paul","type": "book"},
  {"price": 6.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "john","type": "book"},
  {"price": 7.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "derek","type": "book"},
  {"price": 8.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "may","type": "book"},
  {"price": 9.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "sarah","type": "book"},
  {"price": 10.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "lisa","type": "book"},
  {"price": 11.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 12.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 13.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 14.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 15.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 16.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 17.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 18.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 19.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 20.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 23.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 24.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "fred","type": "cd"},
  {"price": 25.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "chris","type": "cd"},
  {"price": 26.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "stuart","type": "cd"},
  {"price": 27.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "lisa","type": "cd"},
  {"price": 28.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "bill","type": "cd"},
  {"price": 29.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "bob","type": "cd"},
  {"price": 30.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "john","type": "cd"},
  {"price": 31.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "harry","type": "cd"},
  {"price": 1.99,"chapters": ["1997","two","three"],"year": 1999,"title": "foo","author": "mary","type": "book"},
  {"price": 2.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "fred","type": "book"},
  {"price": 3.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "george","type": "book"},
  {"price": 4.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "peter","type": "book"},
  {"price": 5.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "paul","type": "book"},
  {"price": 6.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "john","type": "book"},
  {"price": 7.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "derek","type": "book"},
  {"price": 8.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "may","type": "book"},
  {"price": 9.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "sarah","type": "book"},
  {"price": 10.99,"chapters": ["one","two","three"],"year": 1999,"title": "foo","author": "lisa","type": "book"},
  {"price": 11.99,"minutes": 90,"year": 2004,"title": "The summer of '67","director": "alan","type": "dvd"},
  {"price": 12.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 13.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 14.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 15.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 16.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 17.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 18.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 19.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 20.99,"minutes": 90,"year": 2004,"title": "bar","director": "alan","type": "dvd"},
  {"price": 20.99,"minutes": 90,"year": 2004,"title": "bar","author": "joan","type": "dvd"},
  {"price": 23.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "Year 87, Romans were around"}],"year": 2000,"title": "baz","author": "joan","type": "cd"},
  {"price": 24.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "fred","type": "cd"},
  {"price": 25.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "chris","type": "cd"},
  {"price": 26.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "stuart","type": "cd"},
  {"price": 27.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "lisa","type": "cd"},
  {"price": 28.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "bill","type": "cd"},
  {"price": 29.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "bob","type": "cd"},
  {"price": 30.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "john","type": "cd"},
  {"price": 31.99,"tracks": [{"seconds": 180,"name": "one"},{"seconds": 200,"name": "two"}],"year": 2000,"title": "baz","author": "harry","type": "cd"}
]
```
