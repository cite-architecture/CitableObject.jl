```@setup cexutils
root = pwd() |> dirname |> dirname |> dirname
```
# Utilties for working with CEX data: the `CexUtils` module


## Introduction

CEX is a plain-text format for organizing citable data.  As a file format, CEX does not specify what kinds of URN values may be used to identify scholarly resources.  The generically applicable `Cite2Urn` can be used to identify the contents of citable collections and sets of relations among citable resources.  The `CexUtils` submodule provides utilities for filtering and extracting content from CEX sources identified by `Cite2Urn`s.


The utility functions documented here are designed to work identically with multiple kinds of input: blocks of CEX data (the `CiteEXchange` module's `Block` structure), pure CEX strings, files with CEX data, or CEX content located at a URL.

### Data used in these examples

The following examples are illustrated using the `hmt-2022j.cex` published release of the Homer Multitext project, a complex CEX source with roughly 18 Mb of plain-text data.  A copy of that file is in the `test/data` directory of this repository. 


```@example cexutils 
f = joinpath(root, "test", "data", "hmt-2022j.cex")
s = read(f) |> String
u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022j.cex" 
using CiteEXchange
blks = blocks(s) 
# Length in characters:
length(s)
```



## Utilities


### Find properties of a citable collection

`urn:cite2:hmt:msB.v1:` identifies a collection of images of a particular manuscript.  Let's use the CEX string to find the properties of that collection (that is, the relevant content of all `citeproperties` blocks in the CEX source).

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
fprops = properties(f, msbimgs, FileReader)

using CitableBase: UrlReader
uprops = properties(u, msbimgs, UrlReader)

fprops == uprops == sprops
```


### Find data lines of a citable collection

Now let's find the data for the same collection (that is, the relevant content of all `citedata` blocks in the CEX source).

We can use a pure string of CEX data.

```@example cexutils
sdata = collectiondata(s, msbimgs)
length(sdata)
```

Or again, we can read from files, URLs, or lists of `Block`s.

```@example cexutils
bdata = collectiondata(blks, msbimgs)
fdata = collectiondata(f, msbimgs, FileReader)
udata = collectiondata(u, msbimgs, UrlReader)

length(sdata) == length(bdata) == length(fdata) == length(udata)
```


### Find collections implementing a datamodel

The CEX format defines a `datamodels` block where you can tie the content of a CITE collection to a data model identified by a URN value.   The Homer Multitext project defines a data model for representing citable text on a manuscript page.

```@example cexutils
model = Cite2Urn("urn:cite2:hmt:datamodels.v1:textonpage")
```

We can find `Cite2Urn`s for all collections implementing this model.

```@example cexutils
collectionurns_for_model(s, model)
```

The results are the same no matter what kind of source we read from.

```@example cexutils
bmodelurns = collectionurns_for_model(blks, msbimgs)
fmodelurns = collectionurns_for_model(f, msbimgs, FileReader)
umodelurns = collectionurns_for_model(u, msbimgs, UrlReader)

bmodelurns == fmodelurns == umodelurns
```

### Find collection data for a datamodel

###  collect relation blocks for urn


