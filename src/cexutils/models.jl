using CitableObject
using CiteEXchange

"""Find `Cite2Urn`s for all collections in `s` implementing `datamodel`.
$(SIGNATURES)
"""
function implementations(s::AbstractString, datamodel::Cite2Urn; delimiter = "|")
    implementations(blocks(s, "datamodels"), datamodel, delimiter = delimiter)
end

"""Find `Cite2Urn`s for all collections in `blks` implementing `datamodel`.
$(SIGNATURES)
"""
function implementations(blks::Vector{Block}, datamodel::Cite2Urn; delimiter = "|")
    ustring = string(datamodel)
    collectionlist = Cite2Urn[]
    
    for dmentry in data(blks, "datamodels")

        cols = split(dmentry, delimiter)
        # Format is:
        #Collection|Model|Label|Description
        if cols[2] == ustring
            push!(collectionlist, Cite2Urn(cols[1]))
        end
    end
    collectionlist
end

"""Dispatch `implementations` on `T`.

$(SIGNATURES)
"""    
function implementations(cexsrc::AbstractString, datamodel::Cite2Urn, reader::T; delimiter = "|") where {T <: ReaderType}
    implementations(cexsrc, datamodel, T, delimiter = delimiter)
end

"""Find  `Cite2Urn`s for all collections in CEX file `filesrc` implementing `datamodel`.
$(SIGNATURES)
"""
function implementations(filesrc::AbstractString, datamodel::Cite2Urn, freader::Type{FileReader}; delimiter = "|")
    blks = read(filesrc) |> String |> blocks
    implementations(blks, datamodel, delimiter = delimiter)
end


"""Find  `Cite2Urn`s for all collections in CEX file `filesrc` implementing `datamodel`.
$(SIGNATURES)
"""
function implementations(url::AbstractString, datamodel::Cite2Urn, freader::Type{UrlReader}; delimiter = "|")
    blks = Downloads.download(url) |> read |> String |> blocks
    implementations(blks, datamodel, delimiter = delimiter)
end

"""Find  `Cite2Urn`s for all collections in CEX file `filesrc` implementing `datamodel`.
$(SIGNATURES)
"""
function implementations(s::AbstractString, datamodel::Cite2Urn, freader::Type{StringReader}; delimiter = "|")
    implementations(s, datamodel, delimiter = delimiter)
end
