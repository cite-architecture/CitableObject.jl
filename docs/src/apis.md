# API Documentation


```@meta
CurrentModule = CitableObject
```

## Types
```@docs
Cite2Urn
CitableByCite2Urn
Cite2UrnComparable
```
## Functions

Manipulating `Cite2Urn`s:

```@docs
namespace
collectioncomponent
objectcomponent
isrange
rangebegin
rangeend
supportssubref
hassubref
subref
dropsubref
supportsversion
dropversion
addversion
versionid
dropproperty
addproperty
```

Comparing a pair of `Cite2Urn`s:

```@docs
urncontains
urnequals
urnsimilar
```

## `CexUtils` submodule

```@docs
CitableObject.CexUtils.properties
CitableObject.CexUtils.collectiondata
CitableObject.CexUtils.implementations
CitableObject.CexUtils.data_for_model
CitableObject.CexUtils.relations_for_model
```