using CitableObject
using CiteEXchange


#=
#!citerelationset
urn|urn:cite2:hmt:hmtdse.v1:
label|Homer Multitext project indexing of digital scholarly editions
passage|imageroi|surface
urn:cts:greekLit:tlg0012.tlg001.e3:8.1|urn:cite2:hmt:e3bifolio.v1:E3_97bisv_98r@0.501,0.3063,0.224,0.043$

=#
"""DOCUMENT ME"""
function relations(s::AbstractString, u::Cite2Urn)
    ustring = string(u)
    "Get relations"
end




#=

"""Find `Cite2Urn`s for all collections in `s` implementing `datamodel`.
$(SIGNATURES)
"""
function data_for_model(s::AbstractString, datamodel::Cite2Urn; delimiter = "|")
    data_for_model(blocks(s, "datamodels"), u, delimiter = "|")
end




"""Find `Cite2Urn`s for all collections in `blks` implementing `datamodel`.
$(SIGNATURES)
"""
function data_for_model(blks::Vector{Block}, datamodel::Cite2Urn; delimiter = "|")
    ustring = string(datamodel)
    collectionlist = []
    
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

"""Dispatch `data_for_model` on `T`.

$(SIGNATURES)
"""    
function data_for_model(cexsrc::AbstractString, datamodel::Cite2Urn, reader::T; delimiter = "|") where {T <: ReaderType}
    data_for_model(cexsrc, datamodel, T, delimiter = delimiter)
end

"""Find  `Cite2Urn`s for all collections in CEX file `filesrc` implementing `datamodel`.
$(SIGNATURES)
"""
function data_for_model(filesrc::AbstractString, datamodel::Cite2Urn, freader::Type{FileReader}; delimiter = "|")
    blks = read(filesrc) |> String |> blocks
    data_for_model(blks, datamodel, delimiter = delimiter)
end


"""Find  `Cite2Urn`s for all collections in CEX file `filesrc` implementing `datamodel`.
$(SIGNATURES)
"""
function data_for_model(url::AbstractString, datamodel::Cite2Urn, freader::Type{UrlReader}; delimiter = "|")
    blks =  s = Downloads.download(url) |> read |> String |> blocks
    data_for_model(blks, datamodel, delimiter = delimiter)
end

"""Find  `Cite2Urn`s for all collections in CEX file `filesrc` implementing `datamodel`.
$(SIGNATURES)
"""
function data_for_model(s::AbstractString, datamodel::Cite2Urn, freader::Type{StringReader}; delimiter = "|")
    data_for_model(s, datamodel, delimiter = delimiter)
end

=#
