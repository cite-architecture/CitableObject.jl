```@setup cexutils
root = pwd() |> dirname |> dirname |> dirname
f = joinpath(root, "test", "data", "hmt-2022k.cex")
s = read(f) |> String
u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 
using CiteEXchange
blks = blocks(s) 
```

# Utilities for working with citable relation sets






###  collect relation blocks for urn

###  collect relation blocks for a datamodel


