

"""
$(SIGNATURES)
Create a new Cite2Urn by dropping the object component
of a given Cite2Urn.
"""
function dropobject(u::Cite2Urn)::Cite2Urn
    save = components(u.urn)[1:4]
    newarray = push!(save,"")
    newstring = join(newarray,":")
    Cite2Urn(newstring)
end