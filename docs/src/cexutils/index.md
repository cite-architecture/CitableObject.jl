```@setup cexutils
root = pwd() |> dirname |> dirname |> dirname
```
# Utilties for working with CEX data: the `CexUtils` module


## Introduction

CEX is a plain-text format for organizing citable data.  As a file format, CEX does not specify what kinds of URN values may be used to identify scholarly resources.  The generically applicable `Cite2Urn` can be used to identify the contents of citable collections and sets of relations among citable resources.  The `CexUtils` submodule provides utilities for filtering and extracting content from CEX sources identified by `Cite2Urn`s.


The utility functions documented here are designed to work identically with multiple kinds of input: blocks of CEX data (the `CiteEXchange` module's `Block` structure), pure CEX strings, files with CEX data, or CEX content located at a URL.

### Data used in these examples

The following examples are illustrated using the `hmt-2022i.cex` published release of the Homer Multitext project, a complex CEX source with roughly 18 Mb of plain-text data.  A copy of that file is in the `test/data` directory of this repository. 


```@example cexutils 
f = joinpath(root, "test", "data", "hmt-2022i.cex")
s = read(f) |> String
u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022i.cex" 
using CiteEXchange
blks = blocks(s) 
# Length in characters:
length(s)
```



## Utilities


### Find properties of a citable collection

`urn:cite2:hmt:msB.v1:` identifies a collection of images of a particular manuscript.  Let's use the CEX string to find the properties of that collection.

```@example cexutils
using CitableObject
using CitableObject.CexUtils
msbimgs = Cite2Urn("urn:cite2:hmt:msB.v1:")
sprops = properties(s, msbimgs)
```

We get the same result if we read a Vector of `Block`s.

```@example cexutils
bprops = properties(blks, msbimgs)
sprops == bprops
```

We can also read from files or URL sources.


```@example cexutils
using CitableBase: FileReader
using CitableBase: UrlReader
fprops = properties(f, msbimgs, FileReader)
uprops == properties(u, msbimgs, UrlReader)
frpops == uprops == sprops
```


### Find data lines of a citable collection

```@example cexutils
sdata = collectiondata(s, msbimgs)
length(sdata)
```


### collect collection urns for datamodel

### collect collection data for datamodel

###  collect relation blocks for urn


