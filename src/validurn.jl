"True if s is a valid Cite2Urn."
function validurn(s::AbstractString)::Bool
    toplevel = components(s)
   
    # urn:cite2:ns:coll:obj
    if size(toplevel, 1) != 5
        throw(ArgumentError("Invalid string `$(s)`: Cite2Urns must have five top-level components."))
    elseif toplevel[1] != "urn"
        throw(ArgumentError("Invalid string `$(s)`: URNs must begin with `urn:`."))
    elseif toplevel[2] != "cite2"
        throw(ArgumentError("Invalid string `$(s)`: the URN type must be `cite2`."))
    elseif toplevel[3] == ""
        throw(ArgumentError("Invalid string `$(s)`: CITE namespace cannot be empty."))
    elseif toplevel[4] == ""
        throw(ArgumentError("Invalid string `$(s)`: CITE collection identifer cannot be empty."))
    elseif length(split(toplevel[4], ".")) > 3
        throw(ArgumentError("Invalid string `$(s)`: too many parts in collection component $(toplevel[4])."))
    else
        true
    end
end