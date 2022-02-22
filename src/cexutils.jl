using CitableObject
using CiteEXchange

#=
1. collect properties for urn
5.  collect data blocks for urn
3. collect collection urns for datamodel:
4. collect relation blocks for urn
=#

"""From a list of string values, find those with first delimited column
matching `u` by URN containment.
$(SIGNATURES)
"""
function matchingproperties(lines::Vector{<: AbstractString}, u::Cite2Urn, delimiter::AbstractString)
    matchinglines = []
    for prop in lines
        columns = split(prop, delimiter)
        if urncontains(u, Cite2Urn(columns[1]))
            push!(matchinglines, prop)
        end
    end
    matchinglines
end

"""Find all property definitions in the CEX string `s` contained by `u`.
$(SIGNATURES)
"""
function properties(s::AbstractString, u::Cite2Urn; delimiter = "|")
    propdata = data(s, "citeproperties")
    matchingproperties(propdata,u,delimiter)
end

"""Find all property definitions in `blks` contained by `u`.
$(SIGNATURES)
"""
function properties(blks::Vector{Block}, u::Cite2Urn; delimiter = "|")
    propdata = data(blks, "citeproperties")
    matchingproperties(propdata,u,delimiter)
end




"""DOCUMENT ME"""
function collections_for_model(s::AbstractString, u::Cite2Urn)
    "Get URNs of collections for data model `u`"
end


"""DOCUMENT ME"""
function relations(s::AbstractString, u::Cite2Urn)
    "Get relations"
end


"""DOCUMENT ME"""
function collectiondata(s::AbstractString, u::Cite2Urn)
end

