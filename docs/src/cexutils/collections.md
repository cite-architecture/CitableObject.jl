```@setup cexutils
root = pwd() |> dirname |> dirname |> dirname
```

# Utilities for working with citable collections

In the CEX format, `citedata` blocks contain tables of data.  Metadata about the structure of these data can be added in `citeproperties` blocks.  Semantic models for those structures can be specified in `datamodels` blocks.  The `CexUtils` submodule simplifies coordinating these three facets of a collection: data, structural metadata, semantic model.



## Data used in these examples

The utility functions documented here are designed to work identically with multiple kinds of CEX sources: pure CEX strings, blocks of CEX data parsed into the `CiteEXchange` module's `Block` structure, files with CEX data, or CEX content located at a URL.

The examples in the following pages are illustrated using the `hmt-2022k.cex` published release of the Homer Multitext project, a complex CEX source with roughly 18 Mb of plain-text data.  A copy of that file is in the `test/data` directory of this repository. 

```@example cexutils 
f = joinpath(root, "test", "data", "hmt-2022k.cex")
s = read(f) |> String
u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 
using CiteEXchange
blks = blocks(s) 
# Length in characters:
length(s)
```


### Find properties of a citable collection

`urn:cite2:hmt:msB.v1:` identifies a collection of images of a particular manuscript.  Let's use the CEX string to find structural metadata -- the properties of that collection. (Concretely, that means finding the relevant content of all `citeproperties` blocks in the CEX source).

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

Like everything else in the CITE architecture, we identify data models with a URN. The Homer Multitext project defines a data model for the structure of a manuscript (or *codex*).

```@example cexutils
model = Cite2Urn("urn:cite2:hmt:datamodels.v1:codexmodel")
```

We can find `Cite2Urn`s for all collections implementing this model.

```@example cexutils
implementations(s, model)
```
The results are the same no matter what kind of source we read from.

```@example cexutils
bmodelurns = implementations(blks, msbimgs)
fmodelurns = implementations(f, msbimgs, FileReader)
umodelurns = implementations(u, msbimgs, UrlReader)

bmodelurns == fmodelurns == umodelurns
```

### Find collection data for a datamodel

We could manually collect URNs for collections implementing a data model, then find data for each collection, but with the `data_for_model` function we can collect all data for all collections implementing a model in a single step.

```@example cexutils
s_implementingdata = data_for_model(s, model)
```

Of course this works with any CEX source.

```@example cexutils
b_implementingdata = data_for_model(blks, model)
f_implementingdata = data_for_model(f, model, FileReader) 
u_implementingdata =  data_for_model(u, model, UrlReader)
s_implementingdata == b_implementingdata == f_implementingdata == u_implementingdata
```

### Find a human-readable label for a collection

The `cataloglabel` function finds the description property of the catalog entry for a given collection.  (If the collection is not cataloged, it generates a generic label.)

  
```@example cexutils
msb = Cite2Urn("urn:cite2:hmt:msB.v1:")
s_label = cataloglabel(s, msb)
```

Or from any other source:

```@example cexutils
b_label = cataloglabel(blocks(s), msb)
f_label = cataloglabel(f, msb, FileReader)
u_label = cataloglabel(u, msb, UrlReader)
s_label == b_label == f_label == u_label
```
### Find URN/label pairs for collections implementing a data model
