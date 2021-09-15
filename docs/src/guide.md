# Guide

The `CitableObject` module includes functions for working with `Cite2Urn`s.  The API documentation has a more complete list than the few illustrated here.

## Top-level components

Include the `CitableBase` module for access to the generic components and parts functions.


```jldoctest urn
using CitableBase, CitableObject
urn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
components(urn)

# output

5-element Vector{SubString{String}}:
 "urn"
 "cite2"
 "hmt"
 "msA.v1"
 "12r"
```

Or use these functions to refer to them by name.

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

## Ranges

Ordered collections can identify *ranges* (sequences) of objects.


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

## URN comparison