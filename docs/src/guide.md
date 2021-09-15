# Guide

The `CitableObject` module includes functions for working with `Cite2Urn`s.  (The API documentation has a more complete list than the few illustrated here.) Construct a `Cite2Urn` from a string value.

```jldoctest urn
using CitableObject
urn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")

# output

urn:cite2:hmt:msA.v1:12r
```

## Components and parts

Include the `CitableBase` module for access to the generic `components` and `parts` functions.  These return Vectors of string values.


A `Cite2Urn` always has five top-level components.

```
using CitableBase
components(urn) |> length

# output

5-element Vector{SubString{String}}:
 "urn"
 "cite2"
 "hmt"
 "msA.v1"
 "12r"
```

Use these functions to extract top-level components by name.  They return a string value.

```jldoctest urn
namespace(urn)

# output

"hmt"
```


```jldoctest urn
collectioncomponent(urn)

# output

"msA.v1"
```

```jldoctest urn
objectcomponent(urn)

# output

"12r"
```

Retrieve parts of the collection component:



```jldoctest urn
collectionid(urn)

# output

"msA"
```

```jldoctest urn
versionid(urn)

# output

"v1"
```

## URN manipulation

Several functions use a `Cite2Urn` to create a new, modified `Cite2Urn`.


```jldoctest urn
dropversion(urn)

# output

urn:cite2:hmt:msA:12r
```

Check that the result is a new `Cite2Urn`.

```jldoctest urn
dropversion(urn) |> typeof

# output

Cite2Urn
```



```jldoctest urn
addversion(urn, "v2")

# output

urn:cite2:hmt:msA.v2:12r
```



```jldoctest urn
dropobject(urn)

# output

urn:cite2:hmt:msA.v1:
```

```jldoctest urn
addobject(urn, "1r")

# output

urn:cite2:hmt:msA.v1:1r
```





## URN comparison

urncontains
urnmatches


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

hassubref, subref, dropsubref