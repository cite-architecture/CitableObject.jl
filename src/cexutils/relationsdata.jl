using CitableObject
using CiteEXchange



"""Find relations data for all relation sets in `s` implementing data model `dm`.
$(SIGNATURES)
"""
function relations_for_model(s::AbstractString, dm::Cite2Urn)
    relations_for_model(blocks(s), dm)
end

"""Find relations data for all relation sets in `blks` implementing data model `dm`.
$(SIGNATURES)
"""
function relations_for_model(blks::Vector{Block}, dm::Cite2Urn)
    results = []
    for b in implementations(blks, dm)
        push!(results, relations(blks, b))
    end
    results |> Iterators.flatten |> collect
end


"""Dispatch `relations` on `T`.

$(SIGNATURES)
"""    
function relations_for_model(cexsrc::AbstractString, dm::Cite2Urn, reader::T) where {T <: ReaderType}
    relations_for_model(cexsrc, dm, T)
end

"""Find relations data for all relation sets in CEX file `filesrc` implementing data model `dm`.
$(SIGNATURES)
"""
function relations_for_model(filesrc::AbstractString, dm::Cite2Urn, freader::Type{FileReader})
    blks = read(filesrc) |> String |> blocks
    relations_for_model(blks, dm)
end

"""Find relations data for all relation sets from CEX at URL `url` implementing data model `dm`.
$(SIGNATURES)
"""
function relations_for_model(url::AbstractString, dm::Cite2Urn, freader::Type{UrlReader})
    blks =  s = Downloads.download(url) |> read |> String |> blocks
    relations_for_model(blks, dm)
end

"""Find relations data for all relation sets in `s` implementing data model `dm`.
$(SIGNATURES)
"""
function relations_for_model(s::AbstractString, dm::Cite2Urn, freader::Type{StringReader})
    relations_for_model(s, dm)
end
