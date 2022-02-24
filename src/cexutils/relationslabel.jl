using CitableObject
using CiteEXchange

"""Find label for single relation set uniquely identifed by `u` in CEX source `s`.
If no catalog found, compose machine-generated label.
$(SIGNATURES)
"""
function relationsetlabel(s::AbstractString, u::Cite2Urn; delimiter = "|")
    relationsetlabel(blocks(s, "citerelationset"), u)
end

"""Find label for single relation set uniquely identifed by `u` in CEX source `s`.
$(SIGNATURES)
"""
function relationsetlabel(blks::Vector{Block}, u::Cite2Urn; delimiter = "|")
    ustring= string(u)
    relblocks = blocks(blks, "citerelationset")    
    lbl = ""
    
    for b in relblocks
        urnconfig = join(["urn", ustring], delimiter)
        #@info("Compare query/actual", urnconfig, b.lines[1])
        #@info("Equal?", (b.lines[1] == urnconfig))
        if b.lines[1] == urnconfig
            cols = split(b.lines[2], delimiter)
            lbl = cols[2]
            #@info("Now defined label as ", lbl)
        end
    end
    if isempty(lbl)
        throw(DomainError("No configured block found for $(ustring)"))
    end
    lbl
end

"""Dispatch `relationsetlabel` on `T`.

$(SIGNATURES)
"""    
function relationsetlabel(cexsrc::AbstractString, u::Cite2Urn, reader::T) where {T <: ReaderType}
    relationsetlabel(cexsrc, u, T)
end

"""Find label for single relation set uniquely identifed by `u` in CEX source `s`.
$(SIGNATURES)
"""
function relationsetlabel(filesrc::AbstractString, u::Cite2Urn, freader::Type{FileReader})
    s = read(filesrc) |> String
    relationsetlabel(s, u)
end

"""Find label for single relation set uniquely identifed by `u` at URL `url`.
$(SIGNATURES)
"""
function relationsetlabel(url::AbstractString, u::Cite2Urn, freader::Type{UrlReader})
    s = Downloads.download(url) |> read |> String
    relationsetlabel(s, u)
end

"""Find label for single relation set uniquely identifed by `u`.
$(SIGNATURES)
"""
function relationsetlabel(s::AbstractString, u::Cite2Urn, sreader::Type{StringReader})
    relationsetlabel(s, u)
end
