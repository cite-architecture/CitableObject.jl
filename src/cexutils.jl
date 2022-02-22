using CitableObject

#=
1. collect properties for urn
5.  collect data blocks for urn
3. collect collection urns for datamodel:
4. collect relation blocks for urn
=#


"""Find all property definitions in the CEX string `s` contained by `u`.
$(SIGNATURES)
"""
function properties(s::AbstractString, u::Cite2Urn; delimiter = "|")
    "Get properties"
    propdata = data(s, "citeproperties")
    matchinglines = []
    for prop in propdata
        columns = split(prop, delimiter)
        if urncontains(u, Cite2Urn(columns[1]))
            push!(matchinglines, prop)
        end
    end
    #  "Property|Label|Type|Authority list"
    matchinglines
end


function collections_for_model(s::AbstractString, u::Cite2Urn)
    "Get URNs of collections for data model `u`"
end


"""
"""
function relations(s::AbstractString, u::Cite2Urn)
    "Get relations"
end



function collectiondata(s::AbstractString, u::Cite2Urn)
end

