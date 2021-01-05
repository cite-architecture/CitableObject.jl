# CitableObject.jl


A Julia module for working with citable objects identified by Cite2Urn.

## Plans for version 1.0


### Working with CITE2 URNs.


- [ ] adding/dropping the object identifier of a Cite2Urn
- [ ] adding/dropping the version part of a Cite2Urn's collection hierarchy
- [ ] identifying ranges
- [ ] extracting beginning and ending components of ranges
- [ ] identifying and extracting extended object identifers *(subreferences)


## Working with a collection of citable objects


URN comparison

- [ ] containment
- [ ] equality (==)
- [ ] similarity

Retrieval:

- [ ] single object
- [ ] range

Navigation:

- [ ] identify if collection is ordered
- [ ] find next node in ordered collection
- [ ] find previous node in ordered collection


## Working with a catalog of collections

- [ ] load from delimited text sources
- [ ] compare contents of a catalog with contents of a repository

