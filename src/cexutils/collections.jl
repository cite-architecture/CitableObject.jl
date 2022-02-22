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
    urnindex = columndict(datablock)["urn"]
    cols = split(datablock.lines[2], delimiter)
    cols[urnindex]
end


"""Find all data lines in the CEX string `s` contained by `u`.
$(SIGNATURES)
"""
function collectiondata(s::AbstractString, u::Cite2Urn; delimiter = "|")
    # Parse by block since column position of URN is not guaranteed.
    ustring = string(u)
    matchingblocks = []
    for b in  blocks(s, "citedata")
        if startswith(urnpeek(b, delimiter = delimiter), ustring)
            push!(matchingblocks, b.lines[2:end])
        end
    end
    matchingblocks |> Iterators.flatten |> collect
end




"""Find all property definitions in `blks` contained by `u`.
$(SIGNATURES)
"""
function collectiondata(blks::Vector{Block}, u::Cite2Urn; delimiter = "|")
    propdata = data(blks, "citeproperties")
    matchingproperties(propdata,u)
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