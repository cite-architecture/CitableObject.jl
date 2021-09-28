

"""
$(SIGNATURES)
Extract CITE2 collection identifer from a Cite2Urn.

# Examples
```julia-repl
julia>
urn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
collectionid(urn)
```
"""
function collectionid(u::Cite2Urn)
    allcomponents = components(u.urn) 
    collparts = allcomponents[4]  |> parts
    if isempty(collparts)
        nothing
    else 
        collparts[1]
    end
end


"""
$(SIGNATURES)
Extract CITE2 collection identifer from a Cite2Urn.

# Examples
```julia-repl
julia>
urn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
collectionid(urn)
```
"""
function versionid(u::Cite2Urn)
    allcomponents = components(u.urn) 
    collparts = allcomponents[4]  |> parts
    if length(collparts) < 2
        nothing
    else
        collparts[2]
    end
end

"""
$(SIGNATURES)
Extract CITE2 property identifer from a Cite2Urn.
"""
function propertyid(u::Cite2Urn)
    allcomponents = components(u.urn) 
    collparts = allcomponents[4]  |> parts
    if length(collparts) < 3
        nothing
    else
        collparts[3]
    end
end