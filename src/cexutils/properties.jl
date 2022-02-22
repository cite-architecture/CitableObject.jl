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

"""Dispatch `properties` on `T`.

$(SIGNATURES)
"""    
function properties(cexsrc::AbstractString, u::Cite2Urn, reader::T; delimiter = "|") where {T <: ReaderType}
    properties(cexsrc, u, T, delimiter = delimiter)
end

"""Find all property definitions in CEX file `filesrc` contained by `u`.
$(SIGNATURES)
"""
function properties(filesrc::AbstractString, u::Cite2Urn, freader::Type{FileReader}; delimiter = "|")
    s = read(filesrc) |> String
    properties(s, u, delimiter = delimiter)
end


"""Find all property definitions in CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function properties(url::AbstractString, u::Cite2Urn, ureader::Type{UrlReader}; delimiter = "|")
    s = Downloads.download(url) |> read |> String
    properties(s, u, delimiter = delimiter)
end

"""Find all property definitions in CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function properties(s::AbstractString, u::Cite2Urn, sreader::Type{StringReader}; delimiter = "|")
    properties(s, u, delimiter = delimiter)
end