using CitableObject
using CiteEXchange

"""Find catalog label, if any, for `u` in CEX source `s`.
If no catalog found, compose machine-generated label.
$(SIGNATURES)
"""
function cataloglabel(s::AbstractString, u::Cite2Urn; delimiter = "|")
    cataloglabel(blocks(s, "citecollections"), u)
end


"""Find catalog label, if any, for `u` in CEX source `s`.
If no catalog found, compose machine-generated label.
$(SIGNATURES)
"""
function cataloglabel(blks::Vector{Block}, u::Cite2Urn; delimiter = "|")
    catlines  = data(blks, "citecollections")
    ustring = string(u)
    lbl = ""
    for ln in catlines
        if startswith(ln, ustring)
            cols = split(ln, delimiter)
            lbl = cols[2]
        end
    end
    isempty(lbl) ? "Uncataloged collection <$(ustring)>" : lbl
end


#=

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
=#