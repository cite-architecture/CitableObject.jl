# CitableObject.jl Documentation


The CitableObject.jl module defines `Cite2Urn`, a URN notation for canonically citing versioned objects.

A `Cite2Urn` can be instantiated from a string value. The generic `show` function displays this value to an IOStream.


```jldoctest urn
using CitableObject
urn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
print(urn)

# output

urn:cite2:hmt:msA.v1:12r
```



!!! warning

    CitableObject.jl is currently incompletely implemented. See the README on the [github repository](https://github.com/cite-architecture/CitableObject.jl) for a list of features to be implemented for 1.0 release.
