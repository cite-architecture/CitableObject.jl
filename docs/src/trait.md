# The `CitableTrait`

The `CitableBase` package defines a `CitableTrait`. For any Julia type, the value of the trait is identified by a singleton value returned by the `citabletrait` function. By default, the value of the trait is` NotCitable()`. (See a fuller discussion in the [documentation for `CitableBase`](https://cite-architecture.github.io/CitableBase.jl/stable/citable/#Implementing-the-CitableTrait)).

The `CitableObject` package defines a singleton-type `CitableByCite2Urn` which you use as the value for `CitableTrait` for your own types of content identified by `Cite2Urn`s. Here is a brief example.

First define your type with a `Cite2Urn`.

```@example trait
using CitableBase, CitableObject

struct TinyThing <: Citable
    urn::Cite2Urn
    data::AbstractString
end
citeurn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
data = "Manuscript page data"
tiny = TinyThing(citeurn, data)
```


Override the `citabletrait` function when its parameter is the type `TinyThing`, and return the concrete value `CitableByCite2Urn().


```@example trait
import CitableBase: citabletrait
function citabletrait(::Type{TinyThing})
    CitableByCite2Urn()
end
```

Check the result:


```@example trait
citabletrait(typeof(tiny))
```


Now you can use the citable function (from `CitableBase`) to check whether individual objects of your new type are citable.

```@example trait
citable(tiny)
```

At this point, you can also implement the required functions of the CitableTrait, `urn` and `label`.

```
import CitableBase: urn
function urn(tinyThing::TinyThing)
    tinyThing.urn
end

import CitableBase: label

function urn(tinyThing::TinyThing)
    string(tinyThing.urn) * " with data " * tinyThing.data
end
```


