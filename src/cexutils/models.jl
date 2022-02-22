using CitableObject
using CiteEXchange






"""DOCUMENT ME"""
function collectionurns_for_model(s::AbstractString, u::Cite2Urn; delimiter = "|")
    collectionurns_for_model(blocks(s, "datamodels"), u, delimiter = "|")
end
#Collection|Model|Label|Description



"""Find `Cite2Urn`s for all collections in `blks` implementing `datamodel`.
$(SIGNATURES)
"""
function collectionurns_for_model(blks::Vector{Block}, datamodel::Cite2Urn; delimiter = "|")
    ustring = string(datamodel)
    collectionlist = []
    for dmentry in data(blks, "datamodels")
        cols = split(dmentry, delimiter)
        if cols[2] == ustring
            push!(collectionlist, Cite2Urn(cols[1]))
        end
    end
    collectionlist
end

#=
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

=#