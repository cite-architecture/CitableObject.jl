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
If no catalog found, compose machine-generated label.
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