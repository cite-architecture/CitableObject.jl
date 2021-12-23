# The `CitableTrait`

The `CitableBase` package defines a `CitableTrait`.  Types implementing the trait implement a function, `urn`, that identifies an object by a value that is a subtype of `Urn`.

By default, the value of the trait for a subtype of `Urn` is `Citable`.  There are times, however, when it may be useful to have a more specific value for the trait. For that situation, the `CitableText` package defines the `CitableByCite2Urn` type.  Here is an example of how you can use it.

Define your custom type, import `CitableTrait`, and assign it the value `CitableByCite2Urn()` for your new type.  Implement the `urn` function.

```@example trait
using CitableBase, CitableObject

struct TinyThing <: Citable
    urn::Cite2Urn
    data::AbstractString
end

import CitableBase: urn
function urn(tinyThing::TinyThing)
    tinyThing.urn
end

import CitableBase: CitableTrait
CitableTrait(::Type{TinyThing}) = CitableByCite2Urn()
```


Now when we create objects of type `TinyThing`, we can use the `citableobject` function from `CitableBase` to find out if our objets of our type are citable by some type of URN.

```@example trait
citeurn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
data = "Manuscript page data"
tiny = TinyThing(citeurn, data)
if citable(tiny)
    urn(tiny)
else
    nothing
end        
```

But we can also more specifically check the value of the `CitableTrait`.

```@example trait
if CitableTrait(typeof(tiny)) == CitableByCite2Urn()
    "Citation is by Cite2Urn"
else
    "Citation is NOT by Cite2Urn"
end    
```