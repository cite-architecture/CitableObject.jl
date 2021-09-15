# CitableObject.jl Documentation


The CitableObject.jl module defines the `Cite2Urn`, a URN notation for canonically citing versioned objects.

A `Cite2Urn` can be instantiated from a string value. The generic `show` function displays this value to an IOStream.


```jldoctest urn
using CitableObject
urn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
print(urn)

# output

urn:cite2:hmt:msA.v1:12r
```

The following pages include:

1. a brief user's guide to working with `Cite2Urn`s
2. API documentation of public functions and types
