using CitableObject
using CiteEXchange



"""Find relations data for all relation sets in `s` contained by `u`.
$(SIGNATURES)
"""
function relations_for_model(s::AbstractString, u::Cite2Urn; delimiter = "|")
    relations(blocks(s, "citerelationset"), u, delimiter = delimiter)
end

#=
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

=#