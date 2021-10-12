![build](https://github.com/cite-architecture/CitableObject.jl/actions/workflows/Documentation.yml/badge.svg)


# CitableObject.jl

A Julia module for working with citable objects identified by `Cite2Urn`.  

The `Cite2Urn` implements the `Urn` abstraction (from the [CitableBase module](https://cite-architecture.github.io/CitableBase.jl/stable/).  ([`CitableText.jl`](https://cite-architecture.github.io/CitableText.jl/stable/) is a parallel module for working with citable passages of texts identified by `CtsUrn`.)


## Plans for version 1.0


### Working with CITE2 URNs.


- [x] adding/dropping the object identifier of a Cite2Urn
- [x] adding/dropping the version part of a Cite2Urn's collection hierarchy
- [x] identifying ranges
- [x] extracting beginning and ending components of ranges
- [x] identifying and extracting extended object identifers (*subreferences*)

