using CitableObject
using CiteEXchange


"""Find all data lines in the CEX string `s` for collections implementing `datamodel`.
$(SIGNATURES)
"""
function data_for_model(s::AbstractString, datamodel::Cite2Urn; delimiter = "|")
    urns = implementations(s, datamodel, delimiter = delimiter)
    map(u -> collectiondata(s,u), urns) |> Iterators.flatten |> collect
end

"""Find all data lines in `blks` for collections implementing `datamodel`.
$(SIGNATURES)
"""
function data_for_model(blks::Vector{Block}, datamodel::Cite2Urn; delimiter = "|")
    urns = implementations(blks, datamodel, delimiter = delimiter)
    map(u -> collectiondata(blks,u), urns) |> Iterators.flatten |> collect
end




"""Dispatch `data_for_model` on `T`.

$(SIGNATURES)
"""    
function data_for_model(cexsrc::AbstractString, datamodel::Cite2Urn, reader::T; delimiter = "|") where {T <: ReaderType}
    data_for_model(cexsrc, datamodel, T, delimiter = delimiter)
end

"""Find all data lines in file `filesrc` for collections implementing `datamodel`.
$(SIGNATURES)
"""
function data_for_model(filesrc::AbstractString, datamodel::Cite2Urn, freader::Type{FileReader}; delimiter = "|")
    s = read(filesrc) |> String 
    data_for_model(s, datamodel, delimiter = delimiter)
end

"""Find all data lines in content of `url` implementing `datamodel`.
$(SIGNATURES)
"""
function data_for_model(url::AbstractString, datamodel::Cite2Urn, freader::Type{UrlReader}; delimiter = "|")
   s = Downloads.download(url) |> read |> String
    data_for_model(s, datamodel, delimiter = delimiter)
end

"""Find  all data lines in `s` implementing `datamodel`.
$(SIGNATURES)
"""
function data_for_model(s::AbstractString, datamodel::Cite2Urn, freader::Type{StringReader}; delimiter = "|")
    data_for_model(s, datamodel, delimiter = delimiter)
end

