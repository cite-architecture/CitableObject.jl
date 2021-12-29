# Users' guide: the `Cite2Urn`

The `CitableObject` module defines functions for working with `Cite2Urn`s.  (The API documentation has a more complete list.) Construct a `Cite2Urn` from a string value.

```@example urn
using CitableObject
pageurn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
```

## Components and parts

Include the `CitableBase` module for to use the generic `components` and `parts` functions.  These return Vectors of string values. 

```@example urn
using CitableBase
components(pageurn)
```
 A `Cite2Urn` always has five top-level components. It is legal for the object component to be empty.

```@example urn
pagecollection =  Cite2Urn("urn:cite2:hmt:msA.v1:")
components(pagecollection)
```

You can use the following functions to extract top-level components by name.  They return a string value.

```@example urn
namespace(pageurn)
```


```@example urn
collectioncomponent(pageurn)
```

```@example urn
objectcomponent(pageurn)
```

You can also retrieve individual parts of the collection component:



```@example urn
collectionid(pageurn)
```

```@example urn
versionid(pageurn)
```

```@example urn
propurn =  Cite2Urn("urn:cite2:hmt:msA.v1.side:12r")
propertyid(propurn)
```




## URN manipulation

Several functions use a `Cite2Urn` to create a new, modified `Cite2Urn`.


```@example urn
dropversion(pageurn)
```

Verify that the result is a new `Cite2Urn`.

```@example urn
dropversion(pageurn) |> typeof
```



```@example urn
addversion(pageurn, "v2")
```



```@example urn
dropobject(pageurn)
```

```@example urn
addobject(pageurn, "1r")
```


```@example urn
dropproperty(propurn)
```


```@example urn
addproperty(pageurn, "side")
```

## URN comparison

In addition to comparing for equality with `==`, you can compare a pair of CITE2 URNs for URN containment or URN similarity.

```@example urn
urncontains(pagecollection, pageurn)
```

Two URNs are similar if they are equal, or if either contains the other.

```@example urn
urnsimilar(pagecollection, pageurn)
```

Note that this definition means the function is symmetric.

```@example urn
urnsimilar(pagecollection, pageurn) == urnsimilar(pageurn, pagecollection)
```


For `Cite2Urn`s, `urnequals` and `==` return identical results.

```@example urn
urnequals(pagecollection, pageurn)
```


```@example urn
pagecollection == pageurn
```


```@example urn
urnsimilar(pagecollection,dropobject(pageurn))
```

## Ranges

`Cite2Urn`s can identify *ranges* (sequences) of objects in ordered collections.


```@example urn
pages = Cite2Urn("urn:cite2:hmt:msA.v1:1r-11v")
isrange(pages)
```


```@example urn
rangebegin(pages)
```


```@example urn
rangeend(pages)
```


## Extended identifiers ("subreferences")

In some collections, extended identifiers ("subreferences") may be appropriate.  You can determine if a `Cite2Urn` includes an extended identifier, extract the subreference, or drop it.


```@example urn
imgurn = Cite2Urn("urn:cite2:hmt:vaimg.2017a:VA012RN_0013@0.2005,0.2073,0.1774,0.02351")
hassubref(imgurn)
```

The `subref` functions returns a string value.

```@example urn
subref(imgurn)
```

The `dropsubref` function returns a new `Cite2Urn`.


```@example urn
dropsubref(imgurn)
```
