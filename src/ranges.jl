"""
$(SIGNATURES)
True if `obj` is a range expression.
"""
function isrange(obj::AbstractString)::Bool
    # Kludge to work around some kind of error when first
    # range element is empty
    if obj === nothing || obj == ""
        false
    elseif obj[1] == "-"
        throw(ArgumentError("Invalid object identifer `$(obj)`.  Range parts may not be empty."))
    end

    rangeparts = split(obj,"-")
    partcount = size(rangeparts,1)
    if (partcount > 2)
        throw(ArgumentError("Invalid object identifer `$(obj)`.  Too many hyphen-delimited parts."))
    elseif partcount == 2
        if "" in rangeparts
            throw(ArgumentError("Invalid object identifer `$(obj)`.  Range parts may not be empty."))
        else
            true
        end

    else
        # Not a range if 0 or 1 part
        false
    end
end


"""
$(SIGNATURES)
True if the object component of `urn` is a range expression.
"""
function isrange(urn::Cite2Urn)::Bool
    if objectcomponent(urn) === nothing
        false
    else 
        isrange(objectcomponent(urn))
    end
end




"""
$(SIGNATURES)
Extract first part from a range expression.
"""
function rangebegin(s::AbstractString)::AbstractString
    try
        if isrange(s)
            rangeparts = split(s,"-")
            rangeparts[1]
        else
            throw(ArgumentError("Object identifier $(s) is not a range."))
        end
    catch e
        throw(e)
    end
end


"""
$(SIGNATURES)
Extract first range part from a URN's object identifier.
"""
function rangebegin(u::Cite2Urn)::AbstractString
    if objectcomponent(u) ===  nothing
        throw(ArgumentError("URN `$(u.urn)` is not a range."))
    else 
        rangebegin(objectcomponent(u))
    end
end



"""
$(SIGNATURES)
Extract second part from a range expression.
"""
function rangeend(s::AbstractString)::AbstractString
    try
        if isrange(s)
            rangeparts = split(s,"-")
            rangeparts[2]
        else
            throw(ArgumentError("Object identifier $(s) is not a range."))
        end
    catch e
        throw(e)
    end
end


"""
$(SIGNATURES)
Extract second range part from a URN's object identifier.
"""
function rangeend(urn::Cite2Urn)::AbstractString
    if objectcomponent(urn) ===  nothing
        throw(ArgumentError("URN `$(urn.urn)` is not a range."))
    else
        rangeend(objectcomponent(urn))
    end
end