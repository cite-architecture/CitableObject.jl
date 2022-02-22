using CitableObject
using CiteEXchange

"""From a list of string values, extract those where the first delimited column
matches `u` by URN containment.
$(SIGNATURES)
Since property definitions must be specific to a version, we can use string comparison
rather than the more expensive `urncontains` to filter these values.
"""
function matchingproperties(lines::Vector{<: AbstractString}, u::Cite2Urn)
    collectionstr = string(u)[1:end-1] # drop trailing ":"
    filter(ln -> startswith(ln, collectionstr), lines)
end

"""Find all property definitions in the CEX string `s` contained by `u`.
$(SIGNATURES)
"""
function properties(s::AbstractString, u::Cite2Urn)
    propdata = data(s, "citeproperties")
    matchingproperties(propdata,u)
end

"""Find all property definitions in `blks` contained by `u`.
$(SIGNATURES)
"""
function properties(blks::Vector{Block}, u::Cite2Urn)
    propdata = data(blks, "citeproperties")
    matchingproperties(propdata,u)
end

"""Dispatch `properties` on `T`.

$(SIGNATURES)
"""    
function properties(cexsrc::AbstractString, u::Cite2Urn, reader::T) where {T <: ReaderType}
    properties(cexsrc, u, T)
end

"""Find all property definitions in CEX file `filesrc` contained by `u`.
$(SIGNATURES)
"""
function properties(filesrc::AbstractString, u::Cite2Urn, freader::Type{FileReader})
    s = read(filesrc) |> String
    properties(s, u)
end


"""Find all property definitions in CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function properties(url::AbstractString, u::Cite2Urn, ureader::Type{UrlReader})
    s = Downloads.download(url) |> read |> String
    properties(s, u)
end

"""Find all property definitions in CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function properties(s::AbstractString, u::Cite2Urn, sreader::Type{StringReader})
    properties(s, u)
end