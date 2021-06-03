

"""
Create a new Cite2Urn by dropping the object component
of a given Cite2Urn.

$(SIGNATURES)
"""
function dropobject(u::Cite2Urn)::Cite2Urn
    save = components(u.urn)[1:4]
    newarray = push!(save,"")
    newstring = join(newarray,":")
    Cite2Urn(newstring)
end

"""Create a new Cite2Urn by setting the object component
of a given Cite2Urn to a given value.

$(SIGNATURES)
"""
function addobject(u::Cite2Urn, objid::AbstractString)::Cite2Urn
    
    newstring = string(dropobject(u).urn, objid)
    Cite2Urn(newstring)
end


function dropversion(u::Cite2Urn)::Cite2Urn
    save = components(u.urn)[1:3]
    push!(save, collectionid(u))
    push!(save, objectcomponent(u))
    join(save, ":") |> Cite2Urn

end

function addversion(u::Cite2Urn, versid::AbstractString)::Cite2Urn
    save = components(u.urn)[1:3]
    newversion = string(collectionid(u), ".", versid)
    push!(save, newversion)
    push!(save, objectcomponent(u))
    join(save, ":") |> Cite2Urn
end