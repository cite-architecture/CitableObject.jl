```@setup relsets
using CiteEXchange
root = pwd() |> dirname |> dirname |> dirname
f = joinpath(root, "test", "data", "hmt-2022k.cex")
s = read(f) |> String
u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 
blks = blocks(s) 
```

# Utilities for working with citable relation sets

The `citerelationset` block of a CEX source defines a single citable object containing one or more relations among other citable content.  The Homer Multitext project data set that we used on the previous page, for example, includes relation sets recording that passages of text appear on particular page of a manuscript.

With the `CexUtils` submodule, you can collect relations data for a specific relation set, or for all relation sets belonging to a specified collection of relation sets.   



##  Collect relations data for a single relation set

`urn:cite2:hmt:iliadindex.v1:e4` identifies a specific relation recording data for a single manuscript.


```@example relsets
using CitableObject
using CitableObject.CexUtils
relationset = Cite2Urn("urn:cite2:hmt:iliadindex.v1:e4")
relations(s, relationset)
```

##  Collect relations data for a collection of relation sets

The Homer Multitext data include other relation sets belonging to the same collection.

```@example relsets
relationsetcollection = Cite2Urn("urn:cite2:hmt:iliadindex.v1:")
relations(s, relationsetcollection)
```


##  Collect relations data implementing a data model

Like any other citable collection, collections of relation sets can associated with a data model.  We can use the `relations_for_model` function to collect all relations for relation sets implementing a model.




