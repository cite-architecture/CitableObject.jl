
"""
$(SIGNATURES)
True if String has a subreference.
"""
function hassubref(obj::AbstractString)::Bool
    if isrange(obj)
        hassubref(rangebegin(obj)) || hassubref(rangeend(obj))
        #throw(ArgumentError("Function `hassubref` applies only to single-node URNs or passage-component Strings not to ranges like `$(obj)`."))
    else
        # Kludge to work around some kind of error when first
        # range element is empty
        if obj == ""
            false
        elseif obj[1] == "@"
            throw(ArgumentError("Invalid passage component `$(obj)`.  Subreference without canonical node reference."))
        end

        refparts = split(obj,"@")
        partcount = size(refparts,1)
        if (partcount > 2)
            throw(ArgumentError("Invalid passage component `$(obj)`.  Too many @-delimited parts."))
        elseif partcount == 2
            if "" in refparts
                throw(ArgumentError("Invalid passage component `$(obj)`.  Subreference may not be empty."))
            else
                true
            end

        else
            # No subref if 0 or 1 part
            false
        end
    end
end

"""
$(SIGNATURES)
True if `urn` has a subreference.
"""
function hassubref(urn::Cite2Urn)::Bool
    if objectcomponent(urn) === nothing
        false
    else
        hassubref(objectcomponent(urn))
    end
end

"""
$(SIGNATURES)
Extract subreference from a string.
"""
function subref(s::AbstractString)
    segments = split(s,"@")
    count = size(segments,1)
    if count == 2
        sub = segments[2]
        sub
    elseif count > 2
        throw(ArgumentError("Invalid subreference syntax `$(s)`.  Too many `@` characters."))
    else
        ""
    end
end

"""
$(SIGNATURES)
Extract subreference from a URN.
"""
function subref(u::Cite2Urn)
    if objectcomponent(u) === nothing
        nothing
    else
        subref(objectcomponent(u))
    end
end


"""
$(SIGNATURES)
Remove any subreference substrings in a string.
If `s` is a range expression, separately drop subreference
from each of range-begin and range-end parts.
"""
function dropsubref(s::AbstractString)
    if isrange(s)
        r1parts = split(rangebegin(s),"@")
        r2parts = split(rangeend(s),"@")
        r1parts[1] * "-" * r2parts[1]
    else 
        parts = split(s, "@")
        parts[1]
    end
end


"""
$(SIGNATURES)
Remove any subreferences from a CtsUrn.
"""
function dropsubref(u::Cite2Urn)
    trimmed = dropsubref(objectcomponent(u))
    Cite2Urn(dropobject(u).urn * trimmed)
end

