
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