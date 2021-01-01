
"""
$(SIGNATURES)
Extract CITE2 namespace from a CtsUrn.

# Examples
```julia-repl
julia>
namespace(Cite2Urn("urn:cite2:hmt:msA.v1:12r"))
```
"""
function namespace(u::Cite2Urn)
    allcomponents = components(u.urn)
    allcomponents[3]  
end


"""
$(SIGNATURES)
Extract CITE2 work component from a CtsUrn.

# Examples
```julia-repl
julia>
workcomponent(Cite2Urn("urn:cite2:hmt:msA.v1:12r"))
```
"""
function workcomponent(u::Cite2Urn)
    allcomponents = components(u.urn)
    allcomponents[4]  
end

"""
$(SIGNATURES)
Extract CITE2 object component from a CtsUrn.

# Examples
```julia-repl
julia>
objectcomponent(Cite2Urn("urn:cite2:hmt:msA.v1:12r"))
```
"""
function objectcomponent(u::Cite2Urn)
    allcomponents = components(u.urn)
    if allcomponents[5] == ""
        nothing
    else 
        allcomponents[5]
    end
end