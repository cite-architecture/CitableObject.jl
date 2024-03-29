"Value for URN comparison trait on `CtsUrn`DocStringExtensions"
struct Cite2UrnComparable <: UrnComparisonTrait end


"""`CtsUrn`s are URN comparable.
$(SIGNATURES)
"""
function urncomparisontrait(::Type{Cite2Urn}) 
    Cite2UrnComparable()
end


"""
$(SIGNATURES)
True if  `urn1` contains or is equal to `urn2` accroding to URN logic.

```
"""
function urncontains(u1::Cite2Urn, u2::Cite2Urn)
    objidmatch = isnothing(objectcomponent(u1)) || objectcomponent(u1) == objectcomponent(u2)
    objidmatch && collectioncontains(u1, u2)
end


"""
$(SIGNATURES)
True if collection component of `urn1` contains or is equal to collection component of `urn2`.

```
"""
function collectioncontains(u1::Cite2Urn, u2::Cite2Urn)
    intersect(collectionparts(u1), collectionparts(u2)) == collectionparts(u1)
end


"""
$(SIGNATURES)
Override `similar` function to be true if `urn1` and `urn1` are similar by URN logic.
"""
function urnsimilar(urn1::Cite2Urn, urn2::Cite2Urn)
    urn1.urn == urn2.urn || urncontains(urn1, urn2) || urncontains(urn2, urn1)
end


"""
$(SIGNATURES)
Override `urnequals` function for `Cite2Urn`s.
"""
function urnequals(urn1::Cite2Urn, urn2::Cite2Urn)
    urn1.urn == urn2.urn
end