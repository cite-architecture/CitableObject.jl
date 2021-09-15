


"""
$(SIGNATURES)
True if  `urn1` contains or is equal to `urn2` accroding to URN logic.

```
"""
function urncontains(u1, u2)
    objidmatch = isnothing(objectcomponent(u1)) || objectcomponent(u1) == objectcomponent(u2)
    objidmatch && collectioncontains(u1, u2)
end


"""
$(SIGNATURES)
True if collection component of `urn1` contains or is equal to collection component of `urn2`.

```
"""
function collectioncontains(u1, u2)
    if  length(collectionparts(u1)) < length(collectionparts(u2))
        true
    else
        collectionparts(u1)[1:length(collectionparts(u2))] == collectionparts(u2)
    end
end


"""
$(SIGNATURES)
Override `similar` function to be true if `urn1` and `urn1` are similar by URN logic.
"""
function similar(urn1::Cite2Urn, urn2::Cite2Urn)
    urn1.urn == urn2.urn || urncontains(urn1, urn2) || urncontains(urn2, urn1)
end
