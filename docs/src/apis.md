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
CitableObject.CexUtils.relations
CitableObject.CexUtils.collectionurns_for_model
```