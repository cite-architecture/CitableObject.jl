using CitableObject
using CiteEXchange


#=
#!citerelationset
urn|urn:cite2:hmt:hmtdse.v1:
label|Homer Multitext project indexing of digital scholarly editions
passage|imageroi|surface
urn:cts:greekLit:tlg0012.tlg001.e3:8.1|urn:cite2:hmt:e3bifolio.v1:E3_97bisv_98r@0.501,0.3063,0.224,0.043$

=#

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
function relations(s::AbstractString, u::Cite2Urn; delimiter = "|")
    relations(blocks(s, "citerelationset"), u, delimiter = delimiter)
end

"""Find relations data for all relation sets in `blks` contained by `u`.
$(SIGNATURES)
"""
function relations(blks::Vector{Block}, u::Cite2Urn; delimiter = "|")
    ustring = string(u)
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
function relations(cexsrc::AbstractString, u::Cite2Urn, reader::T; delimiter = "|") where {T <: ReaderType}
    relations(cexsrc, u, T, delimiter = delimiter)
end

"""Find relations data for all relation sets in CEX file `filesrc` contained by `u`.
$(SIGNATURES)
"""
function relations(filesrc::AbstractString, u::Cite2Urn, freader::Type{FileReader}; delimiter = "|")
    blks = read(filesrc) |> String |> blocks
    relations(blks, u, delimiter = delimiter)
end


"""Find relations data for all relation sets from CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function relations(url::AbstractString, u::Cite2Urn, freader::Type{UrlReader}; delimiter = "|")
    blks =  s = Downloads.download(url) |> read |> String |> blocks
    relations(blks, u, delimiter = delimiter)
end




"""Find relations data for all relation sets in `s` contained by `u`.
$(SIGNATURES)
"""
function relations(s::AbstractString, u::Cite2Urn, freader::Type{StringReader}; delimiter = "|")
    relations(s, u, delimiter = delimiter)
end
