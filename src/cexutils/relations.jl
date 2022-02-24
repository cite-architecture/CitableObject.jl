using CitableObject
using CiteEXchange

"""True if the relation set in `blk` is contained by `u`.
$(SIGNATURES)
"""
function relationsmatch(blk::Block, u::Cite2Urn)
    stringcheck = "urn|" * string(u)
    startswith(blk.lines[1], stringcheck)
end

"""Find relations data for all relation sets in `s` contained by `u`.
$(SIGNATURES)
"""
function relations(s::AbstractString, u::Cite2Urn)
    relations(blocks(s, "citerelationset"), u)
end

"""Find relations data for all relation sets in `blks` contained by `u`.
$(SIGNATURES)
"""
function relations(blks::Vector{Block}, u::Cite2Urn)
    relationdata = []
    for b in blocks(blks, "citerelationset")
        if relationsmatch(b, u)
            push!(relationdata, b.lines[4:end])
        end
    end
    relationdata |> Iterators.flatten |> collect
end


"""Dispatch `relations` on `T`.

$(SIGNATURES)
"""    
function relations(cexsrc::AbstractString, u::Cite2Urn, reader::T) where {T <: ReaderType}
    relations(cexsrc, u, T)
end

"""Find relations data for all relation sets in CEX file `filesrc` contained by `u`.
$(SIGNATURES)
"""
function relations(filesrc::AbstractString, u::Cite2Urn, freader::Type{FileReader})
    blks = read(filesrc) |> String |> blocks
    relations(blks, u)
end

"""Find relations data for all relation sets from CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function relations(url::AbstractString, u::Cite2Urn, freader::Type{UrlReader})
    blks = Downloads.download(url) |> read |> String |> blocks
    relations(blks, u)
end

"""Find relations data for all relation sets in `s` contained by `u`.
$(SIGNATURES)
"""
function relations(s::AbstractString, u::Cite2Urn, freader::Type{StringReader})
    relations(s, u)
end
