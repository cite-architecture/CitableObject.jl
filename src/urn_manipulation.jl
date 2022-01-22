


"""
Create a new Cite2Urn by dropping the version part
of a given Cite2Urn.

$(SIGNATURES)
"""
function dropversion(u::Cite2Urn)::Cite2Urn
    save = components(u.urn)[1:3]
    push!(save, collectionid(u))
    objpart = objectcomponent(u)
    isnothing(objpart) ? push!(save, "") : push!(save, objpart)
    join(save, ":") |> Cite2Urn

end


"""Create a new Cite2Urn by setting the version part
of a given Cite2Urn to a given value.

$(SIGNATURES)
"""
function addversion(u::Cite2Urn, versid::AbstractString)::Cite2Urn
    save = components(u.urn)[1:3]
    newversion = string(collectionid(u), ".", versid)
    push!(save, newversion)
    objpart = objectcomponent(u)
    isnothing(objpart) ? push!(save, "") : push!(save, objpart)
    join(save, ":") |> Cite2Urn
end


"""Create a new Cite2Urn by setting the version part
of a given Cite2Urn to a given value.

$(SIGNATURES)
"""
function addproperty(u::Cite2Urn, propid::AbstractString)::Cite2Urn
    save = components(u.urn)[1:3]
    newversion = string(collectionid(u), ".", versionid(u), ".", propid)
    push!(save, newversion)
    if ! isnothing(objectcomponent(u))
        push!(save, objectcomponent(u))
        join(save, ":") |> Cite2Urn
    else
        join(save, ":") * ":" |> Cite2Urn
    end
    
end

"""
Create a new Cite2Urn by dropping the version part
of a given Cite2Urn.

$(SIGNATURES)
"""
function dropproperty(u::Cite2Urn)::Cite2Urn
    save = components(u.urn)[1:3]
    newversion = string(collectionid(u), ".", versionid(u))
    push!(save, newversion)
    if isnothing(objectcomponent(u)) 
        rejoined = join(save, ":") * ":"
        rejoined |> Cite2Urn
    else
        push!(save, objectcomponent(u))
        join(save, ":") |> Cite2Urn
    end
    
end



"""Create a new Cite2Urn by setting the object identifier
of a given Cite2Urn to a given value.

$(SIGNATURES)
"""
function addobject(u::Cite2Urn, objid::AbstractString)::Cite2Urn
  dropobject(u).urn * objid |> Cite2Urn
end



"""Create a new Cite2Urn by dropping the object identifier
of a given Cite2Urn to a given value.

$(SIGNATURES)
"""
function dropobject(u::Cite2Urn)::Cite2Urn
    join(components(u.urn)[1:4], ":") * ":" |> Cite2Urn
end