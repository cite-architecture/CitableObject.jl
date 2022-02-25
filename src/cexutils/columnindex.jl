using CitableObject
using CiteEXchange


"""Compute index of headers to columns in `citedata` block `blk`.
$(SIGNATURES)
"""
function columnindex(blk::Block; delimiter = "|")
    hdr = blk.lines[1]
    cols = split(hdr, delimiter)
    orderdict = Dict()
    for i in 1:length(cols)
        orderdict[lowercase(cols[i])] = i
    end
    orderdict
end


"""Find a single block of CITE collection data matching `u`
$(SIGNATURES)
"""
function collectionblock(blks::Vector{Block}, u::Cite2Urn; delimiter = "|")
    ustring = string(u)
    matchingblock = nothing
    for b in blocks(blks, "citedata")
        if startswith(urnpeek(b, delimiter = delimiter), ustring)
            matchingblock = b
        end
    end
    matchingblock
end

"""Find a single block of CITE collection data matching `u`
$(SIGNATURES)
"""
function collectionblock(s::AbstractString, u::Cite2Urn; delimiter = "|")
    collectionblock(blocks(s), u, delimiter = delimiter)
end

#=
"""Dispatch `collectionblock` on `T`.

$(SIGNATURES)
"""    
function collectionblock(cexsrc::AbstractString, u::Cite2Urn, reader::T; delimiter = "|") where {T <: ReaderType}
    collectionblock(cexsrc, u, T, delimiter = delimiter)
end

"""Find a single block in CEX file `filesrc` contained by `u`.
$(SIGNATURES)
"""
function collectionblock(filesrc::AbstractString, u::Cite2Urn, freader::Type{FileReader}; delimiter = "|")
    s = read(filesrc) |> String
    collectionblock(s, u, delimiter = delimiter)
end


"""Find a single block of cite collection data in CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function collectionblock(url::AbstractString, u::Cite2Urn, ureader::Type{UrlReader}; delimiter = "|")
    s = Downloads.download(url) |> read |> String
    collectionblock(s, u, delimiter = delimiter)
end

"""Find a single block of cite collection data in CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function collectionblock(s::AbstractString, u::Cite2Urn, sreader::Type{StringReader}; delimiter = "|")
    collectionblock(s, u, delimiter = delimiter)
end
=#