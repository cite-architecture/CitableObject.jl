# CitableObject.jl Documentation


The CitableObject.jl module defines the `Cite2Urn`, a URN notation for canonically citing versioned objects.

A `Cite2Urn` can be instantiated from a string value. The generic `show` function displays this value to an IOStream.


```@example
using CitableObject
urn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
```

## The `CexUtils` submodule

CEX is a plain-text format for organizing citable data.  The `CexUtils` submodule 
provides functions using `Cite2Urn`s to identify and extract data from CEX sources.


## Contents


The following pages include:

1. a brief user's guide to working with `Cite2Urn`s
2. an overview of the `CexUtils` submodule
3. API documentation of public functions and types
