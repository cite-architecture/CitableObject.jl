
"Implementation of the Cite Object URN. See  [http://cite-architecture.org/cite2urn/](http://cite-architecture.org/cite2urn/)."
struct Cite2Urn <: Urn
    urn::AbstractString
    function Cite2Urn(s)
        try
            ok = validurn(s)
        catch e
            throw(e)
        end
        new(s)
    end
end


"""A value of `CitableBase.CitableTrait` that can be used for content citable by `CtsUrn`.
"""
struct CitableByCite2Urn <: CitableTrait end
UrnComparisonTrait(Cite2Urn)  = UrnComparable()


"""Override `Base.show` for `Cite2Urn`.

$(SIGNATURES)
"""
function show(io::IO, urn::Cite2Urn)
    print(io,urn.urn)
end


"""Override `Base.print` for `Cite2Urn`.

$(SIGNATURES)
"""
function print(io::IO, urn::Cite2Urn)
    print(io,urn.urn)
end
