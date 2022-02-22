using CitableObject
using CiteEXchange

#=
1. √ collect properties for urn
5.  collect data blocks for urn
3. collect collection urns for datamodel:
4. collect relation blocks for urn
=#

"""Map column labels to column numbers
$(SIGNATURES)
"""
function columndict(b::Block; delimiter = "|")
    hdr = b.lines[1]
    cols = split(hdr, delimiter)
    orderdict = Dict()
    for i in 1:length(cols)
        orderdict[lowercase(cols[i])] = i
    end
    orderdict
end


"""Peek at URN value for first data row in a `citedata` block.
$(SIGNATURES)
"""
function urnpeek(datablock::Block; delimiter = "|")
    dict = columndict(datablock)
    if ! haskey(dict, "urn")
        throw(DomainError("No URN column in ", datablock.lines[1]))
    end
    urnindex = dict["urn"]
    cols = split(datablock.lines[2], delimiter)
    cols[urnindex]
end

"""Find all data lines in `blks`` contained by `u`.
$(SIGNATURES)
"""
function collectiondata(blks::Vector{Block}, u::Cite2Urn; delimiter = "|")
    ustring = string(u)
    matchingblocks = []
    for b in blocks(blks, "citedata")
        if startswith(urnpeek(b, delimiter = delimiter), ustring)
            push!(matchingblocks, b.lines[2:end])
        end
    end
    matchingblocks |> Iterators.flatten |> collect
end

"""Find all data lines in the CEX string `s` contained by `u`.
$(SIGNATURES)
"""
function collectiondata(s::AbstractString, u::Cite2Urn; delimiter = "|")
    collectiondata(blocks(s, "citedata"), u, delimiter = delimiter)
end


"""Dispatch `collectiondata` on `T`.

$(SIGNATURES)
"""    
function collectiondata(cexsrc::AbstractString, u::Cite2Urn, reader::T; delimiter = "|") where {T <: ReaderType}
    collectiondata(cexsrc, u, T, delimiter = delimiter)
end

"""Find all data lines in CEX file `filesrc` contained by `u`.
$(SIGNATURES)
"""
function collectiondata(filesrc::AbstractString, u::Cite2Urn, freader::Type{FileReader}; delimiter = "|")
    s = read(filesrc) |> String
    collectiondata(s, u, delimiter = delimiter)
end


"""Find all data lines in CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function collectiondata(url::AbstractString, u::Cite2Urn, ureader::Type{UrlReader}; delimiter = "|")
    s = Downloads.download(url) |> read |> String
    collectiondata(s, u, delimiter = delimiter)
end

"""Find all property definitions in CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function collectiondata(s::AbstractString, u::Cite2Urn, sreader::Type{StringReader}; delimiter = "|")
    collectiondata(s, u, delimiter = delimiter)
end
