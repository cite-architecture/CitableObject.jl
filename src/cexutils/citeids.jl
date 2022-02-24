using CitableObject
using CiteEXchange



"""Find a urn/label pair for a collection or relation set
identified by `u`.
$(SIGNATURES)
Results are a `NamedTuple` with keys `:urn` and  `:label`.
"""
function citeid(s::AbstractString, u::Cite2Urn)
    if isnothing(objectcomponent(u))
        # Can't be a relation set, so just get collection label:
        pair = (urn=u, label=cataloglabel(s, u))
    else
        # Can't be collection, so get relation set:
        pair =  (urn=u, label=relationsetlabel(s, u))
    end
    pair
end

"""Find a urn/label pair for a collection or relation set
identified by `u`.
$(SIGNATURES)
Results are a `NamedTuple` with keys `:urn` and  `:label`.
"""
function citeid(blks::Vector{Block}, u::Cite2Urn)
    
    if isnothing(objectcomponent(u))
        # Can't be a relation set, so just get collection label:
        pair = (urn=u, label=cataloglabel(blks, u))
    else
        # Can't be collection, so get relation set:
        pair =  (urn=u, label=relationsetlabel(blks, u))
    end
    pair
end



"""Find urn/label pairs for all collections or relation sets in `s`
implementing `model`.
$(SIGNATURES)
Results are a `NamedTuple` with keys `:urn` and  `:label`.
"""
function citeids(s::AbstractString, model::Cite2Urn)
    impls = implementations(s, model)
    map(u -> citeid(s, u), impls)
end

"""Find urn/label pairs for all collections or relation sets in `blks`
implementing `model`.
$(SIGNATURES)
Results are a `NamedTuple` with keys `:urn` and  `:label`.
"""
function citeids(blks::Vector{Block}, model::Cite2Urn)
    impls = implementations(blks, model)
    map(u -> citeid(blks, u), impls)
end

"""Dispatch `citeids` on `T`.

$(SIGNATURES)
"""    
function citeids(cexsrc::AbstractString, model::Cite2Urn, reader::T) where {T <: ReaderType}
    citeids(cexsrc, model, T)
end

"""Find urn/label pairs for all collections or relation sets in file `filesrc`
implementing `model`.
$(SIGNATURES)
"""
function citeids(filesrc::AbstractString, model::Cite2Urn, freader::Type{FileReader})
    blks = read(filesrc) |> String |> blocks
    citeids(blks, model)
end

#=

"""Find relations data for all relation sets from CEX at URL `url` contained by `u`.
$(SIGNATURES)
"""
function relations(url::AbstractString, u::Cite2Urn, freader::Type{UrlReader})
    blks =  s = Downloads.download(url) |> read |> String |> blocks
    relations(blks, u)
end

"""Find relations data for all relation sets in `s` contained by `u`.
$(SIGNATURES)
"""
function relations(s::AbstractString, u::Cite2Urn, freader::Type{StringReader})
    relations(s, u)
end

=#