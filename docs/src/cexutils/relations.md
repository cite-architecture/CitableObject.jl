```@setup relsets
using CiteEXchange
root = pwd() |> dirname |> dirname |> dirname
f = joinpath(root, "test", "data", "hmt-2022k.cex")
s = read(f) |> String
u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 
blks = blocks(s) 
```

# Utilities for working with citable relation sets

The `citerelationset` block of a CEX source defines a single citable object containing one or more relations among other citable content.  The Homer Multitext project data set that we used on the previous page, for example, includes relation sets recording that passages of text appear on particular pages of a manuscript.

With the `CexUtils` submodule, you can collect relations data for a specific relation set, or for all relation sets belonging to a specified collection of relation sets.   



##  Collect relations data for a single relation set

`urn:cite2:hmt:iliadindex.v1:e4` identifies a specific relation recording data for a single manuscript.


```@example relsets
using CitableObject
using CitableObject.CexUtils
relationset = Cite2Urn("urn:cite2:hmt:iliadindex.v1:e4")
e4_relations_string = relations(s, relationset)
length(e4_relations_string)
```

Reading from different types of CEX sources produces equivalent results.


```@example relsets
using CitableBase: FileReader
using CitableBase: UrlReader
e4_relations_blocks = relations(blocks(s), relationset)
e4_relations_file = relations(f, relationset, FileReader)
e4_relations_url = relations(u, relationset, UrlReader)
e4_relations_string == e4_relations_blocks == e4_relations_file == e4_relations_url
```


##  Collect relations data for a collection of relation sets

The Homer Multitext data include other relation sets belonging to the same collection.

```@example relsets
relationsetcollection = Cite2Urn("urn:cite2:hmt:iliadindex.v1:")
s_relations = relations(s, relationsetcollection)
length(s_relations)
```


```@example relsets
b_relations = relations(blocks(s), relationsetcollection)
f_relations = relations(f, relationsetcollection, FileReader)
u_relations = relations(u, relationsetcollection, UrlReader)
s_relations == b_relations ==  f_relations == u_relations
```


##  Collect relations data implementing a data model

Like any other citable collection, collections of relation sets can be associated with a data model.  Use the `relations_for_model` function to collect all relations for relation sets implementing a model.  In our sample data set, all the relation ssets implementing the "Text on page" model belong to the same citable collection, so the results will be identical to the previous examples.


```@example relsets
model = Cite2Urn("urn:cite2:hmt:datamodels.v1:textonpage")
s_modeldata = relations_for_model(s, model)
length(s_modeldata)
```

```@example relsets
b_modeldata = relations_for_model(blocks(s), model)
f_modeldata = relations_for_model(f, model, FileReader)
u_modeldata = relations_for_model(u, model, UrlReader)
s_modeldata == b_modeldata ==  f_modeldata == u_modeldata
```

### Find a human-readable label for a relation set

The `relationsetlabel` function finds the description property of an individual relation set.

```@example relsets
dseurn = Cite2Urn("urn:cite2:hmt:hmtdse.v1:all")
s_label = relationsetlabel(s, dseurn)
```

Or from any other source:

```@example relsets
b_label = relationsetlabel(blocks(s), dseurn)
f_label = relationsetlabel(f, dseurn, FileReader)
u_label = relationsetlabel(u, dseurn, UrlReader)
s_label == b_label == f_label == u_label
```

### Find URN/label pairs for relation set implementing a data model
