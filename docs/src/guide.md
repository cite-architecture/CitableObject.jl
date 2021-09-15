# Users' guide: the `Cite2Urn`

The `CitableObject` module defines functions for working with `Cite2Urn`s.  (The API documentation has a more complete list.) Construct a `Cite2Urn` from a string value.

```jldoctest urn
using CitableObject
pageurn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")

# output

urn:cite2:hmt:msA.v1:12r
```

## Components and parts

Include the `CitableBase` module for to use the generic `components` and `parts` functions.  These return Vectors of string values. 

```jldoctest urn
using CitableBase
components(pageurn)

# output

5-element Vector{SubString{String}}:
 "urn"
 "cite2"
 "hmt"
 "msA.v1"
 "12r"
```
 A `Cite2Urn` always has five top-level components. It is legal for the object component to be empty.

```jldoctest urn
pagecollection =  Cite2Urn("urn:cite2:hmt:msA.v1:")
components(pagecollection)

# output

5-element Vector{SubString{String}}:
 "urn"
 "cite2"
 "hmt"
 "msA.v1"
 ""
```

You can use the following functions to extract top-level components by name.  They return a string value.

```jldoctest urn
namespace(pageurn)

# output

"hmt"
```


```jldoctest urn
collectioncomponent(pageurn)

# output

"msA.v1"
```

```jldoctest urn
objectcomponent(pageurn)

# output

"12r"
```

You can also retrieve individual parts of the collection component:



```jldoctest urn
collectionid(pageurn)

# output

"msA"
```

```jldoctest urn
versionid(pageurn)

# output

"v1"
```

## URN manipulation

Several functions use a `Cite2Urn` to create a new, modified `Cite2Urn`.


```jldoctest urn
dropversion(pageurn)

# output

urn:cite2:hmt:msA:12r
```

Verify that the result is a new `Cite2Urn`.

```jldoctest urn
dropversion(pageurn) |> typeof

# output

Cite2Urn
```



```jldoctest urn
addversion(pageurn, "v2")

# output

urn:cite2:hmt:msA.v2:12r
```



```jldoctest urn
dropobject(pageurn)

# output

urn:cite2:hmt:msA.v1:
```

```jldoctest urn
addobject(pageurn, "1r")

# output

urn:cite2:hmt:msA.v1:1r
```





## URN comparison

In addition to comparing for equality with `==`, you can compare a pair of CITE2 URNs for URN containment or URN similarity.

```
urncontains(pagecollection, pageurn)

# output

true
```

Two URNs are similar if they are equal, or if either contains the other.

```
urnsimilar(pagecollection, pageurn)

# output

true
```

Note that this definition means the function is symmetric.

```
urnsimilar(pagecollection, pageurn) == urnsimilar(pageurn, pagecollection)

# output

true
```

## Ranges

`Cite2Urn`s can identify *ranges* (sequences) of objects in ordered collections.


```jldoctest urn
pages = Cite2Urn("urn:cite2:hmt:msA.v1:1r-11v")
isrange(pages)

# output

true
```


```jldoctest urn
rangebegin(pages)

# output

"1r"
```


```jldoctest urn
rangeend(pages)

# output

"11v"
```


## Extended identifiers ("subreferences")

In some collections, extended identifiers ("subreferences") may be appropriate.  You can determine if a `Cite2Urn` includes an extended identifier, extract the subreference, or drop it.


```jldoctest urn
imgurn = Cite2Urn("urn:cite2:hmt:vaimg.2017a:VA012RN_0013@0.2005,0.2073,0.1774,0.02351")
hassubref(imgurn)

# output

true
```

The `subref` functions returns a string value.

```jldoctest urn
subref(imgurn)

# output

"0.2005,0.2073,0.1774,0.02351"
```

The `dropsubref` function returns a new `Cite2Urn`.


```jldoctest urn
dropsubref(imgurn)

# output

urn:cite2:hmt:vaimg.2017a:VA012RN_0013
```
